import 'package:flutter/material.dart';
import 'package:realmon_demo/WatcherGroup.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

import 'Extensions.dart';


class MainAppWidget extends StatelessWidget {
  const MainAppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: FlexibleHeaderDelegate(
              statusBarHeight: MediaQuery.of(context).padding.top,
              expandedHeight: 240,
              background: MutableBackground(
                expandedWidget: Image.asset(
                  'assets/images/main_header.jpg',
                  fit: BoxFit.cover,
                ),
                collapsedColor: primaryColor,
              ),
              actions: [
                /* todo: alternative: IconButtons vs FlexibleHeaderItem?
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                  },
                ),*/
              ],
              children: [
                FlexibleHeaderItem(
                  expandedAlignment: Alignment.topRight,
                  collapsedAlignment: Alignment.centerRight,
                  //options: const [HeaderItemOptions.hide],
                  expandedPadding: const EdgeInsets.only(right: 10, top: 50),
                  collapsedPadding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      getHeaderButtonWidget(Icons.favorite),
                      getHeaderButtonWidget(Icons.search),
                      getHeaderButtonWidget(Icons.remove_red_eye),
                    ],
                  ),
                ),
                FlexibleTextItem(
                  text: 'Real Monitor',
                  collapsedStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  expandedStyle: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
                  expandedAlignment: Alignment.bottomLeft,
                  collapsedAlignment: Alignment.center,
                  expandedPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ],
            ),
          ),
          const _MainPageList(),
        ],
      ),
    );
  }


  Widget getHeaderButtonWidget(IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        radius: 5,
        onTap: () {},
        child: Icon(
          iconData,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }


}



class _MainPageList extends StatelessWidget {
  const _MainPageList({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SliverToBoxAdapter(
        child: FutureBuilder<List<WatcherGroup>>(
            future: WatcherGroup.fetchWatcherGroups(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("hasError:\n${snapshot.error}");
                return Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Center(
                    child: Text(
                      'An error has occurred!\n\n${snapshot.error?.toString()}',
                      style: const TextStyle(fontSize: 17),
                      maxLines: 20,
                    ),
                  ),
                );
              } else if (!snapshot.hasData) {
                return
                  const Padding(
                    padding: EdgeInsets.all(100.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
              } else {
                List<WatcherGroup> items = snapshot.data!;
                return Column(
                  children: getWatcherGroups(items),
                );

              }
            }
        ),
      );

  }

  List<Widget> getWatcherGroups(List<WatcherGroup> items) {
    List<Widget> list = [];
    /* todo: final code:
    for (WatcherGroup item in items) {
      list.add(getWatcherGroupWidget(item));
    }*/
    // todo: temp for many rows
    for (int i = 0; i < 5; i++) {
      list.add(getWatcherGroupWidget(items[0]));
    }
    return list;
  }

  Widget getWatcherGroupWidget(WatcherGroup item) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(10.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "${item.getAssignmentTypeName()} ${item.getEstateTypesName()}",
                      style: const TextStyle(
                          fontSize: 17
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.getLocations()),
                      Text("Ár:" + item.getMinMaxPrice()),
                      Text("Alapterület" + item.getMinMaxFloorArea()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          size: 30,
                          Icons.delete,
                          color: MyGray2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          size: 30,
                          Icons.notifications,
                          color: MyGray2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          size: 30,
                          Icons.edit,
                          color: MyGray2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ;
  }

}
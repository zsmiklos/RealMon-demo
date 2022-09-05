import 'package:flutter/material.dart';
import 'package:realmon_demo/WatcherGroup.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

import 'Extensions.dart';


class MainAppWidget extends StatelessWidget {
  const MainAppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyWhite3,
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
                      style: const TextStyle(
                        fontSize: 17,
                        color: MyGray1,
                      ),
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
                return Container(
                  color: MyWhite3,
                  child: Column(
                    children: getWatcherGroups(items),
                  ),
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
    for (int i = 0; i < 3; i++) {
      list.add(getWatcherGroupWidget(items[0]));
    }
    return list;
  }

  Widget getWatcherGroupWidget(WatcherGroup item) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
            color: MyWhite5,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: MyWhite2,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 2, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // title
                Padding(
                  padding: const EdgeInsets.only(bottom: 0, left: 10),
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: MyGray1,
                    ),
                  ),
                ),
                //subtitle
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 10),
                  child: Text(
                    "${item.getAssignmentTypeName()} ${item.getEstateTypesName()}",
                    style: const TextStyle(
                      fontSize: 17,
                      color: MyGray1,
                    ),
                  ),
                ),

                // inner block
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      color: MyWhite4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // city
                                Container(
                                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 12),
                                  decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide(color: MyWhite2)),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        item.getLocations(),
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: MyGray1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // price
                                Container(
                                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 12),
                                  decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide(color: MyWhite2)),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          "Ár",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: MyGray1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child:
                                        Text(
                                          item.getMinMaxPrice(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: MyGray1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // m2
                                Container(
                                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 12),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 120,
                                        child: Text(
                                          "Alapterület",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: MyGray1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          item.getMinMaxFloorArea(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: MyGray1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        size: 35,
                        color: MyGray2,
                      ),
                      tooltip: "Törlés",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 35,
                        color: MyGray2,
                      ),
                      tooltip: "Értesítés",
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 35,
                        color: MyGray2,
                      ),
                      tooltip: "Módosítás",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ;
  }

}
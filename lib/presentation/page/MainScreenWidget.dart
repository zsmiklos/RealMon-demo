import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

import '../../config/AppConfig.dart';
import '../widget/WatcherGroupListWidget.dart';


class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppConfig.white3,
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
                collapsedColor: AppConfig.primaryColor,
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
                  text: 'Real Monitor'.tr(),
                  collapsedStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  expandedStyle: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
                  expandedAlignment: Alignment.bottomLeft,
                  collapsedAlignment: Alignment.center,
                  expandedPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ],
            ),
          ),
          const WatcherGroupListWidget(),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }


}







import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realmon_demo/data/repository/WatcherGroupRepositoryImpl.dart';
import 'package:realmon_demo/domain/entity/WatcherGroup.dart';

import '../../config/AppConfig.dart';
import 'WatcherGroupWidget.dart';


class WatcherGroupListWidget extends StatefulWidget {
  const WatcherGroupListWidget({super.key});

  @override
  State<WatcherGroupListWidget> createState() => _WatcherGroupListWidgetState();
}

class _WatcherGroupListWidgetState extends State<WatcherGroupListWidget> {

  @override
  Widget build(BuildContext context) {
    return
      SliverToBoxAdapter(
        child: FutureBuilder<List<WatcherGroup>>(
            future: Provider.of<WatcherGroupRepositoryImpl>(context).fetchWatcherGroups(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                //print("hasError:\n${snapshot.error}");
                return Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Center(
                    child: Text(
                      '${'An error has occurred!'.tr()}\n\n${snapshot.error?.toString()}',
                      style: const TextStyle(
                        fontSize: 17,
                        color: AppConfig.gray1,
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
                  color: AppConfig.white3,
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
    for (final WatcherGroup item in items) {
      list.add(getWatcherGroupWidget(item));
    }*/
    // todo: temp for many rows
    for (int i = 0; i < 3; i++) {
      list.add(
          WatcherGroupWidget(items[0])
      );
    }
    return list;
  }

}

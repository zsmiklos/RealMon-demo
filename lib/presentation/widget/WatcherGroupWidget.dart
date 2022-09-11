import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realmon_demo/domain/entity/WatcherGroup.dart';

import '../../config/AppConfig.dart';


class WatcherGroupWidget extends StatelessWidget {
  final WatcherGroup item;

  const WatcherGroupWidget(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
            color: AppConfig.white5,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppConfig.white2,
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
                      color: AppConfig.gray1,
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
                      color: AppConfig.gray1,
                    ),
                  ),
                ),

                // inner block
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      color: AppConfig.white4,
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
                                    border: Border(bottom: BorderSide(color: AppConfig.white2)),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        item.getLocations(),
                                        style: const TextStyle(
                                          fontSize: 17,
                                          color: AppConfig.gray1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // price
                                Container(
                                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 12),
                                  decoration: const BoxDecoration(
                                    border: Border(bottom: BorderSide(color: AppConfig.white2)),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          "Price".tr(),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: AppConfig.gray1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child:
                                        Text(
                                          item.getMinMaxPrice(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: AppConfig.gray1,
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
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          "Floor area".tr(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: AppConfig.gray1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          item.getMinMaxFloorArea(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: AppConfig.gray1,
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
                        color: AppConfig.gray2,
                      ),
                      tooltip: "Delete".tr(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        size: 35,
                        color: AppConfig.gray2,
                      ),
                      tooltip: "Notification".tr(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 35,
                        color: AppConfig.gray2,
                      ),
                      tooltip: "Modify".tr(),
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
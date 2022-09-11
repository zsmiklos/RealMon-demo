
import 'package:easy_localization/easy_localization.dart';
import 'package:realmon_demo/data/dto/WatcherGroupLocationDTO.dart';

import '../../data/dto/WatcherGroupDTO.dart';
import 'WatcherGroupLocation.dart';


class WatcherGroup {
  final bool isNotificationEnabled;
  final bool privateAdvertisersOnly;
  final bool filterOutSuspiciousItems;
  final bool onlyPolisWithPictures;
  final String nameSpace;
  final List<WatcherGroupLocation> locations;
  final String name;
  final String assignmentType;
  final List? estateTypes;
  final int? createTime;
  final bool? usesUmbrella;
  final int? id;
  final int? minPrice;
  final int? maxPrice;
  final int? minFloorArea;
  final int? maxFloorArea;
  final int? minUnitPrice;
  final int? maxUnitPrice;

  const WatcherGroup({
    required this.isNotificationEnabled,
    required this.privateAdvertisersOnly,
    required this.filterOutSuspiciousItems,
    required this.onlyPolisWithPictures,
    required this.nameSpace,
    required this.locations,
    required this.name,
    required this.assignmentType,
    required this.estateTypes,
    required this.createTime,
    required this.usesUmbrella,
    required this.id,
    required this.minPrice,
    required this.maxPrice,
    required this.minFloorArea,
    required this.maxFloorArea,
    required this.minUnitPrice,
    required this.maxUnitPrice,
  });


  factory WatcherGroup.fromDTOtoEntity(WatcherGroupDTO dto) {
    List<WatcherGroupLocation> locs = [];
    for (final WatcherGroupLocationDTO lDTO in dto.locations) {
      locs.add(WatcherGroupLocation.fromDTOtoEntity(lDTO));
    }

    return WatcherGroup(
      isNotificationEnabled: dto.isNotificationEnabled,
      privateAdvertisersOnly: dto.privateAdvertisersOnly,
      filterOutSuspiciousItems: dto.filterOutSuspiciousItems,
      onlyPolisWithPictures: dto.onlyPolisWithPictures,
      nameSpace: dto.nameSpace,
      locations: locs,
      name: dto.name,
      assignmentType: dto.assignmentType,
      estateTypes: dto.estateTypes,
      createTime: dto.createTime,
      usesUmbrella: dto.usesUmbrella,
      id: dto.id,
      minPrice: dto.minPrice,
      maxPrice: dto.maxPrice,
      minFloorArea: dto.minFloorArea,
      maxFloorArea: dto.maxFloorArea,
      minUnitPrice: dto.minUnitPrice,
      maxUnitPrice: dto.maxUnitPrice,
    );
  }


  // util

  String getAssignmentTypeName() {
    if ("FOR_SALE" == assignmentType) {
      return "for sale".tr();
    }
    return "";
  }

  String getEstateTypesName() {
    StringBuffer sb = StringBuffer();
    if (estateTypes!= null && estateTypes!.contains("HOUSE")) {
      if (sb.isNotEmpty) {
        sb.write(", ");
      }
      sb.write("House".tr());
    }
    if (estateTypes!= null && estateTypes!.contains("FLAT")) {
      if (sb.isNotEmpty) {
        sb.write(", ");
      }
      sb.write("Flat".tr());
    }
    return sb.toString();
  }


  String getLocations() {
    String str = "";
    for (final WatcherGroupLocation location in locations) {
      String city = location.adminLevels["8"];
      if (str.isNotEmpty) {
        str += ", ";
      }
      str += city;
    }
    return str;
  }

  String getMinMaxPrice() {
    String str = "";
    String minStr = "";
    if (minPrice != null) {
      minStr = (minPrice! ~/ 1000000).toString();
    }
    String maxStr = "";
    if (maxPrice != null) {
      maxStr = (maxPrice! ~/ 1000000).toString();
    }
    if (minStr.isNotEmpty && maxStr.isNotEmpty) {
      str = "$minStr - $maxStr";
    } else if (minStr.isNotEmpty) {
      str = "$minStr+ ";
    } else if (maxStr.isNotEmpty) {
      str = " - $maxStr";
    }
    if (str.isNotEmpty) {
      str += " ${"million forints".tr()}";
    }
    return str;
  }

  String getMinMaxFloorArea() {
    String str = "";
    String minStr = "";
    if (minFloorArea != null) {
      minStr = minFloorArea!.toString();
    }
    String maxStr = "";
    if (maxFloorArea != null) {
      maxStr = maxFloorArea!.toString();
    }
    if (minStr.isNotEmpty && maxStr.isNotEmpty) {
      str = "$minStr - $maxStr";
    } else if (minStr.isNotEmpty) {
      str = "$minStr+ ";
    } else if (maxStr.isNotEmpty) {
      str = " - $maxStr";
    }
    if (str.isNotEmpty) {
      str += " m2";
    }
    return str;
  }


}



/* sample
{
  "isNotificationEnabled":true,
  "privateAdvertisersOnly":false,
  "filterOutSuspiciousItems":true,
  "onlyPolisWithPictures":true,
  "nameSpace":"hu",
  "locations":[
    {
      "accessTokens":[
        v1-NGjMb89DhXVjdFH2qe2Y9s9nivaCNaDNCDmkvsdRhok
      ],
      "adminLevels":{
        "6":"Nógrád megye",
        "8":"Zabar"
      },
      "nameSpace":"hu",
      "ids":[
        ChIJG2dAGsJwQEcRAHgeDCnEAAQ
      ]
    },
    {
      "accessTokens":[
        v1-lv3CMtHjZyVTRCqNyCEmHsakmSAMa0bpsxi3Wr1QjqE
      ],
      "adminLevels":{
        "6":"Veszprém",
        "8":"Csesznek"
      },
      "nameSpace":"hu",
      "ids":[
        "ChIJTZZvGMgqakcRQGAeDCnEAAQ"
      ]
    }
  ],
  "name":"Sus",
  "assignmentType":"FOR_SALE",
  "estateTypes":[
    "HOUSE"
  ],
  "createTime":1658740743732,
  "usesUmbrella":true,
  "id":null,
  "minPrice":69000000,
  "maxPrice":420000000,
  "minFloorArea":80,
  "maxFloorArea":null,
  "minUnitPrice":null,
  "maxUnitPrice":null
}
*/

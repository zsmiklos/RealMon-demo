
import 'dart:convert';

import 'package:http/http.dart' as http;

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
  final List estateTypes;
  final int createTime;
  final bool usesUmbrella;
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

  factory WatcherGroup.fromJson(Map<String, dynamic> json) {
    List loc0 = json['locations'];
    List<WatcherGroupLocation> loc = loc0.map((item) => WatcherGroupLocation.fromJson(item)).toList();

    return WatcherGroup(
      isNotificationEnabled: json['isNotificationEnabled'],
      privateAdvertisersOnly: json['privateAdvertisersOnly'],
      filterOutSuspiciousItems: json['filterOutSuspiciousItems'],
      onlyPolisWithPictures: json['onlyPolisWithPictures'],
      nameSpace: json['nameSpace'],
      locations: loc,
      name: json['name'],
      assignmentType: json['assignmentType'],
      estateTypes: json['estateTypes'],
      createTime: json['createTime'],
      usesUmbrella: json['usesUmbrella'],
      id: json['id'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
      minFloorArea: json['minFloorArea'],
      maxFloorArea: json['maxFloorArea'],
      minUnitPrice: json['minUnitPrice'],
      maxUnitPrice: json['maxUnitPrice'],
    );
  }

  // util

  static Future<List<WatcherGroup>> fetchWatcherGroups() async {
    // get json data
    final response = await http.Client().get(
        Uri.parse('https://angolszotanito.hu/realm-demo.php')
    );
    if (response.statusCode == 200) {
      Iterable parsed = jsonDecode(response.body);
      return parsed.map((item) => WatcherGroup.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  String getAssignmentTypeName() {
    if ("FOR_SALE" == assignmentType) {
      return "eladó";
    }
    return "";
  }

  String getEstateTypesName() {
    String str = "";
    if (estateTypes!= null && estateTypes.contains("HOUSE")) {
      if (str.isNotEmpty) {
        str += ", ";
      }
      str += "Ház";
    }
    if (estateTypes!= null && estateTypes.contains("FLAT")) {
      if (str.isNotEmpty) {
        str += ", ";
      }
      str += "Lakás";
    }
    return str;
  }


  String getLocations() {
    String str = "";
    for (WatcherGroupLocation location in locations) {
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
      str += " millió Forint";
    }
    return str;
  }

  String getMinMaxFloorArea() {
    String str = "";
    String minStr = "";
    if (minFloorArea != null) {
      minStr = (minFloorArea! ~/ 1000000).toString();
    }
    String maxStr = "";
    if (maxFloorArea != null) {
      maxStr = (maxFloorArea! ~/ 1000000).toString();
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

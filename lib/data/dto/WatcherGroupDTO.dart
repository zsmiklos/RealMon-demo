
import 'WatcherGroupLocationDTO.dart';


class WatcherGroupDTO {
  final bool isNotificationEnabled;
  final bool privateAdvertisersOnly;
  final bool filterOutSuspiciousItems;
  final bool onlyPolisWithPictures;
  final String nameSpace;
  final List<WatcherGroupLocationDTO> locations;
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

  const WatcherGroupDTO({
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

  factory WatcherGroupDTO.fromJson(Map<String, dynamic> json) {
    List loc0 = json['locations'];
    List<WatcherGroupLocationDTO> loc = loc0.map((item) => WatcherGroupLocationDTO.fromJson(item)).toList();

    return WatcherGroupDTO(
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

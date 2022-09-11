
class WatcherGroupLocationDTO {
  final List accessTokens;
  final Map adminLevels;
  final String nameSpace;
  final List ids;

  const WatcherGroupLocationDTO({
    required this.accessTokens,
    required this.adminLevels,
    required this.nameSpace,
    required this.ids,
  });

  factory WatcherGroupLocationDTO.fromJson(Map<String, dynamic> json) {
    return WatcherGroupLocationDTO(
      accessTokens: json['accessTokens'],
      adminLevels: json['adminLevels'],
      nameSpace: json['nameSpace'],
      ids: json['ids'],
    );
  }

}


/* sample
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
*/

class WatcherGroupLocation {
  final List accessTokens;
  final Map adminLevels;
  final String nameSpace;
  final List ids;

  const WatcherGroupLocation({
    required this.accessTokens,
    required this.adminLevels,
    required this.nameSpace,
    required this.ids,
  });

  factory WatcherGroupLocation.fromJson(Map<String, dynamic> json) {
    return WatcherGroupLocation(
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
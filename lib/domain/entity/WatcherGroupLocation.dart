
import 'package:realmon_demo/data/dto/WatcherGroupLocationDTO.dart';

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


  factory WatcherGroupLocation.fromDTOtoEntity(WatcherGroupLocationDTO dto) {
    return WatcherGroupLocation(
      accessTokens: dto.accessTokens,
      adminLevels: dto.adminLevels,
      nameSpace: dto.nameSpace,
      ids: dto.ids,
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
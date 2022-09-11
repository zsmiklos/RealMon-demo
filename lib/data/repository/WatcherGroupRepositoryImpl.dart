
import '../../domain/entity/WatcherGroup.dart';
import '../datasource/WatcherGroupRemoteDataSource.dart';
import '../dto/WatcherGroupDTO.dart';

class WatcherGroupRepositoryImpl {
  late WatcherGroupRemoteDataSource remoteDataSource;

  WatcherGroupRepositoryImpl({
    required this.remoteDataSource,
  }) {
  }

  @override
  Future<List<WatcherGroup>> fetchWatcherGroups() async {
    try {
      List<WatcherGroupDTO> dtoList = await remoteDataSource.fetchWatcherGroups();

      List<WatcherGroup> list = [];
      for (WatcherGroupDTO dto in dtoList) {
        list.add(WatcherGroup.fromDTOtoEntity(dto));
      }

      return list;
    } on Exception catch (e) {
      rethrow;
    }
  }
}

import '../entity/WatcherGroup.dart';

abstract class WatcherGroupRepository {

  Future<List<WatcherGroup>> fetchWatcherGroups();

}
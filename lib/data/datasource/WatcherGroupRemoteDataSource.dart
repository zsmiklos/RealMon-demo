import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

import '../dto/WatcherGroupDTO.dart';


class WatcherGroupRemoteDataSource {

  late http.Client client;

  WatcherGroupRemoteDataSource() {
    client = http.Client();
  }

  Future<List<WatcherGroupDTO>> fetchWatcherGroups() async {
    // get json data
    final response = await client.get(
        Uri.parse('https://angolszotanito.hu/realm-demo.php')
    );
    if (response.statusCode == 200) {
      Iterable parsed = jsonDecode(response.body);
      return parsed.map((item) => WatcherGroupDTO.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load items'.tr());
    }
  }


}
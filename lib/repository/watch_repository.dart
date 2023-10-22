

import 'package:netflix_clone/model/watch.dart';
import 'package:netflix_clone/repository/watch_db_service.dart';

class WatchRepository {
  final WatchDbService _watchDbService = WatchDbService();

  Future<List<Watch>> getWatchListContains(String value) async {
    return (await _watchDbService.fetchWatchList())
      .where((watch) => watch.name.toLowerCase().contains(value))
      .toList();
  }
}
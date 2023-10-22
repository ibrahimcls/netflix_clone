

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:netflix_clone/model/watch.dart';

class WatchDbService {
  static final WatchDbService _watchDbService = WatchDbService._interval();

  WatchDbService._interval();

  factory WatchDbService() {
    return _watchDbService;
  }

  Future<List<Watch>> fetchWatchList() async{
    final String jsonString = await rootBundle.loadString('assets/movie.json');
    final Map<String, dynamic> data = json.decode(jsonString);
    final List< dynamic> results = data['results'];

    return results
      .map((movieJson) => Watch.fromJson(movieJson))
      .toList();
  }
}
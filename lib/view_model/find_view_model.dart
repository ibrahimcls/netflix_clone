import 'package:flutter/material.dart';
import 'package:netflix_clone/model/watch.dart';
import 'package:netflix_clone/repository/watch_repository.dart';

class FindViewModel extends ChangeNotifier {
  bool _disposed = false;
  final List<Watch> _foundList = [];

  List<Watch> get foundList => _foundList;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  void updateList(String filter) {
    WatchRepository().getWatchListContains(filter).then((value) =>
        {_foundList.clear(), _foundList.addAll(value), notifyListeners()});
  }
}

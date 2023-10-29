import 'package:flutter/material.dart';
import 'package:netflix_clone/model/watch.dart';
import 'package:netflix_clone/view/find/find_view.dart';
import 'package:netflix_clone/view/home/home_page.dart';
import 'package:netflix_clone/view/launcher/launcher.dart';
import 'package:netflix_clone/view/watch/watch_page.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: navigatorKey,
    home: const Launcher(),
    routes: <String, WidgetBuilder>{
      'home': (context) => const HomePage(),
      'find': (context) => const FindView(),
      //'videoplayer': (context) => const VideoPlayerScreen(),
      'watch': (context) =>
          WatchPage(watch: ModalRoute.of(context)!.settings.arguments as Watch),
    },
  ));
}

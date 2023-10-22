
import 'package:flutter/material.dart';
import 'package:netflix_clone/view/launcher/launcher.dart';

void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: navigatorKey,
    home: const Launcher(),
    routes: <String,WidgetBuilder>{
      // 'home': (context) => const HomePage(),
      // 'find': (context) => const FindView(),
      // 'videoplayer': (context) => const VideoPlayerScreen(),
      // 'watch': (context) => WatchPage(watch: ModuleRoute.of(context)!.settings.arguments as Watch),
    },
  ));
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/common/dump_data.dart';
import 'package:netflix_clone/view/home/home_page_watch_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: appBar(),
              extendBodyBehindAppBar: true,
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      pano("wednesday.jpg"),
                      continueWatching(),
                      HomePageWatchList(
                          watchList: DumpData.onAgendaWatchList,
                          title: "On Agenda"),
                      HomePageWatchList(
                          watchList: DumpData.watchList,
                          title: "Watch It Again"),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            width: double.infinity,
            height: 60,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "for ibrahim",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .pushNamed("/find"),
                  child: Image.asset("assets/icons/find.png"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  pano(String s) {}

  continueWatching() {}
}

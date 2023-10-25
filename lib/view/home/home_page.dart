import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/common/colors.dart';
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

  Widget pano(String image) {
    return FutureBuilder(
      future: ColorUtil(context).calculateAverageColor(image),
      builder: (BuildContext context, AsyncSnapshot<Color> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          );
        } else {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [snapshot.data!, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              padding: EdgeInsets.fromLTRB(
                  25, AppBar().preferredSize.height + 20, 25, 10),
              child: SizedBox(
                width: double.infinity,
                height: 450,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xCCFFFFFF), width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage("assets/watch/$image"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              //TODO
                              ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  continueWatching() {}
}

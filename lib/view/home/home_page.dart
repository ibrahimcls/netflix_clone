import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/common/colors.dart';
import 'package:netflix_clone/common/dump_data.dart';
import 'package:netflix_clone/view/home/continue_watch_card.dart';
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
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            gradient: LinearGradient(
                              colors: [Colors.transparent, snapshot.data!],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: Column(
                            children: [
                              const Text(
                                "Drama",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    panoButton("Oynat", "play.png", 0xffffffff,
                                        0xff000000),
                                    panoButton("Listem", "plus.png", 0xff253737,
                                        0xffffffff)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget panoButton(
      String buttonText, String image, int bgColor, int titleTextColor) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: Color(bgColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/$image", width: 15, height: 15),
            const SizedBox(width: 10),
            Text(
              buttonText,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color(titleTextColor)),
            )
          ],
        ),
      ),
    );
  }

  Widget continueWatching() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 9),
            child: Text(
              "Continue Watching",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                backgroundColor: Colors.black,
              ),
            ),
          ),
          Container(
            height: 180.sp,
            color: Colors.black,
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  ContinueWatchCard(image: DumpData.continueWatchList[index]),
              separatorBuilder: (context, index) => SizedBox(width: 16.sp),
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}

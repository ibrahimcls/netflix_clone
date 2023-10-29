import 'package:flutter/material.dart';
import 'package:netflix_clone/common/extensions.dart';
import 'package:netflix_clone/model/movie.dart';
import 'package:netflix_clone/model/series.dart';
import 'package:netflix_clone/model/watch.dart';

class WatchPage extends StatefulWidget {
  final Watch watch;

  const WatchPage({super.key, required this.watch});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListView(
        children: [
          trailer(),
          watchType(),
          watchName(),
          otherInfo(),
          //playButton(),
          //downloadButton()
          //description(),
          //operationBar(),
          //tabBar(),
        ],
      ),
    );
  }

  Widget trailer() {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Color(0xff292929),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Center(
              child: Image.asset("assets/icons/play-large.png"),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: Row(
              children: [
                Image.asset("assets/icons/share_screen.png"),
                const SizedBox(width: 22),
                GestureDetector(
                  onTap: cancel,
                  child: Image.asset("assets/icons/cancel.png"),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
              child: const Text("Trainer"),
            ),
          ),
        ],
      ),
    );
  }

  cancel() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Widget watchType() {
    return Padding(
      padding: const EdgeInsets.only(top: 11, left: 8),
      child: Row(
        children: [
          Image.asset("assets/icons/netflix_n.png"),
          const SizedBox(width: 8),
          DefaultTextStyle(
            style: TextStyle(
              fontFamily: "Netflix",
              letterSpacing: 3,
              color: const Color(0xffb7b7b7),
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
            ),
            child: Text(widget.watch is Movie ? "MOVIE" : "SERIES"),
          ),
        ],
      ),
    );
  }

  Widget watchName() {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 8),
      child: DefaultTextStyle(
        style: TextStyle(
          fontFamily: "Netflix",
          letterSpacing: -0.25,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
        child: Text(widget.watch.name),
      ),
    );
  }

  Widget otherInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Row(
        children: [
          DefaultTextStyle(
            style: TextStyle(
              fontFamily: "Inter",
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 11.sp,
            ),
            child: Text(widget.watch.year.toString()),
          ),
          const SizedBox(width: 4),
          Container(
            width: 30,
            height: 14,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: Color(0xff575757),
            ),
            padding: const EdgeInsets.all(3),
            child: DefaultTextStyle(
              style: TextStyle(
                fontFamily: "Netflix",
                letterSpacing: 0.6,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 6.sp,
              ),
              child: const Text("TV-MA"),
            ),
          ),
          const SizedBox(width: 4),
          widget.watch is Series
              ? DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                  ),
                  child:
                      Text("${(widget.watch as Series).seasonCount} Seasons"),
                )
              : Container(),
          const SizedBox(width: 4),
          widget.watch.isVision
              ? Image.asset("assets/icons/video_quality_badges.png")
              : Container(),
          const SizedBox(width: 4),
          Image.asset("assets/icons/hd.png"),
          const SizedBox(width: 4),
          Image.asset("assets/icons/ad.png"),
        ],
      ),
    );
  }

  Widget playButton() {
    return Container();
  }
}

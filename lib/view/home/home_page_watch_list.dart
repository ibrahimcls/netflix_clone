import 'package:flutter/material.dart';
import 'package:netflix_clone/common/extensions.dart';
import 'package:netflix_clone/model/watch.dart';
import 'package:netflix_clone/view/home/home_watch_view.dart';

class HomePageWatchList extends StatefulWidget {
  final List<Watch> watchList;
  final String title;
  const HomePageWatchList(
      {super.key, required this.watchList, required this.title});

  @override
  State<HomePageWatchList> createState() => _HomePageWatchListState();
}

class _HomePageWatchListState extends State<HomePageWatchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.sp),
            child: Text(
              widget.title,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                backgroundColor: Colors.black,
              ),
            ),
          ),
          Container(
            height: 140.sp,
            color: Colors.black,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  HomeWatchView(watch: widget.watchList[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}

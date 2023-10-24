import 'package:flutter/material.dart';
import 'package:netflix_clone/common/extensions.dart';
import 'package:netflix_clone/model/watch.dart';

class HomeWatchView extends StatefulWidget {
  final Watch watch;
  const HomeWatchView({super.key, required this.watch});

  @override
  State<HomeWatchView> createState() => _HomeWatchViewState();
}

class _HomeWatchViewState extends State<HomeWatchView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context, rootNavigator: true)
            .pushNamed("/watch", arguments: widget.watch)
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        child: Image.asset(widget.watch.image, fit: BoxFit.fitWidth),
      ),
    );
  }
}

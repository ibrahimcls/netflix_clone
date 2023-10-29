import 'package:flutter/material.dart';
import 'package:netflix_clone/common/extensions.dart';
import 'package:netflix_clone/model/watch.dart';

class FindWatchView extends StatefulWidget {
  final Watch watch;
  const FindWatchView({super.key, required this.watch});

  @override
  State<FindWatchView> createState() => _FindWatchViewState();
}

class _FindWatchViewState extends State<FindWatchView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: Row(
          children: [
            Image(
              image: NetworkImage(widget.watch.image),
              fit: BoxFit.cover,
              width: 96,
              height: 54,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.watch.image,
                style: TextStyle(
                  fontFamily: 'Netflix',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff8c8c8c),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: Image.asset("assets/icons/play_find_watch.png"),
            )
          ],
        ),
      ),
    );
  }
}

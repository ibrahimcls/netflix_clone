import 'package:flutter/material.dart';
import 'package:netflix_clone/common/extensions.dart';

class EpisodeView extends StatefulWidget {
  final int index;
  const EpisodeView({super.key, required this.index});

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [image(), const SizedBox(width: 8), title()]),
        const SizedBox(height: 8),
        Text(
          "In this episode of Friends, humorous mishaps and heartfelt moments shape the characters' enduring bonds in New York City.",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: "Netflix",
            fontSize: 12.sp,
            color: const Color(0xffe2e2e2),
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }

  Widget image() {
    return Container(
      width: 124,
      height: 68,
      decoration: const BoxDecoration(
        color: Color(0x29ffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Center(
        child: Container(
          width: 27,
          height: 27,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.88),
            borderRadius: const BorderRadius.all(Radius.circular(22)),
          ),
          child: Image.asset("assets/icons/play_episode.png"),
        ),
      ),
    );
  }

  Widget title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.index + 1}. episode name",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: "Netflix",
            color: const Color(0xffe2e2e2),
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          "37 m",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 10.sp,
            fontFamily: "Netflix",
            color: const Color(0xff8c8c8c),
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}

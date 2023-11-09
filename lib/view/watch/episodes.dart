import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/extensions.dart';
import 'package:netflix_clone/model/series.dart';
import 'package:netflix_clone/view/watch/episode_view.dart';

class Episodes extends StatefulWidget {
  final Series series;
  const Episodes({super.key, required this.series});

  @override
  State<Episodes> createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  bool isSeasonSelection = false;
  int selectedSeason = 1;

  void seasonSelected(int i) {
    selectedSeason = i;
    setState(() {});
  }

  void openSelectedSeason() {
    isSeasonSelection = true;
    var selectedTextStyle = const TextStyle(
        color: Colors.white, fontSize: 20, fontFamily: "Netflix");

    var unSelectedTextStyle = const TextStyle(
        color: Color(0xff979797), fontSize: 16, fontFamily: "Netflix");

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, dialogState) {
            return Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ).blurred(
                  blur: 2.5,
                  blurColor: Colors.black,
                  overlay: Container(
                    padding: const EdgeInsets.only(top: 64),
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 15),
                    child: Center(
                      child: Column(
                        children: List.generate(
                          widget.series.seasonCount.length,
                          (index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () => dialogState(() {
                                    seasonSelected(index + 1);
                                    Future.delayed(
                                            const Duration(milliseconds: 250))
                                        .then(
                                      (value) => Navigator.pop(context, null),
                                    );
                                  }),
                                  child: AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,
                                    style: index + 1 == selectedSeason
                                        ? selectedTextStyle
                                        : unSelectedTextStyle,
                                    child: Text("${index + 1}. season"),
                                  ),
                                ),
                                const SizedBox(height: 32)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget episodes() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: List.generate(
          widget.series.seasonCount[selectedSeason - 1],
          (index) => Column(
            children: [EpisodeView(index: index), const SizedBox(height: 20)],
          ),
        ),
      ),
    );
  }

  Widget seasonSelect() {
    return GestureDetector(
      onTap: openSelectedSeason,
      child: Row(
        children: [
          Text(
            "Season $selectedSeason",
            style: TextStyle(
              fontFamily: "Netflix",
              fontSize: 12.sp,
              letterSpacing: 0.25,
              fontWeight: FontWeight.w300,
              color: const Color(0xffe2e2e2),
            ),
          ),
          const SizedBox(width: 6),
          Image.asset("assets/icons/chevron-down.png"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [seasonSelect(), episodes()]);
  }
}

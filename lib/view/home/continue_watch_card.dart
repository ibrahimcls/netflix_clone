import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/common/extensions.dart';

class ContinueWatchCard extends StatefulWidget {
  final String image;
  const ContinueWatchCard({super.key, required this.image});

  @override
  State<ContinueWatchCard> createState() => _ContinueWatchCardState();
}

class _ContinueWatchCardState extends State<ContinueWatchCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed("/videoplayer")
          .then(
            ((value) => SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp])),
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.sp),
          topRight: Radius.circular(10.sp),
        ),
        child: AspectRatio(
          aspectRatio: 0.54,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(widget.image, fit: BoxFit.fitWidth),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(8.sp),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.sp, color: Colors.white),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              progressBar(),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff191919),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.sp),
                      bottomRight: Radius.circular(10.sp)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/info.svg"),
                    SvgPicture.asset("assets/icons/more.svg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget progressBar() {
    return const SizedBox(
      width: double.infinity,
      height: 2,
      child: LinearProgressIndicator(
        backgroundColor: Color(0xffc7191a),
        value: 0.5,
      ),
    );
  }
}

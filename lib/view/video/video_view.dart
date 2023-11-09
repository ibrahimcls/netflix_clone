import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool isToolsVisible = true;
  late VideoPlayerController _videoPlayerController;
  DateTime? lastTouchTime;
  Timer? _lastTouchTimer;
  var position = Duration.zero;
  var duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    _videoPlayerController =
        VideoPlayerController.asset("assets/video/trailer.mp4")
          ..initialize().then((_) {
            if (mounted) {
              setState(() {});
            }
          })
          ..addListener(() {
            if (mounted) {
              setState(() {});
            }
          });
    _videoPlayerController.addListener(updateSeeker);
    _videoPlayerController.play();
  }

  Future<void> updateSeeker() async {
    if (mounted) {
      setState(() {
        position = _videoPlayerController.value.position;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(updateSeeker);
    _videoPlayerController.dispose();
    super.dispose();
  }

  void tapScreen() {
    lastTouchTime = DateTime.now();
    setState(() {
      if (mounted) {
        isToolsVisible = true;
      }
    });
    _lastTouchTimer?.cancel();
    _lastTouchTimer = Timer(const Duration(seconds: 4), () {
      setState(() {
        if (mounted) {
          isToolsVisible = false;
        }
      });
    });
  }

  void seekBarOnChanged(double value) {
    final position = Duration(seconds: value.toInt());
    _videoPlayerController.seekTo(position);
  }

  void back10Sec() {
    _videoPlayerController.seekTo(
        _videoPlayerController.value.position - const Duration(seconds: 10));
    if (mounted) {
      setState(() {});
    }
  }

  void forward10Sec() {
    _videoPlayerController.seekTo(
        _videoPlayerController.value.position + const Duration(seconds: 10));
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: tapScreen,
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Center(
                  child: _videoPlayerController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        )
                      : const CircularProgressIndicator(),
                ),
                playButton(),
                seekBar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget playButton() {
    return Center(
      child: Positioned(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: back10Sec,
              child: SizedBox(
                width: 42,
                height: 42,
                child: Visibility(
                  visible: isToolsVisible,
                  child: Image.asset("assets/icons/before_ten.png"),
                ),
              ),
            ),
            const SizedBox(width: 156),
            GestureDetector(
              onTap: () {
                _videoPlayerController.value.isPlaying
                    ? _videoPlayerController.pause()
                    : _videoPlayerController.play();
                if (mounted) {
                  setState(() {});
                }
              },
              child: SizedBox(
                width: 42,
                height: 42,
                child: Visibility(
                  visible: isToolsVisible,
                  child: !_videoPlayerController.value.isPlaying
                      ? Image.asset("assets/icons/play_video.png")
                      : Image.asset("assets/icons/pause_video.png"),
                ),
              ),
            ),
            const SizedBox(width: 156),
            GestureDetector(
              onTap: forward10Sec,
              child: SizedBox(
                width: 42,
                height: 42,
                child: Visibility(
                  visible: isToolsVisible,
                  child: Image.asset("assets/icons/after_ten.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget seekBar() {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 60),
        child: Slider(
          min: 0,
          max: _videoPlayerController.value.duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(),
          onChanged: seekBarOnChanged,
          activeColor: const Color(0xffd22f26),
          inactiveColor: const Color(0xff737373),
        ),
      ),
    );
  }
}

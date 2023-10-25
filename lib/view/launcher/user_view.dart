import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/model/user.dart';

class UserView extends StatefulWidget {
  final User user;
  final int index;

  const UserView({super.key, required this.user, required this.index});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView>
    with SingleTickerProviderStateMixin {
  bool isTapped = false;
  double scaleFactor = 1.0;
  late Timer timer;
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    var tween = Tween<double>(begin: 1.0, end: 0.9);
    var curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation = tween.animate(curvedAnimation);
  }

  onTapUserAnimate() {
    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _animationController.reverse();
      openHomePage();
    });
  }

  openHomePage() {
    Navigator.of(context, rootNavigator: true).pushNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _animationController.forward(),
      onTapUp: (details) => _animationController.forward(),
      onTap: () => onTapUserAnimate(),
      child: ScaleTransition(
        scale: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.user.image,
              height: 92,
              width: 100,
            ),
            Text(
              widget.user.userName,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

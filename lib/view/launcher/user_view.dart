

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

class _UserViewState extends State<UserView> with SingleTickerProviderStateMixin {
  bool isTapped = false;
  double scaleFactor = 1.0;
  late Timer timer;
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this,);
    _
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/series.dart';

class Episodes extends StatefulWidget {
  final Series series;
  const Episodes({super.key, required this.series});

  @override
  State<Episodes> createState() => _EpisodesState();
}

class _EpisodesState extends State<Episodes> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

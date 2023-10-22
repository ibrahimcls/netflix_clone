import 'package:flutter/material.dart';
import 'package:netflix_clone/common/dump_data.dart';
import 'package:netflix_clone/view/launcher/user_view.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: users(),
      ),
    );
  }

  Widget users() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 60),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/logos_netflix.png"),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset("assets/icons/pencil.png"),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 75),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: DumpData.userList.length,
              itemBuilder: (context, index) {
                return UserView(
                  user:DumpData.userList[index],
                  index:index
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

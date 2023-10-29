import 'package:flutter/material.dart';
import 'package:netflix_clone/common/extensions.dart';
import 'package:netflix_clone/view/find/find_watch_view.dart';
import 'package:netflix_clone/view_model/find_view_model.dart';
import 'package:provider/provider.dart';

class FindView extends StatelessWidget {
  const FindView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FindViewModel>.value(
      value: FindViewModel(),
      child: _FindViewStateful(),
    );
  }
}

class _FindViewStateful extends StatefulWidget {
  const _FindViewStateful({super.key});

  @override
  State<_FindViewStateful> createState() => __FindViewState();
}

class __FindViewState extends State<_FindViewStateful> {
  late TextEditingController _editingController;
  late FindViewModel findViewModel;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
    findViewModel = Provider.of<FindViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    findViewModel.dispose();
    super.dispose();
  }

  void textOnChanged(String value) {
    if (value.isNotEmpty) {
      setState(() {
        findViewModel.updateList(value.toLowerCase());
        findViewModel.notifyListeners();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [topBar(), foundList()],
            ),
          ),
        ),
      ),
    );
  }

  Widget topBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context, rootNavigator: true).pop(),
          child: Image.asset("assets/icons/left-arrow.png"),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xff292929),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 4),
                Image.asset("assets/icons/find-small.png"),
                const SizedBox(width: 4),
                SizedBox(
                  width: 90,
                  child: TextField(
                    controller: _editingController,
                    cursorColor: Colors.white,
                    focusNode: FocusNode(),
                    onChanged: textOnChanged,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontFamily: 'Netflix',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff737373),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontFamily: 'Netflix',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget foundList() {
    return Expanded(
        child: ListView(
      children: findViewModel.foundList
          .map((watch) => FindWatchView(watch: watch))
          .toList(),
    ));
  }
}

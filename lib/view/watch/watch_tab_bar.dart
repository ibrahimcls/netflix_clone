import 'package:flutter/material.dart';
import 'package:netflix_clone/common/extensions.dart';

class WatchTab {
  String title;
  Widget tabView;

  WatchTab({required this.title, required this.tabView});
}

class WatchTabBar extends StatefulWidget {
  final List<WatchTab> children;
  final int tabCount;

  const WatchTabBar(
      {super.key, required this.children, required this.tabCount});

  @override
  State<WatchTabBar> createState() => _WatchTabBarState();
}

class _WatchTabBarState extends State<WatchTabBar>
    with TickerProviderStateMixin {
  late List<AnimationController> animationControllerList;
  late List<Animation> animationList;
  late TabController _tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabCount, vsync: this);
    animationControllerList = List<AnimationController>.generate(
      widget.tabCount,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      ),
    );
    animationList = List<Animation>.generate(
      widget.tabCount,
      (index) => Tween<double>(begin: 0, end: 1)
          .animate(animationControllerList[index]),
    );
  }

  void handleTabChange(int index) {
    setState(() {
      selectedTabIndex = index;
    });

    animationControllerList.asMap().forEach((key, value) {
      if (key == index) {
        value.forward();
      } else {
        value.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.children.length != widget.tabCount) {
      return ErrorWidget("tab count is not equals length of widgets!");
    }
    return Material(
      child: DefaultTabController(
        length: widget.tabCount,
        child: Container(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          color: Colors.black,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: Colors.black,
                dividerColor: Colors.black,
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: List.generate(
                  widget.tabCount,
                  (index) =>
                      tab(widget.children[index].title, animationList[index]),
                ),
                onTap: handleTabChange,
              ),
              widget.children[selectedTabIndex].tabView
            ],
          ),
        ),
      ),
    );
  }

  Widget tab(String title, Animation tabAnimation) {
    final textStyle = TextStyle(
      fontFamily: "Netflix",
      letterSpacing: -0.25,
      color: const Color(0xffe6e6e6),
      fontWeight: FontWeight.w700,
      fontSize: 12.sp,
    );
    final Size size = _textSize(title, textStyle);
    return Tab(
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: size.width,
                child: AnimatedBuilder(
                  animation: tabAnimation,
                  builder: (context, child) {
                    double screenWidth = MediaQuery.of(context).size.width;
                    double slidePosition = screenWidth * tabAnimation.value;
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: slidePosition,
                        height: 4,
                        decoration:
                            const BoxDecoration(color: Color(0xffd22f26)),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: Colors.black,
              child: Center(child: Text(title, style: textStyle)),
            )
          ],
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

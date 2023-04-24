import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/screens/main/widgets/navigation_appbar.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  final AutoScrollController _controller = AutoScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final main = context.watch<MainController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NavigationAppBar(controller: _controller),
      drawer: !Responsive.isDesktop(context) ? Drawer() : null,
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: main.screens.length,
        itemBuilder: (context, index) => VisibilityDetector(
          key: Key(index.toString()),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.5) {
              main.changePageIndex(index);
              print(main.currentIndex);
            }
          },
          child: AutoScrollTag(
            key: ValueKey(index),
            controller: _controller,
            index: index,
            child: main.screens[index]['route'],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/screens/main/widgets/mobile_drawer.dart';
import 'package:portfolio_website/screens/main/widgets/navigation_appbar.dart';
import 'package:portfolio_website/screens/main/widgets/translation_button.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:portfolio_website/widgets/subtitle.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AutoScrollController _controller = AutoScrollController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NavigationAppBar(controller: _controller),
      drawer: !Responsive.isDesktop(context)
          ? MobileDrawer(controller: _controller)
          : null,
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            controller: _controller,
            padding: EdgeInsets.zero,
            itemCount: provider.screens.length,
            itemBuilder: (context, index) => VisibilityDetector(
              key: Key(index.toString()),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.5) {
                  provider.changePageIndex(index);
                }
              },
              child: AutoScrollTag(
                key: ValueKey(index),
                controller: _controller,
                index: index,
                child: provider.screens[index]['route'],
              ),
            ),
          ),
          if (Responsive.isDesktop(context)) Subtitle(),
        ],
      ),
      floatingActionButton: TranslationButton(),
    );
  }
}

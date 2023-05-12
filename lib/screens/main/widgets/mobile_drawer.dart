import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/widgets/logo.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AutoScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Center(child: Logo(size: 22.0)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            SizedBox(height: 20.0),
            DrawerItemList(controller: controller),
          ],
        ),
      ),
    );
  }
}

class DrawerItemList extends StatelessWidget {
  const DrawerItemList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AutoScrollController controller;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainController>();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: provider.screens.length,
      itemBuilder: (context, index) => FadeAnimation(
        delay: Duration(milliseconds: 250 * index),
        offset: Offset(0.0, -10.0),
        child: InkWell(
          onTap: () async {
            Navigator.pop(context);
            await provider.navigatePage(controller, index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                provider.screens[index]['title'],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

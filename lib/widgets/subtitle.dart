import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:provider/provider.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final main = context.watch<MainController>();

    return Container(
      padding: EdgeInsets.only(
          left: Responsive.isDesktop(context)
              ? 170.0
              : Responsive.isTablet(context)
                  ? 100.0
                  : 16.0),
      child: Row(
        children: [
          SizedBox(
            height: 1.0,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: main.screens.length,
              itemBuilder: (context, index) => currentIndex == index
                  ? Container(
                      width: 32.0,
                      height: 1.0,
                      color: Theme.of(context).primaryColor,
                    )
                  : Container(
                      width: 8.0,
                      height: 1.0,
                      color: Theme.of(context).colorScheme.outline,
                    ),
              separatorBuilder: (context, index) => SizedBox(width: 2.0),
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            (currentIndex + 1).toString().padLeft(2, '0'),
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          SizedBox(width: 10.0),
          Text(
            main.screens[currentIndex]['title'],
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.outline),
          ),
        ],
      ),
    );
  }
}

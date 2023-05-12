import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:provider/provider.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainController>();

    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (provider.currentIndex + 1).toString().padLeft(2, '0'),
            style: TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 12.0,
            ),
          ),
          SizedBox(width: 4.0),
          Text(
            provider.screens[provider.currentIndex]['title'],
            style: TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 12.0,
            ),
          ),
          SizedBox(width: 10.0),
          SizedBox(
            height: 1.0,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: provider.screens.length,
              itemBuilder: (context, index) => provider.currentIndex == index
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
        ],
      ),
    );
  }
}

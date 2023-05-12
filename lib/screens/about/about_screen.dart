import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/about/widgets/about_background.dart';
import 'package:portfolio_website/screens/about/widgets/about_introduction.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:portfolio_website/widgets/subtitle.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    final provider = context.watch<MainController>();

    return provider.screens[1]['isLoaded']
        ? Stack(
            children: [
              AboutBackground(size: size),
              AboutIntroduction(),
            ],
          )
        : SizedBox(width: size.width, height: size.height);
  }

  @override
  bool get wantKeepAlive => true;
}

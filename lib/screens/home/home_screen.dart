import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/home/controller/home_controller.dart';
import 'package:portfolio_website/screens/home/widgets/home_background.dart';
import 'package:portfolio_website/screens/home/widgets/home_introduction.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeController>(context, listen: false).controller.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final size = MediaQuery.of(context).size;
    final provider = context.watch<HomeController>();

    return Stack(
      children: [
        HomeBackground(size: size, controller: provider.controller),
        HomeIntroduction(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

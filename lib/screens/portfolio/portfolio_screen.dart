import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/screens/portfolio/widgets/portfolio_component.dart';
import 'package:portfolio_website/screens/portfolio/widgets/portfolio_preview.dart';
import 'package:portfolio_website/screens/portfolio/widgets/portfolio_foreground.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    final provider = context.watch<MainController>();

    return provider.screens[2]['isLoaded']
        ? PortfolioComponent(size: size)
        : SizedBox(width: size.width, height: size.height);
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/portfolio/widgets/portfolio_foreground.dart';
import 'package:portfolio_website/screens/portfolio/widgets/portfolio_preview.dart';
import 'package:portfolio_website/services/responsive.dart';

class PortfolioComponent extends StatelessWidget {
  const PortfolioComponent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: DesktopComponent(size: size),
      mobile: MobileComponent(size: size),
    );
  }
}

class DesktopComponent extends StatelessWidget {
  const DesktopComponent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 170.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PortfolioPreview(size: size),
          PortfolioIntroduction(size: size),
        ],
      ),
    );
  }
}

class MobileComponent extends StatelessWidget {
  const MobileComponent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.0, vertical: size.height * 0.2),
      child: PortfolioPreview(size: size),
    );
  }
}

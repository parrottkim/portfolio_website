import 'package:flutter/material.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:portfolio_website/widgets/subtitle.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(top: Responsive.isDesktop(context) ? 120.0 : 60.0),
      child: Padding(
        padding: EdgeInsets.all(Responsive.isDesktop(context) ? 20.0 : 16.0),
        child: Stack(
          children: [
            Subtitle(currentIndex: 1),
          ],
        ),
      ),
    );
  }
}

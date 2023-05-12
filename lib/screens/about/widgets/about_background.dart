import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/services/responsive.dart';

class AboutBackground extends StatelessWidget {
  const AboutBackground({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: Duration(milliseconds: 500),
      offset: Offset(0.0, 10.0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          if (Responsive.isDesktop(context))
            Padding(
              padding: EdgeInsets.only(right: 170.0),
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/profile.png',
                  height: size.height * 0.8,
                  fit: BoxFit.cover,
                  // color: Theme.of(context).primaryColor.withOpacity(0.96),
                  // colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          if (Responsive.isDesktop(context))
            Padding(
              padding: EdgeInsets.only(right: 170.0),
              child: Image.asset(
                'assets/images/profile.png',
                height: size.height * 0.8,
                fit: BoxFit.cover,
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                  stops: [
                    0.0,
                    0.7,
                    1.0,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

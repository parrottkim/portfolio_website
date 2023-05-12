import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/animations/linear_animation.dart';

class ContactBackground extends StatelessWidget {
  const ContactBackground({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: FadeAnimation(
        offset: Offset(0.0, 0.0),
        child: ColoredBox(
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}

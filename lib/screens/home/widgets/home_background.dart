import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/blur_animation.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:video_player/video_player.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurAnimation(
          delay: Duration(milliseconds: 2000),
          child: ClipRRect(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: controller.value.size.width,
                  height: controller.value.size.height,
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                  Theme.of(context).scaffoldBackgroundColor,
                ],
                stops: [
                  0.0,
                  0.6,
                  0.8,
                  1.0,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlurAnimation extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offset;
  BlurAnimation({
    Key? key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 800),
    this.offset = 0.7,
  }) : super(key: key);

  @override
  State<BlurAnimation> createState() => _BlurAnimationState();
}

class _BlurAnimationState extends State<BlurAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _blurAnimation;
  late Animation _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _blurAnimation = Tween(begin: 0.01, end: 20.0).animate(_controller);
    _opacityAnimation = Tween(begin: 1.0, end: 0.4).animate(_controller);
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: _blurAnimation.value, sigmaY: _blurAnimation.value),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.translate(
              offset: Offset(_opacityAnimation.value, _opacityAnimation.value),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(widget.offset),
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

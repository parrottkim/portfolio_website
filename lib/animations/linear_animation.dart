import 'package:flutter/material.dart';

class LinearAnimation extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Alignment alignment;

  const LinearAnimation({
    Key? key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeInQuad,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  @override
  State<LinearAnimation> createState() => _LinearAnimationState();
}

class _LinearAnimationState extends State<LinearAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _linearAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _linearAnimation = Tween(begin: 0.0, end: 1.1)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
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
    return ClipRect(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Align(
          alignment: widget.alignment,
          widthFactor: _linearAnimation.value,
          heightFactor: 1.0,
          child: child,
        ),
        child: widget.child,
      ),
    );
  }
}

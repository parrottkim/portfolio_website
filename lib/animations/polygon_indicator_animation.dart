import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

class PolygonProgressIndicator extends StatefulWidget {
  final Widget? child;
  final double width;
  final double height;
  final Duration delay;
  final Duration duration;
  final int sides;
  final double strokeWidth;
  final Color color;
  final bool isRepeat;

  const PolygonProgressIndicator({
    Key? key,
    this.child,
    this.width = 60.0,
    this.height = 60.0,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 2000),
    this.sides = 6,
    this.strokeWidth = 2.0,
    this.color = Colors.white,
    this.isRepeat = true,
  }) : super(key: key);

  @override
  State<PolygonProgressIndicator> createState() =>
      _PolygonProgressIndicatorState();
}

class _PolygonProgressIndicatorState extends State<PolygonProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _startAnimation;
  late Animation<double> _endAnimation;

  bool _isVisible = false;

  _getPolygon() {
    if (widget.sides == 0) {
      return CircleShapeBorder(
        border: DynamicBorderSide(
          style: BorderStyle.solid,
          width: widget.strokeWidth,
          color: widget.color,
          begin: _startAnimation.value.toPercentLength,
          end: _endAnimation.value.toPercentLength,
          strokeJoin: StrokeJoin.miter,
          strokeCap: StrokeCap.square,
        ),
      );
    } else if (widget.sides == 4) {
      return RectangleShapeBorder(
        border: DynamicBorderSide(
          style: BorderStyle.solid,
          width: widget.strokeWidth,
          color: widget.color,
          begin: _startAnimation.value.toPercentLength,
          end: _endAnimation.value.toPercentLength,
          strokeJoin: StrokeJoin.miter,
          strokeCap: StrokeCap.square,
        ),
      );
    } else {
      return PolygonShapeBorder(
        sides: widget.sides,
        border: DynamicBorderSide(
          style: BorderStyle.solid,
          width: widget.strokeWidth,
          color: widget.color,
          begin: _startAnimation.value.toPercentLength,
          end: _endAnimation.value.toPercentLength,
          strokeJoin: StrokeJoin.miter,
          strokeCap: StrokeCap.square,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _startAnimation = Tween<double>(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _endAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(_controller);

    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
        _controller.forward();
        _controller.addListener(() {
          if (_controller.isCompleted) {
            if (widget.isRepeat) {
              _controller.repeat();
            } else {
              setState(() {
                _isVisible = false;
              });
            }
          }
        });
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
    return Visibility(
      visible: _isVisible,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Container(
          width: widget.width,
          height: widget.height,
          decoration: ShapeDecoration(
            shape: _getPolygon(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

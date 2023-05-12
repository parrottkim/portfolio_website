import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morphable_shape/morphable_shape.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.size = 18.0}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textTheme.bodySmall!.color!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/icons/parrot.svg',
          height: size,
          width: size,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: size / 3),
        Text(
          'PARROTT KIM',
          style: TextStyle(
            fontFamily: 'BebasNeue',
            fontSize: size,
            color: color,
          ),
        ),
      ],
    );
  }
}

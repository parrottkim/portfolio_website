import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/screens/main/controller/main_controller.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:portfolio_website/widgets/logo.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigationAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AutoScrollController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Opacity(
        opacity: Responsive.isDesktop(context) ? 1 : 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 170.0, right: 140.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainLogo(),
              Spacer(),
              AppBarListItem(controller: controller),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class MainLogo extends StatelessWidget {
  const MainLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      duration: Duration(milliseconds: 250),
      offset: Offset(0, -10),
      delay: Duration(milliseconds: 1000),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Logo(),
      ),
    );
  }
}

class AppBarListItem extends StatelessWidget {
  AppBarListItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AutoScrollController controller;

  @override
  Widget build(BuildContext context) {
    final main = context.watch<MainController>();

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: main.screens.length,
      itemBuilder: (context, index) => AppBarButton(
        index: index,
        controller: controller,
      ),
    );
  }
}

class AppBarButton extends StatefulWidget {
  AppBarButton({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final int index;
  final AutoScrollController controller;

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _linearAnimation;

  final Duration delay = const Duration(milliseconds: 1000);
  final Duration duration = Duration(milliseconds: 200);
  final Curve curve = Curves.easeInOutQuad;

  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _linearAnimation = Tween(begin: 0.0, end: 1.1)
        .animate(CurvedAnimation(parent: _controller, curve: curve));
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        _controller.addStatusListener((status) => animationListener(status)));
  }

  animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_isHovering) {
        _controller.stop();
      }
      if (!_isHovering) {
        _controller.reverse();
      }
      if (context.watch<MainController>().currentIndex != widget.index) {
        print('diffrence');
        _controller.reverse();
      }
    }
  }

  Size calculateTextSize(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodySmall!,
      ),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    final bodyColor = Theme.of(context).textTheme.bodySmall!.color!;
    final main = context.watch<MainController>();

    return FadeAnimation(
      duration: Duration(milliseconds: 250),
      offset: Offset(0, -10),
      delay: Duration(milliseconds: 1000 + (widget.index * 250)),
      child: InkWell(
        onTap: () {
          main.navigatePage(widget.controller, widget.index);
        },
        onHover: (value) {
          if (value) {
            _controller.forward();
          }
          if (!value) {
            _controller.forward(from: 0.99);
          }
          _isHovering = value;
        },
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
              child: Text(
                main.screens[widget.index]['title'],
                style: Theme.of(context).textTheme.bodySmall!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ClipRect(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) => Align(
                    alignment: Alignment.center,
                    widthFactor: _linearAnimation.value,
                    heightFactor: 1.0,
                    child: child,
                  ),
                  child: Container(
                    width:
                        calculateTextSize(main.screens[widget.index]['title'])
                            .width,
                    height: 1.0,
                    color: bodyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

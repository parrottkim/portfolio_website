import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/services/responsive.dart';

class HomeIntroduction extends StatelessWidget {
  const HomeIntroduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Responsive(
        desktop: DesktopComponent(),
        tablet: TabletComponent(),
        mobile: MobileComponent(),
      ),
    );
  }
}

class DesktopComponent extends StatelessWidget {
  const DesktopComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 170.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 2500),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'Mobile App Developer',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 2750),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'Parrott Kim',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 3000),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'home1'.tr(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class TabletComponent extends StatelessWidget {
  const TabletComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 2500),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'Mobile App Developer',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 2750),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'Parrott Kim',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 3000),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'home1'.tr(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class MobileComponent extends StatelessWidget {
  const MobileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 2500),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'Mobile App Developer',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 2750),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'Parrott Kim',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          FadeAnimation(
            delay: Duration(milliseconds: 3000),
            offset: Offset(-10.0, 0.0),
            child: Text(
              'home1'.tr(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}

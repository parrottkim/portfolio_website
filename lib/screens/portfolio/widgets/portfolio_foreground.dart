import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/screens/portfolio/controller/portfolio_controller.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:provider/provider.dart';

class PortfolioIntroduction extends StatelessWidget {
  const PortfolioIntroduction({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: DesktopComponent(size: size),
      mobile: MobileComponent(),
    );
  }
}

class DesktopComponent extends StatelessWidget {
  const DesktopComponent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PortfolioController>();

    return Expanded(
      flex: 3,
      child: FadeAnimation(
        delay: Duration(milliseconds: 500),
        offset: Offset(0.0, 0.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                controller: provider.foregroundController,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: provider.portfolio.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.portfolio[index]['title'],
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontFamily: 'Pretendard',
                            ),
                      ),
                      SizedBox(height: 4.0),
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        spacing: 4,
                        runSpacing: 4,
                        children: List.generate(
                          provider.portfolio[index]['stack'].length,
                          (wrapIndex) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Theme.of(context).primaryColor),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                provider.portfolio[index]['stack'][wrapIndex],
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        provider.portfolio[index]['date'],
                        style: TextStyle(
                          fontFamily: 'BebasNeue',
                          fontSize: 14.0,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 4.0,
                        ),
                      ),
                      Text(
                        provider.portfolio[index]['explanation'],
                      ),
                      SizedBox(height: 16.0),
                      Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        spacing: 4,
                        runSpacing: 4,
                        children: List.generate(
                          provider.portfolio[index]['link'].length,
                          (wrapIndex) => InkWell(
                            onTap: () => html.window.open(
                                provider.portfolio[index]['link'][wrapIndex]
                                    ['link'],
                                '_blank'),
                            child: SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: SvgPicture.asset(
                                provider.portfolio[index]['link'][wrapIndex]
                                    ['asset'],
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            IgnorePointer(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.centerLeft,
                      colors: [
                        Colors.transparent,
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.3),
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                      stops: [
                        0.0,
                        0.8,
                        1.0,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            IgnorePointer(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.transparent,
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.3),
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                      stops: [
                        0.0,
                        0.8,
                        1.0,
                      ],
                    ),
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

class MobileComponent extends StatelessWidget {
  const MobileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PortfolioController>();

    return PageView.builder(
      controller: provider.foregroundController,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: provider.portfolio.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              provider.portfolio[index]['title'],
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontFamily: 'Pretendard',
                  ),
            ),
            SizedBox(height: 4.0),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 4,
              runSpacing: 4,
              children: List.generate(
                provider.portfolio[index]['stack'].length,
                (wrapIndex) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Theme.of(context).primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      provider.portfolio[index]['stack'][wrapIndex],
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              provider.portfolio[index]['date'],
              style: TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 14.0,
                color: Theme.of(context).primaryColor,
                letterSpacing: 4.0,
              ),
            ),
            Text(
              provider.portfolio[index]['explanation'],
            ),
            SizedBox(height: 16.0),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              spacing: 4,
              runSpacing: 4,
              children: List.generate(
                provider.portfolio[index]['link'].length,
                (wrapIndex) => InkWell(
                  onTap: () => html.window.open(
                      provider.portfolio[index]['link'][wrapIndex]['link'],
                      '_blank'),
                  child: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: SvgPicture.asset(
                      provider.portfolio[index]['link'][wrapIndex]['asset'],
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

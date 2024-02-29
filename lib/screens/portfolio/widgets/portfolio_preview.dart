import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/screens/portfolio/controller/portfolio_controller.dart';
import 'package:portfolio_website/screens/portfolio/widgets/portfolio_foreground.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:provider/provider.dart';

class PortfolioPreview extends StatelessWidget {
  const PortfolioPreview({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: DesktopComponent(size: size),
      mobile: MobileComponent(size: size),
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
      flex: 2,
      child: FadeAnimation(
        delay: Duration(milliseconds: 500),
        offset: Offset(0.0, 10.0),
        child: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: size.height * 0.2),
          child: SizedBox(
            width: size.height * 0.3,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: PageView.builder(
                            controller: provider.backgroundController,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.portfolio.length,
                            itemBuilder: (context, index) => Container(
                              alignment: Alignment.center,
                              color: provider.portfolio[index]['color'],
                              child: Image.asset(
                                provider.portfolio[index]['image'],
                                fit: BoxFit.fitWidth,
                                height: 64.0,
                                width: 64.0,
                              ),
                            ),
                            onPageChanged: (value) => provider.changeIndex(value),
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/iphone.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    InkWell(
                      onTap: provider.currentIndex > 0
                          ? () => provider.navigatePage(provider.currentIndex - 1)
                          : null,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          MdiIcons.chevronLeft,
                          color: provider.currentIndex > 0
                              ? Colors.white
                              : Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    InkWell(
                      onTap: provider.currentIndex < provider.portfolio.length - 1
                          ? () => provider.navigatePage(provider.currentIndex + 1)
                          : null,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          MdiIcons.chevronRight,
                          color: provider.currentIndex < provider.portfolio.length - 1
                              ? Colors.white
                              : Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileComponent extends StatelessWidget {
  const MobileComponent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PortfolioController>();

    return FadeAnimation(
      delay: Duration(milliseconds: 500),
      offset: Offset(0.0, 10.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: PageView.builder(
                        controller: provider.backgroundController,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.portfolio.length,
                        itemBuilder: (context, index) => Container(
                          alignment: Alignment.center,
                          color: provider.portfolio[index]['color'],
                          child: Image.asset(
                            provider.portfolio[index]['image'],
                            fit: BoxFit.fitWidth,
                            height: 64.0,
                            width: 64.0,
                          ),
                        ),
                        onPageChanged: (value) => provider.changeIndex(value),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: provider.isHovering ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 400),
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: PortfolioIntroduction(size: size),
                      ),
                    ),
                  ),
                ),
                IgnorePointer(
                  child: Image.asset(
                    'assets/images/iphone.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: provider.currentIndex > 0
                    ? () => provider.navigatePage(provider.currentIndex - 1)
                    : null,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    MdiIcons.chevronLeft,
                    color: provider.currentIndex > 0
                        ? Colors.white
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              InkWell(
                onTap: provider.currentIndex < provider.portfolio.length - 1
                    ? () => provider.navigatePage(provider.currentIndex + 1)
                    : null,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    MdiIcons.chevronRight,
                    color: provider.currentIndex < provider.portfolio.length - 1
                        ? Colors.white
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              SizedBox(width: 160.0),
              InkWell(
                onTap: () => provider.toggleHover(),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    !provider.isHovering
                        ? MdiIcons.textBoxMultipleOutline
                        : MdiIcons.textBoxRemoveOutline,
                    color: !provider.isHovering
                        ? Colors.white
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

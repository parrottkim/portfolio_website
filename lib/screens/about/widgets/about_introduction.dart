import 'dart:html' as html;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/animations/fade_animation.dart';
import 'package:portfolio_website/screens/about/controller/about_controller.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:provider/provider.dart';

class AboutIntroduction extends StatelessWidget {
  const AboutIntroduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: DesktopComponent(),
      mobile: MobileComponent(),
    );
  }
}

class DesktopComponent extends StatelessWidget {
  const DesktopComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AboutController>();

    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 170.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  FadeAnimation(
                    delay: Duration(milliseconds: 500),
                    offset: Offset(-10.0, 0.0),
                    child: Text(
                      'about1'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 60.0),
                  FadeAnimation(
                    delay: Duration(milliseconds: 1000),
                    offset: Offset(0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EDUCATION',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Container(
                          color: Theme.of(context).colorScheme.outline,
                          height: 1.0,
                          width: MediaQuery.of(context).size.width / 6.5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: provider.education.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          delay: Duration(milliseconds: 1500),
                          offset: Offset(0.0, 0.0),
                          child: Text(
                            provider.education[index]['date'],
                            style: TextStyle(
                              fontFamily: 'Config',
                              fontSize: 14.0,
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 4.0,
                            ),
                          ),
                        ),
                        FadeAnimation(
                          delay: Duration(milliseconds: 1750),
                          offset: Offset(0.0, 0.0),
                          child: Text(
                            provider.education[index]['degree'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                        FadeAnimation(
                          delay: Duration(milliseconds: 2000),
                          offset: Offset(0.0, 0.0),
                          child: Text(
                            provider.education[index]['name'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 30.0),
                  ),
                  SizedBox(height: 60.0),
                  FadeAnimation(
                    delay: Duration(milliseconds: 1000),
                    offset: Offset(0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CAREER',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Container(
                          color: Theme.of(context).colorScheme.outline,
                          height: 1.0,
                          width: MediaQuery.of(context).size.width / 6.5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: provider.career.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          delay: Duration(milliseconds: 1500),
                          offset: Offset(0.0, 0.0),
                          child: Text(
                            provider.career[index]['date'],
                            style: TextStyle(
                              fontFamily: 'Config',
                              fontSize: 14.0,
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 4.0,
                            ),
                          ),
                        ),
                        FadeAnimation(
                          delay: Duration(milliseconds: 1750),
                          offset: Offset(0.0, 0.0),
                          child: Text(
                            provider.career[index]['role'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                        FadeAnimation(
                          delay: Duration(milliseconds: 2000),
                          offset: Offset(0.0, 0.0),
                          child: Text(
                            provider.career[index]['name'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 30.0),
                  ),
                ],
              ),
            ),
            SizedBox(width: 120.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  FadeAnimation(
                    delay: Duration(milliseconds: 1000),
                    offset: Offset(0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EXPERIENCE',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Container(
                          color: Theme.of(context).colorScheme.outline,
                          height: 1.0,
                          width: MediaQuery.of(context).size.width / 6.5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: provider.experience.length,
                    itemBuilder: (context, index) => FadeAnimation(
                      delay: Duration(milliseconds: 1500 + (100 * index)),
                      offset: Offset(0.0, 0.0),
                      child: Text(
                        provider.experience[index],
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 6.0),
                  ),
                  SizedBox(height: 60.0),
                  FadeAnimation(
                    delay: Duration(milliseconds: 1000),
                    offset: Offset(0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SOCIALS',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Container(
                          color: Theme.of(context).colorScheme.outline,
                          height: 1.0,
                          width: MediaQuery.of(context).size.width / 6.5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    spacing: 20,
                    runSpacing: 10,
                    children: List.generate(
                      provider.social.length,
                      (index) => FadeAnimation(
                        delay: Duration(milliseconds: 1500 + (100 * index)),
                        offset: Offset(0.0, 0.0),
                        child: InkWell(
                          onTap: () => html.window
                              .open(provider.social[index]['link'], '_blank'),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: SvgPicture.asset(
                                  provider.social[index]['asset'],
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                provider.social[index]['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 40.0),
            Expanded(
              child: Container(),
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
    final provider = context.watch<AboutController>();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 100.0 : 16.0,
          vertical: 60.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(
            delay: Duration(milliseconds: 500),
            offset: Offset(-10.0, 0.0),
            child: Text('about1'.tr()),
          ),
          SizedBox(height: 60.0),
          FadeAnimation(
            delay: Duration(milliseconds: 1000),
            offset: Offset(0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EDUCATION',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  color: Theme.of(context).colorScheme.outline,
                  height: 1.0,
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: provider.education.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  delay: Duration(milliseconds: 1500),
                  offset: Offset(0.0, 0.0),
                  child: Text(
                    provider.education[index]['date'],
                    style: TextStyle(
                      fontFamily: 'Config',
                      fontSize: 14.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: Duration(milliseconds: 1750),
                  offset: Offset(0.0, 0.0),
                  child: Text(
                    provider.education[index]['degree'],
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                FadeAnimation(
                  delay: Duration(milliseconds: 2000),
                  offset: Offset(0.0, 0.0),
                  child: Text(
                    provider.education[index]['name'],
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 30.0),
          ),
          SizedBox(height: 60.0),
          FadeAnimation(
            delay: Duration(milliseconds: 1000),
            offset: Offset(0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CAREER',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  color: Theme.of(context).colorScheme.outline,
                  height: 1.0,
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: provider.career.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(
                  delay: Duration(milliseconds: 1500),
                  offset: Offset(0.0, 0.0),
                  child: Text(
                    provider.career[index]['date'],
                    style: TextStyle(
                      fontFamily: 'Config',
                      fontSize: 14.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: Duration(milliseconds: 1750),
                  offset: Offset(0.0, 0.0),
                  child: Text(
                    provider.career[index]['role'],
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                FadeAnimation(
                  delay: Duration(milliseconds: 2000),
                  offset: Offset(0.0, 0.0),
                  child: Text(
                    provider.career[index]['name'],
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 30.0),
          ),
          SizedBox(height: 60.0),
          FadeAnimation(
            delay: Duration(milliseconds: 1000),
            offset: Offset(0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EXPERIENCE',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  color: Theme.of(context).colorScheme.outline,
                  height: 1.0,
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: provider.experience.length,
            itemBuilder: (context, index) => FadeAnimation(
              delay: Duration(milliseconds: 1500 + (100 * index)),
              offset: Offset(0.0, 0.0),
              child: Text(
                provider.experience[index],
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 6.0),
          ),
          SizedBox(height: 60.0),
          FadeAnimation(
            delay: Duration(milliseconds: 1000),
            offset: Offset(0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SOCIALS',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  color: Theme.of(context).colorScheme.outline,
                  height: 1.0,
                  width: MediaQuery.of(context).size.width / 2.5,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 20,
            runSpacing: 10,
            children: List.generate(
              provider.social.length,
              (index) => FadeAnimation(
                delay: Duration(milliseconds: 1500 + (100 * index)),
                offset: Offset(0.0, 0.0),
                child: InkWell(
                  onTap: () => html.window
                      .open(provider.social[index]['link'], '_blank'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: SvgPicture.asset(
                          provider.social[index]['asset'],
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        provider.social[index]['name'],
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

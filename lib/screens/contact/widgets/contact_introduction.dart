import 'dart:html' as html;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/screens/contact/controller/contact_controller.dart';
import 'package:portfolio_website/services/responsive.dart';
import 'package:provider/provider.dart';

class ContactIntroduction extends StatelessWidget {
  const ContactIntroduction({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ContactController>();

    return Padding(
      padding: const EdgeInsets.only(top: 200.0, bottom: 75.0),
      child: Column(
        children: [
          Text(
            'contact1'.tr(),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: Responsive.isDesktop(context) ? 60.0 : 42.0,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
          SizedBox(height: 8.0),
          Text(
            'contact2'.tr(),
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          SizedBox(height: 16.0),
          MaterialButton(
            onPressed: () => html.window.open(
                'https://career.programmers.co.kr/pr/parrottkim21_1393',
                '_blank'),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              'contact3'.tr(),
            ),
          ),
          SizedBox(height: 200.0),
          if (Responsive.isDesktop(context))
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'contact4'.tr(),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Container(
                    height: 13.0,
                    width: 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 10,
                  children: List.generate(
                    provider.social.length,
                    (index) => InkWell(
                      onTap: () => html.window
                          .open(provider.social[index]['link'], '_blank'),
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: SvgPicture.asset(
                          provider.social[index]['asset'],
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).scaffoldBackgroundColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 10,
                  children: List.generate(
                    provider.social.length,
                    (index) => InkWell(
                      onTap: () => html.window
                          .open(provider.social[index]['link'], '_blank'),
                      child: SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: SvgPicture.asset(
                          provider.social[index]['asset'],
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).scaffoldBackgroundColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'contact4'.tr(),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

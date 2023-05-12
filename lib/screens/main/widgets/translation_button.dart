import 'dart:html' as html;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TranslationButton extends StatefulWidget {
  const TranslationButton({Key? key}) : super(key: key);

  @override
  State<TranslationButton> createState() => _TranslationButtonState();
}

class _TranslationButtonState extends State<TranslationButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String text = '';
        if (context.locale == Locale('en', 'US')) {
          await context
              .setLocale(Locale('ko', 'KR'))
              .then((_) => text = '언어가 변경되었습니다.');
        } else {
          await context
              .setLocale(Locale('en', 'US'))
              .then((_) => text = 'Language has changed.');
        }
        html.window.location.reload();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(text)));
      },
      child: Icon(
        MdiIcons.translate,
      ),
    );
  }
}

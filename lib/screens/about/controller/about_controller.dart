import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutController extends ChangeNotifier {
  final List<Map> _education = [
    {
      'date': 'about2'.tr(),
      'degree': 'about3'.tr(),
      'name': 'about4'.tr(),
    },
  ];
  List<Map> get education => _education;

  final List<Map> _career = [
    {
      'date': 'about5'.tr(),
      'role': 'about6'.tr(),
      'name': 'about7'.tr(),
    },
    {
      'date': 'about8'.tr(),
      'role': 'about9'.tr(),
      'name': 'about10'.tr(),
    }
  ];
  List<Map> get career => _career;

  final List<String> _experience = [
    'about11'.tr(),
    'about12'.tr(),
    'about13'.tr(),
    'about14'.tr(),
    'about15'.tr(),
  ];
  List<String> get experience => _experience;

  final List<Map> _social = [
    {
      'asset': 'assets/icons/github.svg',
      'name': 'parrottkim',
      'link': 'https://github.com/ParrottKim',
    },
    {
      'asset': 'assets/icons/velog.svg',
      'name': 'parrottkim21',
      'link': 'https://velog.io/@parrottkim21',
    },
    {
      'asset': 'assets/icons/instagram.svg',
      'name': 'parrottkim_',
      'link': 'https://www.instagram.com/parrottkim_',
    },
    {
      'asset': 'assets/icons/gmail.svg',
      'name': 'parrottkim21',
      'link': 'mailto:parrottkim21@gmail.com',
    },
  ];
  List<Map> get social => _social;
}

import 'package:flutter/material.dart';

class ContactController extends ChangeNotifier {
  final List<Map> _social = [
    {
      'asset': 'assets/icons/github.svg',
      'link': 'https://github.com/ParrottKim',
    },
    {
      'asset': 'assets/icons/velog.svg',
      'link': 'https://velog.io/@parrottkim21',
    },
    {
      'asset': 'assets/icons/instagram.svg',
      'link': 'https://www.instagram.com/parrottkim_',
    },
    {
      'asset': 'assets/icons/gmail.svg',
      'link': 'mailto:parrottkim21@gmail.com',
    },
  ];
  List<Map> get social => _social;
}

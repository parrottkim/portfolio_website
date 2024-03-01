import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PortfolioController extends ChangeNotifier {
  PageController _backgroundController = PageController();
  PageController get backgroundController => _backgroundController;

  PageController _foregroundController = PageController();
  PageController get foregroundController => _foregroundController;

  final List<Map> _portfolio = [
    {
      'title': 'portfolio1'.tr(),
      'explanation': 'portfolio2'.tr(),
      'stack': ['Flutter', 'Provider'],
      'date': 'portfolio3'.tr(),
      'image': 'assets/images/portfolio1.png',
      'color': Color(0xFF181818),
      'link': [
        {
          'asset': 'assets/icons/github.svg',
          'link': 'https://github.com/ParrottKim/portfolio_website',
        },
      ],
    },
    {
      'title': 'portfolio4'.tr(),
      'explanation': 'portfolio5'.tr(),
      'stack': ['Flutter', 'Riverpod', 'Firebase'],
      'date': 'portfolio6'.tr(),
      'image': 'assets/images/portfolio2.png',
      'color': Color(0xFFE5E7E8),
      'link': [
        {
          'asset': 'assets/icons/appstore.svg',
          'link':
              'https://apps.apple.com/us/app/%EB%82%98%EB%88%84%EB%AF%B8-nanumi/id1672197639',
        },
        {
          'asset': 'assets/icons/googleplay.svg',
          'link':
              'https://play.google.com/store/apps/details?id=com.parrottkim.nanumi',
        },
        {
          'asset': 'assets/icons/github.svg',
          'link': 'https://github.com/ParrottKim/nanumi',
        },
      ]
    },
    {
      'title': 'portfolio7'.tr(),
      'explanation': 'portfolio8'.tr(),
      'stack': ['Flutter', 'Riverpod', 'Firebase', 'REST API'],
      'date': 'portfolio9'.tr(),
      'image': 'assets/images/portfolio3.png',
      'color': Color(0xFF9050F5),
      'link': [
        {
          'asset': 'assets/icons/appstore.svg',
          'link': 'https://apps.apple.com/kr/app/id1613125434',
        },
        {
          'asset': 'assets/icons/googleplay.svg',
          'link':
              'https://play.google.com/store/apps/details?id=com.humilylab.wena2022',
        },
      ],
    },
    {
      'title': 'portfolio10'.tr(),
      'explanation': 'portfolio11'.tr(),
      'stack': ['Flutter', 'Bloc', 'Firebase', 'REST API'],
      'date': 'portfolio12'.tr(),
      'image': 'assets/images/portfolio4.png',
      'color': Color(0xFF0098E5),
      'link': [
        {
          'asset': 'assets/icons/appstore.svg',
          'link': 'https://apps.apple.com/kr/app/id6443597104',
        },
        {
          'asset': 'assets/icons/googleplay.svg',
          'link':
              'https://play.google.com/store/apps/details?id=kr.findb.findb2',
        },
      ],
    },
  ];
  List<Map> get portfolio => _portfolio;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _isScrolling = false;
  bool get isScrolling => _isScrolling;

  bool _isHovering = false;
  bool get isHovering => _isHovering;

  initialize() {
    _currentIndex = 0;
    _backgroundController = PageController();
    _foregroundController = PageController();
    notifyListeners();
  }

  navigatePage(int index) {
    if (!_isScrolling && index >= 0 && index < _portfolio.length) {
      _isScrolling = true;
      _currentIndex = index;

      backgroundController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOutQuad);
      foregroundController.animateToPage(index,
          duration: Duration(milliseconds: 800), curve: Curves.easeInOutQuad);

      _isScrolling = false;
    }
    notifyListeners();
  }

  changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  toggleHover() {
    _isHovering = !_isHovering;
    notifyListeners();
  }
}

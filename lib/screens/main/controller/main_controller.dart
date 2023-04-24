import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/about/about_screen.dart';
import 'package:portfolio_website/screens/home/home_screen.dart';
import 'package:portfolio_website/screens/temp/temp_screen.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MainController extends ChangeNotifier {
  final List<Map> _screens = [
    {
      'title': 'appbar1'.tr(),
      'route': HomeScreen(),
    },
    {
      'title': 'appbar2'.tr(),
      'route': AboutScreen(),
    },
    {
      'title': 'appbar3'.tr(),
      'route': TempScreen(),
    },
    {
      'title': 'appbar4'.tr(),
      'route': TempScreen(),
    },
  ];
  List<Map> get screens => _screens;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _isScrolling = false;
  bool get isScrolling => _isScrolling;

  changePageIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  navigatePage(AutoScrollController controller, int index) async {
    if (!_isScrolling && index >= 0 && index < _screens.length) {
      _isScrolling = true;
      _currentIndex = index;
      await controller.scrollToIndex(index,
          preferPosition: AutoScrollPosition.begin);
      _isScrolling = false;
    }
    notifyListeners();
  }
}

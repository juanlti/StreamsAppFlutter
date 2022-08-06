import 'package:flutter/material.dart';

class NavegacionMovel with ChangeNotifier {
  int _pageCurrent = 0;

  PageController _pageController = new PageController();

  int get getPageCurrent {
    return this._pageCurrent;
  }

  set setPageCurrent(int value) {
    this._pageCurrent = value;

    _pageController.jumpToPage(value);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}

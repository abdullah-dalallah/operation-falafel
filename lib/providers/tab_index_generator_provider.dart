import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class TabIndexGenerator with ChangeNotifier {
  // final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  int _currentIndex=0;
  String currentLayout = "Mobile";
  setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
  }

  setLayout(String layout){
    currentLayout = layout;
    notifyListeners();
  }



}

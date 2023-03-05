import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class TabIndexGenerator with ChangeNotifier {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  setIndex(int index) {
    _controller.jumpToTab(index);
  }

  get getCurrentIndex {
    return 0;
  }
  get getCurrentController {
    return _controller;
  }
}

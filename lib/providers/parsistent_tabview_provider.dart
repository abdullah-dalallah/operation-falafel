import 'package:flutter/cupertino.dart';

class PersistentTabviewProvider  with ChangeNotifier {

  bool _hideNavigationBarFlag = false;

  bool get hideNavigationBarFlag => _hideNavigationBarFlag;
  set hideNavigationBarFlag(bool value) {
    _hideNavigationBarFlag = value;
  }

  Future<void> changeHideNavigationBarFlag(bool value)async {
    _hideNavigationBarFlag = value;
    notifyListeners();

  }



}
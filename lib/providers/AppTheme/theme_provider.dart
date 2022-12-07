import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

class ThemeProvider  with ChangeNotifier{
  AppTheme _appTheme =AppTheme();

  AppTheme get appTheme => _appTheme;
  set appTheme(AppTheme value) {
    _appTheme = value;
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/AppTheme.json');
    final data = await json.decode(response);
    if(data!=null){
      Map tempFont = data["AppTheme"]["FontSizes"];
      Map tempHomePage = data["AppTheme"]["DesignPerPage"]["HomePage"];
      _appTheme.fontSizes=tempFont;
      _appTheme.homePage=tempHomePage;
    notifyListeners();
    }


    print(_appTheme.fontSizes["EN"]);
  }



}
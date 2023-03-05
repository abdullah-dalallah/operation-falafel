import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../localization/localization_constants.dart';
import '../../main.dart';
import '../../models/AppThemeModels/app_theme.dart';


// import 'app_theme.dart';

class ThemeProvider  with ChangeNotifier{
  late AppTheme _appTheme = AppTheme();

  AppTheme get appTheme => _appTheme;
  set appTheme(AppTheme value) {
    _appTheme = value;
  }

  Future<AppTheme> readJson() async {

    final String response = await rootBundle.loadString('assets/AppTheme.json');
    final data = await json.decode(response);
    if(data!=null){

      _appTheme =   AppTheme(id: AppTheme.fromJson(data).id,language: AppTheme.fromJson(data).language,fontSizes: AppTheme.fromJson(data).fontSizes,designPerPage: AppTheme.fromJson(data).designPerPage, themeId:  AppTheme.fromJson(data).themeId);

      //  print(_appTheme.fontSizes.ar.header1.size);

    notifyListeners();
    }

   return _appTheme;

  }



}
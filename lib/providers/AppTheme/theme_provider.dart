import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/getSharedPref.dart';
import '../../data/keys.dart';
import '../../data/strings.dart';
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
   print("Getting App Theme From Json File...");
    final String response = await rootBundle.loadString('assets/AppTheme.json');
    final data = await json.decode(response);
    if(data!=null){

      _appTheme =   AppTheme(id: AppTheme.fromJson(data).id,language: AppTheme.fromJson(data).language,fontSizes: AppTheme.fromJson(data).fontSizes,designPerPage: AppTheme.fromJson(data).designPerPage, themeId:  AppTheme.fromJson(data).themeId);
      notifyListeners();
    }

   return _appTheme;

  }

  Future<Response<dynamic>> getAppTheme(String key, String value, String theme_id, String createdBy) async {
    print("getting app theme from Online Server...");
    var url = '${Strings.baseAppThemeUrl}/themes-details/getThemesDetails';
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");

    Map<String, String> data = <String, String>{};
    data.putIfAbsent(Keys.themeKeyKey, () => key);
    data.putIfAbsent(Keys.valueKey, () => value);
    data.putIfAbsent(Keys.themeIdKey, () => theme_id);
    data.putIfAbsent(Keys.createdByKey, () => createdBy);

    var dio = Dio();
    try {

      var response = await dio.get(url, data: data,options: Options(headers: header));// options: Options(headers: header)
     if(response.statusCode ==200){
       var tempTheme = response.data[Keys.bodyKey][0];
       _appTheme =   AppTheme(id: AppTheme.fromJson(tempTheme).id,language: AppTheme.fromJson(tempTheme).language,fontSizes: AppTheme.fromJson(tempTheme).fontSizes,designPerPage: AppTheme.fromJson(tempTheme).designPerPage, themeId:  AppTheme.fromJson(tempTheme).themeId);
       notifyListeners();
       print("AppTheme Deployed From Online Server!");
       saveAppThemeLocally(_appTheme);
     }

      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }

  Future<void> saveAppThemeLocally(AppTheme theme) async {
    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    // prefs.setString(Keys.SavedthemeKey, "{}");
    prefs.setString(Keys.SavedthemeKey, json.encode(theme.toJson()));
    print("App Theme Saved in Shared Preferences!");
  }

  Future<AppTheme> getSavedAppThemeLocally() async {
    print("getting app theme from Shared Preferences");
    SharedPreferences prefs = await GetSharedPref().getSharedPref();

    if(prefs.getString(Keys.SavedthemeKey,)!="{}"){

        var tempSavedTheme = prefs.getString(Keys.SavedthemeKey,)??"{}";
       _appTheme=AppTheme.fromJson(json.decode(prefs.getString(Keys.SavedthemeKey,)??"{}"));

      notifyListeners();
      return _appTheme;
    }
    else{
      return _appTheme;
    }

  }
}
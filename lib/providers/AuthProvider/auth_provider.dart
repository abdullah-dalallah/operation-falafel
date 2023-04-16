import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/getSharedPref.dart';
import '../../data/keys.dart';
import '../../data/strings.dart';
import 'models/logged_in_user.dart';

class AuthProvider with ChangeNotifier{
  late LoggedInUser? loggedInUser = LoggedInUser();

  Future<Response<dynamic>> userLogin( String email, String password) async {
    var url = '${Strings.baseAppAuthUrl}auth/login';
    Map<String, String> data = <String, String>{};
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    // data.putIfAbsent(Keys.userNameKey, () => userName);
    data.putIfAbsent(Keys.emailKey, () => email);
    data.putIfAbsent(Keys.passwordKey, () => password);

    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(data);
      var response = await dio.post(url, data: data,options: Options(headers: header));// options: Options(headers: header)
      print(response.data);
      loggedInUser = LoggedInUser.fromJson(response.data[Keys.bodyKey]);
      // print(loggedInUser?.token);
      // print(loggedInUser?.toJson());
      // print(json.decode(json.encode(loggedInUser?.toJson()))??"{}");
      notifyListeners();

      saveUserDetailsLocally(loggedInUser!);



      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }

  Future<void> saveUserDetailsLocally(LoggedInUser user) async {

    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    prefs.setString(Keys.savedLoggedInUserKey, json.encode(user.toJson()));

  }

  Future<LoggedInUser?> getSavedUserDetailsLocally() async {
    print("load logged in user data...");
    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    if(prefs.getString(Keys.savedLoggedInUserKey,)!="{}" && prefs.getString(Keys.savedLoggedInUserKey,)!=null){
      loggedInUser=   LoggedInUser.fromJson(json.decode(prefs.getString(Keys.savedLoggedInUserKey,)??"{}"));
      notifyListeners();
      return loggedInUser;
    }
    return null;

  }

  Future<void> logOutUserDetailsLocally() async {

    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    prefs.setString(Keys.savedLoggedInUserKey, "{}");
    loggedInUser=LoggedInUser();
    notifyListeners();
  }




}
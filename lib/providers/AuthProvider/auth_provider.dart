import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/getSharedPref.dart';
import '../../data/keys.dart';
import '../../data/strings.dart';
import 'models/logged_in_user.dart';

class AuthProvider with ChangeNotifier{
   LoggedInUser? loggedInUser ;

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

  Future<Response<dynamic>> userRegistration({required String name,required String email,required String password,required String mobile,required String nationalityId,required String dateOfBirth, required String gender}) async {
    var url = '${Strings.baseAppAuthUrl}/auth/signup';
    Map<String, String> data = <String, String>{};
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    // data.putIfAbsent(Keys.userNameKey, () => userName);
    data.putIfAbsent(Keys.nameKey, () => name);
    data.putIfAbsent(Keys.emailKey, () => email);
    data.putIfAbsent(Keys.passwordKey, () => password);
    data.putIfAbsent(Keys.mobileKey, () => mobile);
    data.putIfAbsent(Keys.nationalityIdKey, () => nationalityId);
    data.putIfAbsent(Keys.dateOfBirthKey, () => dateOfBirth);
    data.putIfAbsent(Keys.genderKey, () => gender);

    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(data);
      var response = await dio.post(url, data: data,options: Options(headers: header));// options: Options(headers: header)
      print(response.data);
      loggedInUser = LoggedInUser.fromJson(response.data[Keys.bodyKey]);

      notifyListeners();

      saveUserDetailsLocally(loggedInUser!);



      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }

  Future<Response<dynamic>> verifyingUserByRequestingOTP({required String userToken}) async {

    var url = '${Strings.baseAppAuthUrl}/auth/verifiedUserOTP';

    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);


    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(data);
      var response = await dio.post(url,options: Options(headers: header));// options: Options(headers: header)
      print(response.data);

      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }

  Future<Response<dynamic>> verifyingUserBySendingOTP({required String userToken, required String OTP}) async {

    var url = '${Strings.baseAppAuthUrl}/auth/verifiedUser';

    Map<String, String> header = <String, String>{};
    Map<String, String> data = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);
    data.putIfAbsent(Keys.otpKey, () => OTP);

    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(data);
      var response = await dio.post(url,data: data,options: Options(headers: header));// options: Options(headers: header)
      print(response.data);

      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }


   Future<Response<dynamic>> forgetPasswordRequestOTP({ required String mobileNumber}) async {

     var url = '${Strings.baseAppAuthUrl}/auth/forgetPassword';

     Map<String, String> header = <String, String>{};
     Map<String, String> data = <String, String>{};
     header.putIfAbsent(Keys.acceptKey, () => "application/json");
     data.putIfAbsent(Keys.mobileKey, () => mobileNumber);

     var dio = Dio();
     try {
       // FormData formData = FormData.fromMap(data);
       var response = await dio.post(url,data: data,options: Options(headers: header));// options: Options(headers: header)
       print(response.data);

       return response;
     } on DioError catch (e) {
       print(e.response);
       return e.response!;

     }
   }

   /// - Pending
   Future<Response<dynamic>> resetPasswordRequestOTP({ required String mobileNumber, required String OTP, required String currentPssword, required String newPassword}) async {

     var url = '${Strings.baseAppAuthUrl}/auth/forgetPassword';

     Map<String, String> header = <String, String>{};
     Map<String, String> data = <String, String>{};
     header.putIfAbsent(Keys.acceptKey, () => "application/json");
     data.putIfAbsent(Keys.mobileKey, () => mobileNumber);
     data.putIfAbsent(Keys.otpKey, () => OTP);
     data.putIfAbsent(Keys.passwordKey, () => currentPssword);
     data.putIfAbsent(Keys.confirmPasswordKey, () => newPassword);

     var dio = Dio();
     try {
       // FormData formData = FormData.fromMap(data);
       var response = await dio.post(url,data: data,options: Options(headers: header));// options: Options(headers: header)
       print(response.data);

       return response;
     } on DioError catch (e) {
       print(e.response);
       return e.response!;

     }
   }



}
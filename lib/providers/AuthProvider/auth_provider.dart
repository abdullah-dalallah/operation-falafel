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
   String? email ;
   String? password;

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
      email = email ;
      password = password ;
      notifyListeners();

      saveUserDetailsLocally(loggedInUser!, email, password);



      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }

  Future<void> saveUserDetailsLocally(LoggedInUser user,String email, String password) async {

    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    prefs.setString(Keys.savedLoggedInUserKey, json.encode(user.toJson()));
    prefs.setString(Keys.emailKey, email);
    prefs.setString(Keys.passwordKey, password);

  }

  Future<LoggedInUser?> getSavedUserDetailsLocally() async {
    print('\x1B[33mFourth\x1B[0m');
    print("load logged in user data...");
    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    if(prefs.getString(Keys.savedLoggedInUserKey,)!="{}" && prefs.getString(Keys.savedLoggedInUserKey,)!=null){
      loggedInUser=   LoggedInUser.fromJson(json.decode(prefs.getString(Keys.savedLoggedInUserKey,)??"{}"));
      email =prefs.getString(Keys.emailKey);
      password =prefs.getString(Keys.passwordKey);
      notifyListeners();
      return loggedInUser;
    }
    return null;

  }

  Future<void> logOutUserDetailsLocally() async {

    SharedPreferences prefs = await GetSharedPref().getSharedPref();
    prefs.setString(Keys.savedLoggedInUserKey, "{}");
    loggedInUser=null;
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

      saveUserDetailsLocally(loggedInUser!, email, password);



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


   Future<Response<dynamic>> resetPasswordByOTP({ required String mobileNumber, required String OTP,  required String newPassword, required String confirmPassword}) async {

     var url = '${Strings.baseAppAuthUrl}/auth/changePassword';

     Map<String, String> header = <String, String>{};
     Map<String, String> data = <String, String>{};
     header.putIfAbsent(Keys.acceptKey, () => "application/json");
     data.putIfAbsent(Keys.mobileKey, () => mobileNumber);
     data.putIfAbsent(Keys.otpKey, () => OTP);
     data.putIfAbsent(Keys.passwordKey, () => newPassword);
     data.putIfAbsent(Keys.confirmPasswordKey, () => confirmPassword);

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

   Future<Response<dynamic>> resetPasswordByOldPassword({ required String userToken, required String oldPassword,  required String newPassword, required String confirmPassword}) async
   {

     var url = '${Strings.baseAppAuthUrl}/auth/changePasswordByCurrent';

     print("user token:${userToken}");
     Map<String, String> header = <String, String>{};
     Map<String, String> data = <String, String>{};
     header.putIfAbsent(Keys.acceptKey, () => "application/json");
     header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
     header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);

     data.putIfAbsent(Keys.oldPasswordKey, () => oldPassword);
     data.putIfAbsent(Keys.passwordKey, () => newPassword);
     data.putIfAbsent(Keys.confirmPasswordKey, () => confirmPassword);

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


   Future<Response<dynamic>> logoutFromAllDevices({ required String userToken, }) async {//required String email,  required String password

     var url = '${Strings.baseAppAuthUrl}auth/logoutFromAllDevices';

     Map<String, String> header = <String, String>{};
     Map<String, String> data = <String, String>{};
     header.putIfAbsent(Keys.acceptKey, () => "application/json");
     header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
     header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);
     // data.putIfAbsent(Keys.emailKey, () => email);
     // data.putIfAbsent(Keys.passwordKey, () => password);


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


   Future<Response<dynamic>> refreshUserToken({ required String userToken}) async {

     var url = '${Strings.baseAppAuthUrl}auth/refreshToken';

     Map<String, String> header = <String, String>{};
     Map<String, String> data = <String, String>{};
     header.putIfAbsent(Keys.acceptKey, () => "application/json");
     header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
     // header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);
     data.putIfAbsent(Keys.tokenKey, () => userToken);


     var dio = Dio();
     try {
       // FormData formData = FormData.fromMap(data);
       var response = await dio.post(url,data: data,options: Options(headers: header));// options: Options(headers: header)
       print("refresh res:${response.data}");
       if(response.statusCode==200){
         // Map<String, dynamic> dataMap = jsonDecode(jsonData);
         print("user token before refresh ${loggedInUser!.token!}");
         loggedInUser = LoggedInUser.fromJson(response.data);
         print("user token after refresh ${loggedInUser!.token!}");
         notifyListeners();

         saveUserDetailsLocally(loggedInUser!, email!, password!);
       }
       print(response.data);

       return response;
     } on DioError catch (e) {
       print(e.response);
       return e.response!;

     }
   }



}
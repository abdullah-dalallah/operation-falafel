

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/strings.dart';

class ContactProvider with ChangeNotifier {

  Future<Response<dynamic>> contactUS({
    required String userToken, required String name, required String email,
    required String phone, required String contact_reason_id, required String message
  }) async {
    var url = '${Strings.baseAppAuthUrl}contact-forms';

    Map<String, String> header = <String, String>{};
    Map<String, String> data = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);

    data.putIfAbsent(Keys.nameKey, () => name);
    data.putIfAbsent(Keys.emailKey, () => email);
    data.putIfAbsent(Keys.phoneKey, () => phone);
    data.putIfAbsent(Keys.contact_reason_idKey, () => contact_reason_id);
    data.putIfAbsent(Keys.messageKey, () => message);

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

  Future<Response<dynamic>> getReasonContactUSForm({required String userToken,}) async {
    var url = '${Strings.baseAppAuthUrl}contact-reasons';

    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);


    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(data);
      var response = await dio.get(url,options: Options(headers: header));// options: Options(headers: header)
      print(response.data);

      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }

  Future<Response<dynamic>> feedBack({required String userToken,required double rate, required String message}) async {
    var url = '${Strings.baseAppAuthUrl}feedbacks';

    Map<String, String> header = <String, String>{};
    Map<String, dynamic> data = <String, dynamic>{};

    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);

    data.putIfAbsent(Keys.messageKey, () => message);
    data.putIfAbsent(Keys.rateKey, () => rate);


    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(data);
      var response = await dio.get(url,data:data,options: Options(headers: header));// options: Options(headers: header)
      print(response.data);

      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }

}
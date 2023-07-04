import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/strings.dart';
import 'package:operation_falafel/providers/gifts_provider/models/gift.dart';

class LoyaltyProvider with ChangeNotifier{

  List<Gift>? gifts ;

  Future<Response<dynamic>> getUserGiftsCards({ required String userToken, required String lng}) async {

    var url = '${Strings.baseGiftsUrl}/gifts-cards/my-cards';

    Map<String, String> header = <String, String>{};
    Map<String, String> data = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
    header.putIfAbsent(Keys.langKey, () => lng);



    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(data);
      var response = await dio.get(url,options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode==200){

        gifts = (response.data[Keys.bodyKey] as List).map((i) => Gift.fromJson(i)).toList();
        print(gifts!.length);
        print(gifts![0]!.name);
        notifyListeners();

      }


      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }


}
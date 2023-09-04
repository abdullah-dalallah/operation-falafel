import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/strings.dart';
import 'package:operation_falafel/providers/settings_provider/models/languages.dart';

class SettingProvider with ChangeNotifier{

  Languages? _languages ;
  Languages? get languages => _languages;

  Future<Response<dynamic>> getLanguages() async {
    print('\x1B[33mThird\x1B[0m');
    print("getting Languages from Online Server...");
    var url = '${Strings.baseAppContactUsUrl}languages';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");

    Map<String, String> body = <String, String>{};

    var dio = Dio();
    try {

      var response = await dio.get(url, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]!=false){
          _languages = Languages.fromJson(response.data);
          notifyListeners();
          print("Languages fetched From Online Server!");

        }

      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }


}
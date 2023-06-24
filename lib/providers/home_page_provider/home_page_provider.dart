import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/strings.dart';

import 'models/slider_model.dart';

class HomePageProvider with ChangeNotifier{
  List<SliderItem>? _sliderItem;
  List<SliderItem>? get sliderItem => _sliderItem;


  Future<Response<dynamic>> getHomeSliders() async {
    print("getting Slider from Online Server...");
    var url = '${Strings.baseSlidersUrl}/sliders';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");



    var dio = Dio();
    try {

      var response = await dio.get(url, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){
        _sliderItem= (response.data as List).map((i) =>
            SliderItem.fromJson(i)).toList();

        print("Slider fetched From Online Server!");
      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }
}
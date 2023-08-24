import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/strings.dart';
import 'package:operation_falafel/providers/gifts_provider/models/gift.dart';
import 'package:operation_falafel/providers/gifts_provider/models/gift_for_sale.dart';

import '../home_page_provider/models/slider_model.dart';

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

  List<GiftForSale>? GiftsForSale ;

  Future<Response<dynamic>> getGiftsCardsForSale({ required String userToken, required String lng, required country}) async {

    var url = '${Strings.baseGiftsUrl}/gifts-categories/for-sale';

    Map<String, String> header = <String, String>{};
    Map<String, String> data = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => userToken);
    header.putIfAbsent(Keys.langKey, () => lng);
    header.putIfAbsent(Keys.countryKey, () => country);



    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(data);
      var response = await dio.get(url,options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode==200){

        GiftsForSale = (response.data as List).map((i) => GiftForSale.fromJson(i)).toList();
        print(GiftsForSale!.length);
        print(GiftsForSale![0]!.name);
        notifyListeners();

      }


      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }

  List<SliderItem>? _sliderItem;
  List<SliderItem>? get sliderItem => _sliderItem;

  Future<Response<dynamic>> getLoyaltySliders() async {
    print("getting loyalty Slider from Online Server...");
    var url = '${Strings.baseSlidersUrl}/sliders?related_to=loyalty';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");



    var dio = Dio();
    try {

      var response = await dio.get(url, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){
       if ((response.data as List).isNotEmpty){
         _sliderItem= (response.data as List).map((i) => SliderItem.fromJson(i)).toList();
       print("Slider fetched From Online Server!");
       }else{
         print("Slider Empty");
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
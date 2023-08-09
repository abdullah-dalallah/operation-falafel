import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../data/strings.dart';

class PlacingOrderModelProvider with ChangeNotifier{


  /// --------------------------------------------------------------------------- Ordering
  double _makeOrderProgress = 0;
  double get makeOrderProgress => _makeOrderProgress;
  set makeOrderProgress(double value) {
    _makeOrderProgress = value;
  }

  Timer? _timer;

  void startTimer(placingOrderModelContext,) {
    _makeOrderProgress = 0;
    print(_makeOrderProgress);
    _timer = Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
      if (makeOrderProgress == 1) {
        print("Finish timer");

        timer.cancel();
        notifyListeners();
        closeCurrentModelByTimer(placingOrderModelContext);
      } else {
        String inString = _makeOrderProgress.toStringAsFixed(4); // '2.35'
        _makeOrderProgress = double.parse(inString);
        _makeOrderProgress += 0.001;
        notifyListeners();
      }
    });
  }

  void closeCurrentModelByTimer(context) {
    _timer?.cancel();
    Navigator.pop(context);
  }

  void closeCurrentModel(context) {
    _makeOrderProgress = 0;
    _timer?.cancel();
    Navigator.pop(context);
  }

  // Future<Response<dynamic>> makeOrder(String userToken, String selectedOrderAddressHash, String selectedPaymentMethod) async {
  //   const endPoint = Strings.baseUrlOrders + 'checkout?rest_api=1';
  //
  //   Map<String, String> header = <String, String>{};
  //   header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken);
  //   header.putIfAbsent(Keys.accessApi, () => Keys.accessApiKey);
  //   header.putIfAbsent(Keys.acceptKey, () => "application/json");
  //   Map<String, String> data = <String, String>{};
  //   data.putIfAbsent(Keys.orderAddress, () => selectedOrderAddressHash);
  //   data.putIfAbsent(Keys.paymentMethod, () => selectedPaymentMethod);
  //
  //   print(endPoint);
  //   print(selectedOrderAddressHash);
  //   print(selectedPaymentMethod);
  //
  //   FormData formData = FormData.fromMap(data);
  //   var dio = Dio();
  //   try {
  //     var response = await dio.post(endPoint,
  //         options: Options(headers: header), data: formData);
  //
  //     return response;
  //   } on DioError catch (e) {
  //     print(e.response);
  //
  //     return e.response!;
  //   }
  // }
}
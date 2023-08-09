import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:operation_falafel/models/NetworkPaymentModels/request_create_order_response.dart';
import 'package:operation_falafel/models/NetworkPaymentModels/request_submit_payment_card_information_response.dart';
import 'package:operation_falafel/models/NetworkPaymentModels/request_token_response.dart';

import '../../data/keys.dart';
import '../../data/network_constants.dart';



class NetworkTwoStagePaymentProvider with ChangeNotifier
{
  ///  - Parameters
  RequestTokenResponse _requestTokenResponse = RequestTokenResponse();
  RequestCreateOrderResponse _requestCreateOrderResponse = RequestCreateOrderResponse();
  RequestSubmitPaymentCardInformationResponse _requestSubmitPaymentCardInformationResponse = RequestSubmitPaymentCardInformationResponse();
  /// - Getters
  RequestTokenResponse get requestTokenResponse => _requestTokenResponse;
  RequestCreateOrderResponse get requestCreateOrderResponse => _requestCreateOrderResponse;
  RequestSubmitPaymentCardInformationResponse get requestSubmitPaymentCardInformationResponse => _requestSubmitPaymentCardInformationResponse;
  /// - Setters
  set requestSubmitPaymentCardInformationResponse(RequestSubmitPaymentCardInformationResponse value) {_requestSubmitPaymentCardInformationResponse = value;}
  set requestCreateOrderResponse(RequestCreateOrderResponse value) {_requestCreateOrderResponse = value;}
  set requestTokenResponse(RequestTokenResponse value) {_requestTokenResponse = value;}

  /// - Methods
  //
  ///  - Request an access token
  Future<Response<dynamic>> requestAccessToken(String API_key) async {
    const endPoint = '${NetworkConstants.networkBaseUrl}identity/auth/access-token';

    Map<String,String> header = <String,String>{};
    header.putIfAbsent(Keys.authorizationKey, () => "Basic "+ API_key);
    header.putIfAbsent(Keys.contentTypeKey, () => "application/vnd.ni-identity.v1+json");

    var dio = Dio();
    try {
      var response = await dio.post(endPoint,options: Options(headers: header));
      if(response.statusCode ==200){
        // print(response.data.runtimeType);
        // print(response.data);
        var  json = response.data;
        _requestTokenResponse = RequestTokenResponse.fromJson(json);
        // _mostPopularList = MostPopularList(status: MostPopularList.fromJson(json).status, articles:MostPopularList.fromJson(json).articles, copyright: MostPopularList.fromJson(json).copyright,numResults:MostPopularList.fromJson(json).numResults );
        print(_requestTokenResponse.accessToken);
        // print(_requestTokenResponse.expiresIn);
        // print(_requestTokenResponse.refreshExpiresIn);
        // print(_requestTokenResponse.refreshToken);
        // print(_requestTokenResponse.tokenType);

      }

      notifyListeners();
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.response!;
    }
  }

  //
  /// - Create an order
  Future<Response<dynamic>> requestCreateOrder(String accessToken,String outletReference) async {
    var endPoint = '${NetworkConstants.networkBaseUrl}transactions/outlets/$outletReference/orders';

    Map<String,String> header = <String,String>{};
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer  "+ accessToken);
    header.putIfAbsent(Keys.contentTypeKey, () => "application/vnd.ni-payment.v2+json");
    header.putIfAbsent(Keys.acceptKey, () => "application/vnd.ni-payment.v2+json");



    Map<String,String> amountBody = <String,String>{};
    amountBody.putIfAbsent(Keys.amountCurrencyCodeKey, () => "AED");
    amountBody.putIfAbsent(Keys.amountValueKey, () => "1000");

    Map<String,dynamic> merchantAttributesBody = <String,dynamic>{};
    merchantAttributesBody.putIfAbsent(Keys.redirectUrl, () => "https://www.google.com");
    merchantAttributesBody.putIfAbsent(Keys.skipConfirmationPage, () => true);

    Map<String,String> billingAddressBody = <String,String>{};
    billingAddressBody.putIfAbsent(Keys.billingAddressFirstNameKey, () => "The Gardens, building19, apt21, Dubai, United Arab Emirates");
    billingAddressBody.putIfAbsent(Keys.billingAddressLastNameKey, () => "The Gardens, building19, apt21, Dubai, United Arab Emirates");

    Map<String,dynamic> body = <String,dynamic>{};
    body.putIfAbsent(Keys.actionKey, () => NetworkConstants.purchaseAction);
    body.putIfAbsent(Keys.emailAddressKey, () => "Behak.kangarloo@pomechain.com");
    body.putIfAbsent(Keys.amountKey, () => amountBody);
    body.putIfAbsent(Keys.billingAddressKey, () => billingAddressBody);
    body.putIfAbsent(Keys.merchantAttributes, () => merchantAttributesBody);


    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(body);
      var response = await dio.post(endPoint,data:body,options: Options(headers: header));
      // print(response.data);
      // print(response.statusCode);
      if(response.statusCode ==201){
        // print(response.data);
        var  json = response.data;

        _requestCreateOrderResponse = RequestCreateOrderResponse.fromJson(json);
       print(_requestCreateOrderResponse.embedded!.payment![0].state);
      }

      notifyListeners();
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.response!;
    }
  }

  //
  /// - Submit payment card information
  Future<Response<dynamic>> requestSubmitPaymentCardInformation(String paymentUrl ,String accessToken, ) async {
    // var endPoint = '${NetworkConstants.networkBaseUrl}transactions/outlets/$outletReference/orders/$orderReference/payments/$paymentReference/card';
    var endPoint = paymentUrl;
    print(endPoint);
    Map<String,String> header = <String,String>{};
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer  $accessToken");
    header.putIfAbsent(Keys.contentTypeKey, () => NetworkConstants.contentTypeSubmitPayment);
    header.putIfAbsent(Keys.acceptKey, () => NetworkConstants.acceptSubmitPayment);



    Map<String,dynamic> body = <String,dynamic>{};
    body.putIfAbsent(Keys.panKey, () => "4111111111111111");
    body.putIfAbsent(Keys.expiryKey, () => "2025-04");
    body.putIfAbsent(Keys.cvvKey, () => "123");
    body.putIfAbsent(Keys.cardholderNameKey, () => "John Brown");



    var dio = Dio();
    try {
      // FormData formData = FormData.fromMap(body);
      var response = await dio.put(endPoint,data:body,options: Options(headers: header));
      print(response.data);
      // print(response.statusCode);

      if(response.statusCode ==201){
        // print(response.data["_links"]);
        var  json = response.data;

        _requestSubmitPaymentCardInformationResponse = RequestSubmitPaymentCardInformationResponse.fromJson(json);
        // print(_requestSubmitPaymentCardInformationResponse.links?.self!.href);
        // print(_requestSubmitPaymentCardInformationResponse.links?.curies!);
      }

      notifyListeners();
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        // print(e);
      }
      return e.response!;
    }
  }

  //
  /// - check the status of the Order
  ///  - Request an access token
  Future<Response<dynamic>> checkStatusOfPayment(String accessToken ,String orderRef ,String outletRef ,) async {
    var endPoint = '${NetworkConstants.networkBaseUrl}transactions/outlets/${outletRef}/orders/${orderRef}';

    Map<String,String> header = <String,String>{};
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer  "+ accessToken);
    // header.putIfAbsent(Keys.contentTypeKey, () => "application/vnd.ni-identity.v1+json");

    var dio = Dio();
    try {
      var response = await dio.get(endPoint,options: Options(headers: header));
      if(response.statusCode ==200){
        // var  json = response.data;
        // _requestTokenResponse = RequestTokenResponse.fromJson(json);
        // print(_requestTokenResponse.accessToken);


      }

      notifyListeners();
      return response;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.response!;
    }
  }
}
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../data/keys.dart';
import '../../data/strings.dart';
import 'Address/saved_address_list_res_model.dart';

class ProfileProvider with ChangeNotifier {


  /// - Get All User Address
  late SavedAddressList _savedAddressList = SavedAddressList();
  SavedAddressList get savedAddressList => _savedAddressList;
  set savedAddressList(SavedAddressList value) {
    _savedAddressList = value;
  }
  Future<Response<dynamic>> getUserSavedAddress(String userToken,) async {
    print("getting user Saved address from Online Server...");
    var url = '${Strings.baseAppAddressUrl}/address/user/3';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);



    var dio = Dio();
    try {

      var response = await dio.get(url, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]!=null){
          _savedAddressList =   SavedAddressList(
            success: SavedAddressList.fromJson(response.data).success,
            savedAddressItem: SavedAddressList.fromJson(response.data).savedAddressItem,
          );
          notifyListeners();
          print("Saved Addrees fetched From Online Server!");

        }

      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }
  /// - Get All User Address

  /// - Add New Address
  Future<Response<dynamic>> addNewUserAddress({required String userToken,required String addressLine,required String buildingName ,required String flatNumber,required String area,required int addressTypeId,required int isPrimary ,required int cityId, required String lat, required String long })
  async {
    print("Add new address to Online Server...");
    var url = '${Strings.baseAppAddressUrl}/address';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);

    Map<String, dynamic> data = <String, dynamic>{};
    data.putIfAbsent(Keys.nameKey, () => addressLine);
    data.putIfAbsent(Keys.areaKey, () => area);
    data.putIfAbsent(Keys.buildingKey, () => buildingName);
    data.putIfAbsent(Keys.flatKey, () => flatNumber);
    data.putIfAbsent(Keys.latKey, () => lat);
    data.putIfAbsent(Keys.longKey, () => long);
    data.putIfAbsent(Keys.is_primaryKey, () => isPrimary);
    data.putIfAbsent(Keys.address_type_idKey, () => addressTypeId);
    data.putIfAbsent(Keys.city_idKey, () => cityId);


    var dio = Dio();
    try {

      var response = await dio.post(url, options: Options(headers: header), data: data);// options: Options(headers: header)
      print(response.data);
      if(response.statusCode ==200){
          print("address added to the server");
      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }

  /// - Get Address Types List
  List<dynamic> _addressTypeList =[];

  List<dynamic> get addressTypeList => _addressTypeList;

  set addressTypeList(List<dynamic> value) {
    _addressTypeList = value;
  }

  Future<Response<dynamic>> getAddressTypesList(String userToken,) async {
    print("getting addresses types list from Online Server...");
    var url = '${Strings.baseAppAddressUrl}/address-type';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);



    var dio = Dio();
    try {

      var response = await dio.get(url, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]==true){

          _addressTypeList  = response.data[Keys.bodyKey];
          print(_addressTypeList);
          notifyListeners();
          print("addresses types list fetched From Online Server!");

        }

      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }


  /// - Get Cities List
  List<dynamic> _citiesList =[];

  ProfileProvider(this._citiesList);

  List<dynamic> get citiesList => _citiesList;

  set citiesList(List<dynamic> value) {
    _citiesList = value;
  }


  Future<Response<dynamic>> getCitiesList(String userToken,) async {
    print("getting Cities list from Online Server...");
    var url = '${Strings.baseAppAddressUrl}/address-type';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);



    var dio = Dio();
    try {

      var response = await dio.get(url, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]==true){

          _citiesList  = response.data[Keys.bodyKey];
          print(_citiesList);

          print("Ctiies list fetched From Online Server!");

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
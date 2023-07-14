import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/providers/ProfileProviders/models/Saved%20cards/card_item.dart';
import 'package:operation_falafel/providers/ProfileProviders/models/saved_address_list_res_model.dart';
import 'package:operation_falafel/providers/ProfileProviders/models/user_info_model.dart';
import 'package:intl/intl.dart';
import '../../data/keys.dart';
import '../../data/strings.dart';
import 'models/Saved cards/saved_cards.dart';


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
          // print(_addressTypeList);
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

  List<dynamic> get citiesList => _citiesList;

  set citiesList(List<dynamic> value) {
    _citiesList = value;
  }


  Future<Response<dynamic>> getCitiesList(String userToken,) async {
    print("getting Cities list from Online Server...");
    var url = '${Strings.baseAppThemeUrl}cities/country/1';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    // header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);



    var dio = Dio();
    try {

      var response = await dio.get(url, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]==true){

          _citiesList  = response.data[Keys.bodyKey];
          // print(_citiesList);

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



  /// - User info
  UserInfoModel? _userInfoModel ;
  UserInfoModel? get userInfoModel => _userInfoModel;

  Future<Response<dynamic>> getUserInfo(String userToken,String email, String password) async {
    print("getting user info Saved from Online Server...");
    var url = '${Strings.baseAppAuthUrl}user';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);
    Map<String, String> body = <String, String>{};
    body.putIfAbsent(Keys.emailKey, () => email);
    body.putIfAbsent(Keys.passwordKey, () => password);



    var dio = Dio();
    try {

      var response = await dio.get(url,data: body, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]!=null){
           _userInfoModel=  UserInfoModel.fromJson(response.data);
           updateForm(
               (_userInfoModel!.body!.name!!=null)?"${_userInfoModel!.body!.name!}":"",
               (_userInfoModel!.body!.email!=null)? "${_userInfoModel!.body!.email}":"",
               (_userInfoModel!.body!.mobile!=null)?"${_userInfoModel!.body!.mobile}" :"",
               ((_userInfoModel!.body!.dateOfBirth!=null)? _userInfoModel!.body!.dateOfBirth!:null),
               (_userInfoModel!.body!.gender!=null)?_userInfoModel!.body!.gender!:null
           );
          notifyListeners();
          print("Saved User fetched From Online Server!");

        }

      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }

  TextEditingController nameController =  TextEditingController();
  TextEditingController mobileController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController birthDateController =  TextEditingController();
  String? selectedGenderValue  ;

  void updateForm(String? name, String? email, String? mobile , DateTime? birthDate, String? gender) {
    nameController.text = name!;
    String tempMobile = mobile!.substring(3,mobile!.length);
    mobileController.text = tempMobile;
    emailController.text = email!;
    if(gender!=null)updateGender(gender!);
    if(birthDate!=null)
    birthDateController.text = DateFormat('yyyy-MM-dd').format(birthDate! ).toString();
    notifyListeners();
  }

  void resetForm() {
    nameController.clear();
    mobileController.clear();
    emailController.clear();
    updateGender(null);
    birthDateController.clear();
    notifyListeners();
  }

  void updateBirthDate(String? selectedDate){
    birthDateController.text = selectedDate!;
    notifyListeners();
  }
  void updateGender(String? gender){
    selectedGenderValue =gender ;
    notifyListeners();
  }

  Future<Response<dynamic>> updateUserInfo({required String userToken, required String name ,required String mobile , required String email , required String dateOfBirth, required String gender  }) async {
    print("update user info in Online Server...");
    var url = '${Strings.baseAppAuthUrl}user';
    print(url);
    print(mobile);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);
    Map<String, String> body = <String, String>{};
    body.putIfAbsent(Keys.emailKey, () => email);
    body.putIfAbsent(Keys.nameKey, () => name);
    body.putIfAbsent(Keys.mobileKey, () => mobile);
    body.putIfAbsent(Keys.dateOfBirthKey, () => dateOfBirth);
    body.putIfAbsent(Keys.genderKey, () => gender);



    var dio = Dio();
    try {

      var response = await dio.put(url,data: body, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]!=null){
          print(response.data);
          _userInfoModel=  UserInfoModel.fromJson(response.data);

          updateForm("${_userInfoModel!.body!.name!}", "${_userInfoModel!.body!.email}", "${_userInfoModel!.body!.mobile}" , _userInfoModel!.body!.dateOfBirth!, _userInfoModel!.body!.gender!);
          notifyListeners();
          // print("Saved User fetched From Online Server!");

        }

      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }


  /// - User Credit Cards
  SavedCards? _savedCards ;

  SavedCards? get savedCards => _savedCards;

  Future<Response<dynamic>> getUserCards(String userToken,) async {
    print("getting user info Saved from Online Server...");
    var url = '${Strings.baseAppCardsUrl}cards';
    print(url);
    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);
    Map<String, String> body = <String, String>{};

    var dio = Dio();
    try {

      var response = await dio.get(url,data: body, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]!=false){
          _savedCards = SavedCards.fromJson(response.data);
          notifyListeners();
          print("Saved User Cards fetched From Online Server!");

        }

      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }


  Future<Response<dynamic>> postUserCreditCard({required String userToken, required String cardHolderName ,required String cardNumber , required String expirationMonth , required String expirationYear, required bool isMain  }) async {
    print("update user info in Online Server...");
    var url = '${Strings.baseAppCardsUrl}cards';
    print(url);

    Map<String, String> header = <String, String>{};
    header.putIfAbsent(Keys.acceptKey, () => "application/json");
    header.putIfAbsent(Keys.x_of_awjKey, () => "${userToken}");
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken!);
    Map<String, dynamic> body = <String, dynamic>{};
    body.putIfAbsent(Keys.cardHolderNameKey, () => cardHolderName);
    body.putIfAbsent(Keys.cardNumberKey, () => cardNumber);
    body.putIfAbsent(Keys.expirationMonthKey, () => expirationMonth);
    body.putIfAbsent(Keys.expirationYearKey, () => expirationYear);
    body.putIfAbsent(Keys.isMainKey, () => isMain);



    var dio = Dio();
    try {

      var response = await dio.post(url,data: body, options: Options(headers: header));// options: Options(headers: header)

      if(response.statusCode ==200){

        if(response.data[Keys.successKey]!=null){
          print(response.data);


        }

      }
      notifyListeners();
      return response;
    } on DioError catch (e) {
      print(e.response);

      return e.response!;

    }
  }

  void addNewCard(CardItem card){
    if(card !=null){
      _savedCards!.body!.add(card);
      notifyListeners();
    }
  }

}
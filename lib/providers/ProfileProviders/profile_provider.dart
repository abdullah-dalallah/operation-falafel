import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../data/keys.dart';
import '../../data/strings.dart';
import 'Address/saved_address_list_res_model.dart';

class ProfileProvider with ChangeNotifier {


  /// - All User Address
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
    header.putIfAbsent(Keys.authorizationKey, () => "Bearer " + userToken);



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

}
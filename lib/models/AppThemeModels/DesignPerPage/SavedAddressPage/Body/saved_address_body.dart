// To parse this JSON data, do
//
//     final savedAddressBody = savedAddressBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/buttons.dart';
import '../../CommonElements/Elements/title_style.dart';
import 'Elements/address_list.dart';

SavedAddressBody savedAddressBodyFromJson(String str) => SavedAddressBody.fromJson(json.decode(str));

String savedAddressBodyToJson(SavedAddressBody data) => json.encode(data.toJson());

class SavedAddressBody {
  SavedAddressBody({
    required this.pageTitle,
    required this.emptyList,
    required this.addressList,
    required this.addNewAdressButton,
  });

  TitleStyle pageTitle;
  TitleStyle emptyList;
  AddressList addressList;
  Button addNewAdressButton;

  factory SavedAddressBody.fromJson(Map<String, dynamic> json) => SavedAddressBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    emptyList: TitleStyle.fromJson(json["EmptyList"]),
    addressList: AddressList.fromJson(json["AddressList"]),
    addNewAdressButton: Button.fromJson(json["AddNewAdressButton"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "EmptyList": emptyList.toJson(),
    "AddressList": addressList.toJson(),
    "AddNewAdressButton": addNewAdressButton.toJson(),
  };
}









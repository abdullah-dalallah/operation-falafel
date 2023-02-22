// To parse this JSON data, do
//
//     final editAddressPage = editAddressPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/add_new_address_appBar.dart';
import 'Body/edit_address_body.dart';

AddNewAddressPage editAddressPageFromJson(String str) => AddNewAddressPage.fromJson(json.decode(str));

String editAddressPageToJson(AddNewAddressPage data) => json.encode(data.toJson());

class AddNewAddressPage {
  AddNewAddressPage({
    required this.appBar,
    required this.body,
  });

  AddNewAddressAppBar appBar;
  AddNewAddressBody body;

  factory AddNewAddressPage.fromJson(Map<String, dynamic> json) => AddNewAddressPage(
    appBar: AddNewAddressAppBar.fromJson(json["AppBar"]),
    body: AddNewAddressBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}


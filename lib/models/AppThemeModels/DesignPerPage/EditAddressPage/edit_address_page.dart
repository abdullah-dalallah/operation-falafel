// To parse this JSON data, do
//
//     final editAddressPage = editAddressPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/edit_address_appBar.dart';
import 'Body/edit_address_body.dart';

EditAddressPage editAddressPageFromJson(String str) => EditAddressPage.fromJson(json.decode(str));

String editAddressPageToJson(EditAddressPage data) => json.encode(data.toJson());

class EditAddressPage {
  EditAddressPage({
    required this.appBar,
    required this.body,
  });

  EditAddressAppBar appBar;
  EditAddressBody body;

  factory EditAddressPage.fromJson(Map<String, dynamic> json) => EditAddressPage(
    appBar: EditAddressAppBar.fromJson(json["AppBar"]),
    body: EditAddressBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}


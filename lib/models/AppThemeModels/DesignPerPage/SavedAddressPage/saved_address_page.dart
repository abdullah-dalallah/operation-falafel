// To parse this JSON data, do
//
//     final savedAddressPage = savedAddressPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/saved_address_appbar.dart';
import 'Body/saved_address_body.dart';

SavedAddressPage savedAddressPageFromJson(String str) => SavedAddressPage.fromJson(json.decode(str));

String savedAddressPageToJson(SavedAddressPage data) => json.encode(data.toJson());

class SavedAddressPage {
  SavedAddressPage({
    required this.appBar,
    // required this.body,
  });

  SavedAddressAppbar appBar;
  // SavedAddressBody body;

  factory SavedAddressPage.fromJson(Map<String, dynamic> json) => SavedAddressPage(
    appBar: SavedAddressAppbar.fromJson(json["AppBar"]),
    // body: SavedAddressBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    // "Body": body.toJson(),
  };
}



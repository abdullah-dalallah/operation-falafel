// To parse this JSON data, do
//
//     final addNewCardPage = addNewCardPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/add_new_card_appbar.dart';
import 'Body/add_new_card_body.dart';

AddNewCardPage addNewCardPageFromJson(String str) => AddNewCardPage.fromJson(json.decode(str));

String addNewCardPageToJson(AddNewCardPage data) => json.encode(data.toJson());

class AddNewCardPage {
  AddNewCardAppBar? appBar;
  AddNewCardBody? body;

  AddNewCardPage({
    this.appBar,
    this.body,
  });

  factory AddNewCardPage.fromJson(Map<String, dynamic> json) => AddNewCardPage(
    appBar: json["AppBar"] == null ? null : AddNewCardAppBar.fromJson(json["AppBar"]),
    body: json["Body"] == null ? null : AddNewCardBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar?.toJson(),
    "Body": body?.toJson(),
  };
}
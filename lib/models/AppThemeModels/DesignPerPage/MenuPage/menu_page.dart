// To parse this JSON data, do
//
//     final menuPage = menuPageFromJson(jsonString);

import 'dart:convert';

import 'AppBar/menu_page_appbar.dart';
import 'Body/menu_page_body.dart';

MenuPage menuPageFromJson(String str) => MenuPage.fromJson(json.decode(str));

String menuPageToJson(MenuPage data) => json.encode(data.toJson());

class MenuPage {
  MenuPage({
    required this.appBar,
    required this.body,
  });

  MenuPageAppBar appBar;
  MenuPageBody body;

  factory MenuPage.fromJson(Map<String, dynamic> json) => MenuPage(
    appBar: MenuPageAppBar.fromJson(json["AppBar"]),
    body: MenuPageBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



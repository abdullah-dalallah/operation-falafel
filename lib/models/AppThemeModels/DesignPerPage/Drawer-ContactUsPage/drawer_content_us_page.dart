// To parse this JSON data, do
//
//     final drawerContactUsPage = drawerContactUsPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/drawer_contact_us_appbar.dart';
import 'Body/drawer_contact_us_body.dart';

DrawerContactUsPage drawerContactUsPageFromJson(String str) => DrawerContactUsPage.fromJson(json.decode(str));

String drawerContactUsPageToJson(DrawerContactUsPage data) => json.encode(data.toJson());

class DrawerContactUsPage {
  DrawerContactUsPage({
    required this.appBar,
    required this.body,
  });

  DrawerContactUsAppbar appBar;
  DrawerContactUsBody body;

  factory DrawerContactUsPage.fromJson(Map<String, dynamic> json) => DrawerContactUsPage(
    appBar: DrawerContactUsAppbar.fromJson(json["AppBar"]),
    body: DrawerContactUsBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



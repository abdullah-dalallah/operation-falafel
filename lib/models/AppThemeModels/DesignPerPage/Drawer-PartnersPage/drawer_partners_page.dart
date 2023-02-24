// To parse this JSON data, do
//
//     final drawerPartnersPage = drawerPartnersPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/drawer_partners_appbar.dart';
import 'Body/drawer_partners_body.dart';

DrawerPartnersPage drawerPartnersPageFromJson(String str) => DrawerPartnersPage.fromJson(json.decode(str));

String drawerPartnersPageToJson(DrawerPartnersPage data) => json.encode(data.toJson());

class DrawerPartnersPage {
  DrawerPartnersPage({
    required this.appBar,
    required this.body,
  });

  DrawerPartnersAppbar appBar;
  DrawerPartnersBody body;

  factory DrawerPartnersPage.fromJson(Map<String, dynamic> json) => DrawerPartnersPage(
    appBar: DrawerPartnersAppbar.fromJson(json["AppBar"]),
    body: DrawerPartnersBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



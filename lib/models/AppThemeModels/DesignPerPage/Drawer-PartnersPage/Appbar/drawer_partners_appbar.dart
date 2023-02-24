// To parse this JSON data, do
//
//     final drawerPartnersAppbar = drawerPartnersAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/title_style.dart';


DrawerPartnersAppbar drawerPartnersAppbarFromJson(String str) => DrawerPartnersAppbar.fromJson(json.decode(str));

String drawerPartnersAppbarToJson(DrawerPartnersAppbar data) => json.encode(data.toJson());

class DrawerPartnersAppbar {
  DrawerPartnersAppbar({
    required this.backIcon,
    required this.title,
  });

  DrawerIcon backIcon;
  TitleStyle title;

  factory DrawerPartnersAppbar.fromJson(Map<String, dynamic> json) => DrawerPartnersAppbar(
    backIcon: DrawerIcon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



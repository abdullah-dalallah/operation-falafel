// To parse this JSON data, do
//
//     final drawerContactUsAppbar = drawerContactUsAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

DrawerContactUsAppbar drawerContactUsAppbarFromJson(String str) => DrawerContactUsAppbar.fromJson(json.decode(str));

String drawerContactUsAppbarToJson(DrawerContactUsAppbar data) => json.encode(data.toJson());

class DrawerContactUsAppbar {
  DrawerContactUsAppbar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory DrawerContactUsAppbar.fromJson(Map<String, dynamic> json) => DrawerContactUsAppbar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



// To parse this JSON data, do
//
//     final drawerFeedBackAppbar = drawerFeedBackAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

DrawerFeedBackAppbar drawerFeedBackAppbarFromJson(String str) => DrawerFeedBackAppbar.fromJson(json.decode(str));

String drawerFeedBackAppbarToJson(DrawerFeedBackAppbar data) => json.encode(data.toJson());

class DrawerFeedBackAppbar {
  DrawerFeedBackAppbar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory DrawerFeedBackAppbar.fromJson(Map<String, dynamic> json) => DrawerFeedBackAppbar(
    backIcon:Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}


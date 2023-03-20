// To parse this JSON data, do
//
//     final drawerNotificationAppBar = drawerNotificationAppBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

DrawerNotificationAppBar drawerNotificationAppBarFromJson(String str) => DrawerNotificationAppBar.fromJson(json.decode(str));

String drawerNotificationAppBarToJson(DrawerNotificationAppBar data) => json.encode(data.toJson());

class DrawerNotificationAppBar {
  DrawerNotificationAppBar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory DrawerNotificationAppBar.fromJson(Map<String, dynamic> json) => DrawerNotificationAppBar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}


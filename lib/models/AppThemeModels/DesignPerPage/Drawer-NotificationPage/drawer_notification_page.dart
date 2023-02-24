// To parse this JSON data, do
//
//     final drawerNotificationPage = drawerNotificationPageFromJson(jsonString);

import 'dart:convert';

import 'AppBar/drawer_notification_appbar.dart';
import 'Body/drawer_notification_body.dart';

DrawerNotificationPage drawerNotificationPageFromJson(String str) => DrawerNotificationPage.fromJson(json.decode(str));

String drawerNotificationPageToJson(DrawerNotificationPage data) => json.encode(data.toJson());

class DrawerNotificationPage {
  DrawerNotificationPage({
    required this.appBar,
    required this.body,
  });

  DrawerNotificationAppBar appBar;
  DrawerNotificationBody body;

  factory DrawerNotificationPage.fromJson(Map<String, dynamic> json) => DrawerNotificationPage(
    appBar: DrawerNotificationAppBar.fromJson(json["AppBar"]),
    body: DrawerNotificationBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



// To parse this JSON data, do
//
//     final drawerFeedBackPage = drawerFeedBackPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/drawer_feedback_appbar.dart';
import 'Body/drawer_feedback_body.dart';

DrawerFeedBackPage drawerFeedBackPageFromJson(String str) => DrawerFeedBackPage.fromJson(json.decode(str));

String drawerFeedBackPageToJson(DrawerFeedBackPage data) => json.encode(data.toJson());

class DrawerFeedBackPage {
  DrawerFeedBackPage({
    required this.appBar,
    required this.body,
  });

  DrawerFeedBackAppbar appBar;
  DrawerFeedBackBody body;

  factory DrawerFeedBackPage.fromJson(Map<String, dynamic> json) => DrawerFeedBackPage(
    appBar: DrawerFeedBackAppbar.fromJson(json["AppBar"]),
    body: DrawerFeedBackBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}

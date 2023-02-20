// To parse this JSON data, do
//
//     final homePage = homePageFromJson(jsonString);

import 'dart:convert';

import 'AppBar/home_page_appbar.dart';
import 'Body/home_page_body.dart';

HomePage homePageFromJson(String str) => HomePage.fromJson(json.decode(str));

String homePageToJson(HomePage data) => json.encode(data.toJson());

class HomePage {
  HomePage({
    required this.appBar,
    required this.body,
  });

  HomePageAppBar appBar;
  HomePageBody body;

  factory HomePage.fromJson(Map<String, dynamic> json) => HomePage(
    appBar: HomePageAppBar.fromJson(json["AppBar"]),
    body: HomePageBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}


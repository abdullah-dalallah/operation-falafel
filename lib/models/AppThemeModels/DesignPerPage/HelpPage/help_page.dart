// To parse this JSON data, do
//
//     final helpPage = helpPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/help_appBar.dart';
import 'Body/help_body.dart';

HelpPage helpPageFromJson(String str) => HelpPage.fromJson(json.decode(str));

String helpPageToJson(HelpPage data) => json.encode(data.toJson());

class HelpPage {
  HelpPage({
    required this.appBar,
    required this.body,
  });

  HelpAppBar appBar;
  HelpBody body;

  factory HelpPage.fromJson(Map<String, dynamic> json) => HelpPage(
    appBar: HelpAppBar.fromJson(json["AppBar"]),
    body: HelpBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



// To parse this JSON data, do
//
//     final helpPage = helpPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/help_appBar.dart';
import 'Body/help_body.dart';

DesignHelpPage helpPageFromJson(String str) => DesignHelpPage.fromJson(json.decode(str));

String helpPageToJson(DesignHelpPage data) => json.encode(data.toJson());

class DesignHelpPage {
  DesignHelpPage({
    required this.appBar,
    required this.body,
  });

  HelpAppBar appBar;
  HelpBody body;

  factory DesignHelpPage.fromJson(Map<String, dynamic> json) => DesignHelpPage(
    appBar: HelpAppBar.fromJson(json["AppBar"]),
    body: HelpBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



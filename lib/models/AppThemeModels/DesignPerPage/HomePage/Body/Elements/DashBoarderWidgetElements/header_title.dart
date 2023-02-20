// To parse this JSON data, do
//
//     final headerTitle = headerTitleFromJson(jsonString);

import 'dart:convert';

import 'text_style.dart';

HeaderTitle headerTitleFromJson(String str) => HeaderTitle.fromJson(json.decode(str));

String headerTitleToJson(HeaderTitle data) => json.encode(data.toJson());

class HeaderTitle {
  HeaderTitle({
    required this.creditText,
    required this.text,
  });

  TextStyle creditText;
  TextStyle text;

  factory HeaderTitle.fromJson(Map<String, dynamic> json) => HeaderTitle(
    creditText: TextStyle.fromJson(json["CreditText"]),
    text: TextStyle.fromJson(json["Text"]),
  );

  Map<String, dynamic> toJson() => {
    "CreditText": creditText.toJson(),
    "Text": text.toJson(),
  };
}



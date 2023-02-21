// To parse this JSON data, do
//
//     final headerTitle = headerTitleFromJson(jsonString);

import 'dart:convert';

import '../../../../CommonElements/Elements/title_style.dart';


HeaderTitle headerTitleFromJson(String str) => HeaderTitle.fromJson(json.decode(str));

String headerTitleToJson(HeaderTitle data) => json.encode(data.toJson());

class HeaderTitle {
  HeaderTitle({
    required this.creditText,
    required this.text,
  });

  TitleStyle creditText;
  TitleStyle text;

  factory HeaderTitle.fromJson(Map<String, dynamic> json) => HeaderTitle(
    creditText: TitleStyle.fromJson(json["CreditText"]),
    text: TitleStyle.fromJson(json["Text"]),
  );

  Map<String, dynamic> toJson() => {
    "CreditText": creditText.toJson(),
    "Text": text.toJson(),
  };
}



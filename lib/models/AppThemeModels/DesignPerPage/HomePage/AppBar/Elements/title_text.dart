// To parse this JSON data, do
//
//     final titleText = titleTextFromJson(jsonString);

import 'dart:convert';

TitleText titleTextFromJson(String str) => TitleText.fromJson(json.decode(str));

String titleTextToJson(TitleText data) => json.encode(data.toJson());

class TitleText {
  TitleText({
    required this.data,
    required this.color,
  });

  String data;
  String color;

  factory TitleText.fromJson(Map<String, dynamic> json) => TitleText(
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
  };
}

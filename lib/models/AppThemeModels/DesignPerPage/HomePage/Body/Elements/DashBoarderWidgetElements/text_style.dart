// To parse this JSON data, do
//
//     final textStyle = textStyleFromJson(jsonString);

import 'dart:convert';

TextStyle textStyleFromJson(String str) => TextStyle.fromJson(json.decode(str));

String textStyleToJson(TextStyle data) => json.encode(data.toJson());

class TextStyle {
  TextStyle({
    required this.data,
    required this.color,
  });

  String data;
  String color;

  factory TextStyle.fromJson(Map<String, dynamic> json) => TextStyle(
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
  };
}

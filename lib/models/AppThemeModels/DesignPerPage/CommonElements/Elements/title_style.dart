// To parse this JSON data, do
//
//     final titleStyle = titleStyleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TitleStyle titleStyleFromJson(String str) => TitleStyle.fromJson(json.decode(str));

String titleStyleToJson(TitleStyle data) => json.encode(data.toJson());

class TitleStyle {
  TitleStyle({
    required this.data,
    required this.color,
  });

  String data;
  String color;

  factory TitleStyle.fromJson(Map<String, dynamic> json) => TitleStyle(
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
  };
}

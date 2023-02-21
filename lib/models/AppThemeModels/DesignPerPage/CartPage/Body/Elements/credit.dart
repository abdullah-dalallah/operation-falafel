// To parse this JSON data, do
//
//     final credit = creditFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Credit creditFromJson(String str) => Credit.fromJson(json.decode(str));

String creditToJson(Credit data) => json.encode(data.toJson());

class Credit {
  Credit({
    required this.visibility,
    required this.data,
    required this.color,
  });

  String visibility;
  String data;
  String color;

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
    visibility: json["visibility"],
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "Data": data,
    "Color": color,
  };
}

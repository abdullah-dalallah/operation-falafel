// To parse this JSON data, do
//
//     final bringItButton = bringItButtonFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BringItButton bringItButtonFromJson(String str) => BringItButton.fromJson(json.decode(str));

String bringItButtonToJson(BringItButton data) => json.encode(data.toJson());

class BringItButton {
  BringItButton({
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  String data;
  String color;
  String backGroundColor;

  factory BringItButton.fromJson(Map<String, dynamic> json) => BringItButton(
    data: json["Data"],
    color: json["Color"],
    backGroundColor: json["BackGroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "BackGroundColor": backGroundColor,
  };
}

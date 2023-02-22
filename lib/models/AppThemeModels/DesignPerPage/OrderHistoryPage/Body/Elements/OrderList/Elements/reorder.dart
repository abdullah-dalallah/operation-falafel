// To parse this JSON data, do
//
//     final reorder = reorderFromJson(jsonString);

import 'dart:convert';

import '../../../../../CommonElements/Elements/icon.dart';

Reorder reorderFromJson(String str) => Reorder.fromJson(json.decode(str));

String reorderToJson(Reorder data) => json.encode(data.toJson());

class Reorder {
  Reorder({
    required this.icon,
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  Icon icon;
  String data;
  String color;
  String backGroundColor;

  factory Reorder.fromJson(Map<String, dynamic> json) => Reorder(
    icon: Icon.fromJson(json["Icon"]),
    data: json["Data"],
    color: json["Color"],
    backGroundColor: json["BackGroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "Icon": icon.toJson(),
    "Data": data,
    "Color": color,
    "BackGroundColor": backGroundColor,
  };
}



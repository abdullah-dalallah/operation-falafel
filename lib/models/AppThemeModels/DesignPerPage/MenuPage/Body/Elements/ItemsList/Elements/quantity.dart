// To parse this JSON data, do
//
//     final quantity = quantityFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Quantity quantityFromJson(String str) => Quantity.fromJson(json.decode(str));

String quantityToJson(Quantity data) => json.encode(data.toJson());

class Quantity {
  Quantity({
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  String data;
  String color;
  String backGroundColor;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
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

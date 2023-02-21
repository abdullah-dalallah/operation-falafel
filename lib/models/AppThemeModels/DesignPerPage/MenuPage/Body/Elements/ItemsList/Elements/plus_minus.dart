// To parse this JSON data, do
//
//     final plusMinus = plusMinusFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlusMinus plusMinusFromJson(String str) => PlusMinus.fromJson(json.decode(str));

String plusMinusToJson(PlusMinus data) => json.encode(data.toJson());

class PlusMinus {
  PlusMinus({
    required this.backGroundColor,
    required this.iconColor,
  });

  String backGroundColor;
  String iconColor;

  factory PlusMinus.fromJson(Map<String, dynamic> json) => PlusMinus(
    backGroundColor: json["BackGroundColor"],
    iconColor: json["IconColor"],
  );

  Map<String, dynamic> toJson() => {
    "BackGroundColor": backGroundColor,
    "IconColor": iconColor,
  };
}

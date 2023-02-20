// To parse this JSON data, do
//
//     final fontSizes = fontSizesFromJson(jsonString);

import 'dart:convert';

import 'Language/lang.dart';

FontSizes fontSizesFromJson(String str) => FontSizes.fromJson(json.decode(str));

String fontSizesToJson(FontSizes data) => json.encode(data.toJson());

class FontSizes {
  FontSizes({
    required this.ar,
    required this.en,
  });

  Language ar;
  Language en;

  factory FontSizes.fromJson(Map<String, dynamic> json) => FontSizes(
    ar: Language.fromJson(json["AR"]),
    en: Language.fromJson(json["EN"]),
  );

  Map<String, dynamic> toJson() => {
    "AR": ar.toJson(),
    "EN": en.toJson(),
  };
}



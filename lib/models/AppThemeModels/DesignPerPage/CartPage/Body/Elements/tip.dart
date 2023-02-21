// To parse this JSON data, do
//
//     final tip = tipFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../CommonElements/Elements/title_style.dart';

Tip tipFromJson(String str) => Tip.fromJson(json.decode(str));

String tipToJson(Tip data) => json.encode(data.toJson());

class Tip {
  Tip({
    required this.visibility,
    required this.title,
    required this.textfieldHint,
  });

  String visibility;
  TitleStyle title;
  TitleStyle textfieldHint;

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
    visibility: json["visibility"],
    title: TitleStyle.fromJson(json["Title"]),
    textfieldHint: TitleStyle.fromJson(json["TextfieldHint"]),
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "Title": title.toJson(),
    "TextfieldHint": textfieldHint.toJson(),
  };
}



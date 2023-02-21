// To parse this JSON data, do
//
//     final specialInstructions = specialInstructionsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../../CommonElements/Elements/title_style.dart';

SpecialInstructions specialInstructionsFromJson(String str) => SpecialInstructions.fromJson(json.decode(str));

String specialInstructionsToJson(SpecialInstructions data) => json.encode(data.toJson());

class SpecialInstructions {
  SpecialInstructions({
    required this.visibility,
    required this.title,
    required this.textfieldHint,
  });

  String visibility;
  TitleStyle title;
  TitleStyle textfieldHint;

  factory SpecialInstructions.fromJson(Map<String, dynamic> json) => SpecialInstructions(
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



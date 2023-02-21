// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';

import 'Elements/DropDownWidget/dropdown_widget.dart';

Gender genderFromJson(String str) => Gender.fromJson(json.decode(str));

String genderToJson(Gender data) => json.encode(data.toJson());

class Gender {
  Gender({
    required this.data,
    required this.color,
    required this.dropDownWidget,
  });

  String data;
  String color;
  DropDownWidget dropDownWidget;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    data: json["Data"],
    color: json["Color"],
    dropDownWidget: DropDownWidget.fromJson(json["DropDownWidget"]),
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "DropDownWidget": dropDownWidget.toJson(),
  };
}







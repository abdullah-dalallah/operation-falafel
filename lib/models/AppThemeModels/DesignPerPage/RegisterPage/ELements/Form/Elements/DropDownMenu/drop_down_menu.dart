// To parse this JSON data, do
//
//     final gender = genderFromJson(jsonString);

import 'dart:convert';

import 'Elements/DropDownWidget/dropdown_widget.dart';

DropDownMenu genderFromJson(String str) => DropDownMenu.fromJson(json.decode(str));

String genderToJson(DropDownMenu data) => json.encode(data.toJson());

class DropDownMenu {
  DropDownMenu({
    required this.data,
    required this.color,
    required this.dropDownWidget,
  });

  String data;
  String color;
  DropDownWidget dropDownWidget;

  factory DropDownMenu.fromJson(Map<String, dynamic> json) => DropDownMenu(
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







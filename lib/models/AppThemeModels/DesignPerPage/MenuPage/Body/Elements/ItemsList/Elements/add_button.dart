// To parse this JSON data, do
//
//     final addButton = addButtonFromJson(jsonString);

import 'dart:convert';

AddButton addButtonFromJson(String str) => AddButton.fromJson(json.decode(str));

String addButtonToJson(AddButton data) => json.encode(data.toJson());

class AddButton {
  AddButton({
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  String data;
  String color;
  String backGroundColor;

  factory AddButton.fromJson(Map<String, dynamic> json) => AddButton(
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

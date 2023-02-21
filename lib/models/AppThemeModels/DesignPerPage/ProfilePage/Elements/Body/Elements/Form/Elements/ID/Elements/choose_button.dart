// To parse this JSON data, do
//
//     final chooseButton = chooseButtonFromJson(jsonString);

import 'dart:convert';

ChooseButton chooseButtonFromJson(String str) => ChooseButton.fromJson(json.decode(str));

String chooseButtonToJson(ChooseButton data) => json.encode(data.toJson());

class ChooseButton {
  ChooseButton({
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  String data;
  String color;
  String backGroundColor;

  factory ChooseButton.fromJson(Map<String, dynamic> json) => ChooseButton(
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

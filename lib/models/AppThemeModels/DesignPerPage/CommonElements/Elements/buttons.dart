// To parse this JSON data, do
//
//     final profileButton = profileButtonFromJson(jsonString);

import 'dart:convert';

Button profileButtonFromJson(String str) => Button.fromJson(json.decode(str));

String profileButtonToJson(Button data) => json.encode(data.toJson());

class Button {
  Button({
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  String data;
  String color;
  String backGroundColor;

  factory Button.fromJson(Map<String, dynamic> json) => Button(
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

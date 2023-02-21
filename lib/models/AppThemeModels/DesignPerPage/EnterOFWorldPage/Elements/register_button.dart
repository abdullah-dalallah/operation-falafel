// To parse this JSON data, do
//
//     final registerButton = registerButtonFromJson(jsonString);

import 'dart:convert';

RegisterButton registerButtonFromJson(String str) => RegisterButton.fromJson(json.decode(str));

String registerButtonToJson(RegisterButton data) => json.encode(data.toJson());

class RegisterButton {
  RegisterButton({
    required this.data,
    required this.color,
    required this.appleLogoColor,
    required this.backGroundColor,
  });

  String data;
  String color;
  String appleLogoColor;
  String backGroundColor;

  factory RegisterButton.fromJson(Map<String, dynamic> json) => RegisterButton(
    data: json["Data"],
    color: json["Color"],
    appleLogoColor: json["AppleLogoColor"],
    backGroundColor: json["BackGroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "AppleLogoColor": appleLogoColor,
    "BackGroundColor": backGroundColor,
  };
}

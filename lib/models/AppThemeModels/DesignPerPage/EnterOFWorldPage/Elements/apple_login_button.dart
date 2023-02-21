// To parse this JSON data, do
//
//     final appleLoginButton = appleLoginButtonFromJson(jsonString);

import 'dart:convert';

AppleLoginButton appleLoginButtonFromJson(String str) => AppleLoginButton.fromJson(json.decode(str));

String appleLoginButtonToJson(AppleLoginButton data) => json.encode(data.toJson());

class AppleLoginButton {
  AppleLoginButton({
    required this.data,
    required this.color,
    required this.appleLogoColor,
  });

  String data;
  String color;
  String appleLogoColor;

  factory AppleLoginButton.fromJson(Map<String, dynamic> json) => AppleLoginButton(
    data: json["Data"],
    color: json["Color"],
    appleLogoColor: json["AppleLogoColor"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "AppleLogoColor": appleLogoColor,
  };
}

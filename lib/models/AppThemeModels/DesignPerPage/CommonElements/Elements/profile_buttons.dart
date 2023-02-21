// To parse this JSON data, do
//
//     final profileButton = profileButtonFromJson(jsonString);

import 'dart:convert';

ProfileButton profileButtonFromJson(String str) => ProfileButton.fromJson(json.decode(str));

String profileButtonToJson(ProfileButton data) => json.encode(data.toJson());

class ProfileButton {
  ProfileButton({
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  String data;
  String color;
  String backGroundColor;

  factory ProfileButton.fromJson(Map<String, dynamic> json) => ProfileButton(
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

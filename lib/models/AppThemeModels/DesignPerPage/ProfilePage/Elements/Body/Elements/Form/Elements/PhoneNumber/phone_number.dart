// To parse this JSON data, do
//
//     final phoneNumber = phoneNumberFromJson(jsonString);

import 'dart:convert';

import 'ELements/verified_button.dart';

PhoneNumber phoneNumberFromJson(String str) => PhoneNumber.fromJson(json.decode(str));

String phoneNumberToJson(PhoneNumber data) => json.encode(data.toJson());

class PhoneNumber {
  PhoneNumber({
    required this.data,
    required this.color,
    required this.verifiedButton,
  });

  String data;
  String color;
  VerifiedButton verifiedButton;

  factory PhoneNumber.fromJson(Map<String, dynamic> json) => PhoneNumber(
    data: json["Data"],
    color: json["Color"],
    verifiedButton: VerifiedButton.fromJson(json["VerifiedButton"]),
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "VerifiedButton": verifiedButton.toJson(),
  };
}



// To parse this JSON data, do
//
//     final locationChangeButton = locationChangeButtonFromJson(jsonString);

import 'dart:convert';

LocationChangeButton locationChangeButtonFromJson(String str) => LocationChangeButton.fromJson(json.decode(str));

String locationChangeButtonToJson(LocationChangeButton data) => json.encode(data.toJson());

class LocationChangeButton {
  LocationChangeButton({
    required this.data,
    required this.color,
  });

  String data;
  String color;

  factory LocationChangeButton.fromJson(Map<String, dynamic> json) => LocationChangeButton(
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
  };
}

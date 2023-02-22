// To parse this JSON data, do
//
//     final primaryIcon = primaryIconFromJson(jsonString);

import 'dart:convert';

PrimaryIcon primaryIconFromJson(String str) => PrimaryIcon.fromJson(json.decode(str));

String primaryIconToJson(PrimaryIcon data) => json.encode(data.toJson());

class PrimaryIcon {
  PrimaryIcon({
    required this.activeIcon,
    required this.inactiveImage,
  });

  String activeIcon;
  String inactiveImage;

  factory PrimaryIcon.fromJson(Map<String, dynamic> json) => PrimaryIcon(
    activeIcon: json["ActiveIcon"],
    inactiveImage: json["InactiveImage"],
  );

  Map<String, dynamic> toJson() => {
    "ActiveIcon": activeIcon,
    "InactiveImage": inactiveImage,
  };
}

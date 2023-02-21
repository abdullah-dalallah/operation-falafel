// To parse this JSON data, do
//
//     final selectedIcon = selectedIconFromJson(jsonString);

import 'dart:convert';

SelectedIcon selectedIconFromJson(String str) => SelectedIcon.fromJson(json.decode(str));

String selectedIconToJson(SelectedIcon data) => json.encode(data.toJson());

class SelectedIcon {
  SelectedIcon({
    required this.imageIcon,
    required this.height,
    required this.width,
  });

  String imageIcon;
  String height;
  String width;

  factory SelectedIcon.fromJson(Map<String, dynamic> json) => SelectedIcon(
    imageIcon: json["ImageIcon"],
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "height": height,
    "width": width,
  };
}

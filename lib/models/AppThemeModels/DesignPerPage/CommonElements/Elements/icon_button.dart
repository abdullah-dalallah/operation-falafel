// To parse this JSON data, do
//
//     final iconButton = iconButtonFromJson(jsonString);

import 'dart:convert';

IconButton iconButtonFromJson(String str) => IconButton.fromJson(json.decode(str));

String iconButtonToJson(IconButton data) => json.encode(data.toJson());

class IconButton {
  IconButton({
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
    required this.backGroundColor,
  });

  String imageIcon;
  String mobileSize;
  String tabletSize;
  String backGroundColor;

  factory IconButton.fromJson(Map<String, dynamic> json) => IconButton(
    imageIcon: json["ImageIcon"],
    mobileSize: json["MobileSize"],
    tabletSize: json["TabletSize"],
    backGroundColor: json["BackGroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "MobileSize": mobileSize,
    "TabletSize": tabletSize,
    "BackGroundColor": backGroundColor,
  };
}

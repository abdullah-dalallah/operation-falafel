// To parse this JSON data, do
//
//     final bottomNavigationBarButtonStyle = bottomNavigationBarButtonStyleFromJson(jsonString);

import 'dart:convert';

BottomNavigationBarButtonStyle bottomNavigationBarButtonStyleFromJson(String str) => BottomNavigationBarButtonStyle.fromJson(json.decode(str));

String bottomNavigationBarButtonStyleToJson(BottomNavigationBarButtonStyle data) => json.encode(data.toJson());

class BottomNavigationBarButtonStyle {
  BottomNavigationBarButtonStyle({
    required this.visibility,
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
    required this.activeColor,
    required this.inactiveColor,
  });

  String visibility;
  String imageIcon;
  String mobileSize;
  String tabletSize;
  String activeColor;
  String inactiveColor;

  factory BottomNavigationBarButtonStyle.fromJson(Map<String, dynamic> json) => BottomNavigationBarButtonStyle(
    visibility: json["visibility"],
    imageIcon: json["ImageIcon"],
    mobileSize: json["MobileSize"],
    tabletSize: json["TabletSize"],
    activeColor: json["ActiveColor"],
    inactiveColor: json["InactiveColor"],
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "ImageIcon": imageIcon,
    "MobileSize": mobileSize,
    "TabletSize": tabletSize,
    "ActiveColor": activeColor,
    "InactiveColor": inactiveColor,
  };
}

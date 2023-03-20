// To parse this JSON data, do
//
//     final drawerIcon = drawerIconFromJson(jsonString);

import 'dart:convert';

DrawerIcon drawerIconFromJson(String str) => DrawerIcon.fromJson(json.decode(str));

String drawerIconToJson(DrawerIcon data) => json.encode(data.toJson());

class DrawerIcon {
  DrawerIcon({
   required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
    required this.center,
  });

  String imageIcon;
  String mobileSize;
  String tabletSize;
  String center;

  factory DrawerIcon.fromJson(Map<String, dynamic> json) => DrawerIcon(
    imageIcon: json["ImageIcon"],
    mobileSize: json["MobileSize"],
    tabletSize: json["TabletSize"],
    center: json["center"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "MobileSize": mobileSize,
    "TabletSize": tabletSize,
    "center": center,
  };
}

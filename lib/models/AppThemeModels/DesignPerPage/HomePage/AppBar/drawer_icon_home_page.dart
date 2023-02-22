// To parse this JSON data, do
//
//     final drawerIconHomepage = drawerIconHomepageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DrawerIconHomepage drawerIconHomepageFromJson(String str) => DrawerIconHomepage.fromJson(json.decode(str));

String drawerIconHomepageToJson(DrawerIconHomepage data) => json.encode(data.toJson());

class DrawerIconHomepage {
  DrawerIconHomepage({
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
    required this.center,
  });

  String imageIcon;
  String mobileSize;
  String tabletSize;
  String center;

  factory DrawerIconHomepage.fromJson(Map<String, dynamic> json) => DrawerIconHomepage(
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

// To parse this JSON data, do
//
//     final drawerIcon = drawerIconFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

DrawerIcon drawerIconFromJson(String str) => DrawerIcon.fromJson(json.decode(str));

String drawerIconToJson(DrawerIcon data) => json.encode(data.toJson());

class DrawerIcon {
  DrawerIcon({
    required this.imageIcon,
    required this.size,
  });

  String imageIcon;
  String size;

  factory DrawerIcon.fromJson(Map<String, dynamic> json) => DrawerIcon(
    imageIcon: json["ImageIcon"],
    size: json["Size"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "Size": size,
  };
}

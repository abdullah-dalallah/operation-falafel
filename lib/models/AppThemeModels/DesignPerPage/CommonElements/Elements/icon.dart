// To parse this JSON data, do
//
//     final icon = iconFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Icon iconFromJson(String str) => Icon.fromJson(json.decode(str));

String iconToJson(Icon data) => json.encode(data.toJson());

class Icon {
  Icon({
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
  });

  String imageIcon;
  String mobileSize;
  String tabletSize;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
    imageIcon: json["ImageIcon"],
    mobileSize: json["MobileSize"],
    tabletSize: json["TabletSize"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "MobileSize": mobileSize,
    "TabletSize": tabletSize,
  };
}

// To parse this JSON data, do
//
//     final locationIcon = locationIconFromJson(jsonString);

import 'dart:convert';

LocationIcon locationIconFromJson(String str) => LocationIcon.fromJson(json.decode(str));

String locationIconToJson(LocationIcon data) => json.encode(data.toJson());

class LocationIcon {
  LocationIcon({
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
  });

  String imageIcon;
  String mobileSize;
  String tabletSize;

  factory LocationIcon.fromJson(Map<String, dynamic> json) => LocationIcon(
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

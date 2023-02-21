// To parse this JSON data, do
//
//     final verifiedButton = verifiedButtonFromJson(jsonString);

import 'dart:convert';

VerifiedButton verifiedButtonFromJson(String str) => VerifiedButton.fromJson(json.decode(str));

String verifiedButtonToJson(VerifiedButton data) => json.encode(data.toJson());

class VerifiedButton {
  VerifiedButton({
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
    required this.backGroundColor,
  });

  String imageIcon;
  String mobileSize;
  String tabletSize;
  String backGroundColor;

  factory VerifiedButton.fromJson(Map<String, dynamic> json) => VerifiedButton(
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

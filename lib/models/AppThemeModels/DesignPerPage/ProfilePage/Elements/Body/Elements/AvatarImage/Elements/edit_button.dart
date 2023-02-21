// To parse this JSON data, do
//
//     final editButton = editButtonFromJson(jsonString);

import 'dart:convert';

EditButton editButtonFromJson(String str) => EditButton.fromJson(json.decode(str));

String editButtonToJson(EditButton data) => json.encode(data.toJson());

class EditButton {
  EditButton({
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
    required this.backGroundColor,
  });

  String imageIcon;
  String mobileSize;
  String tabletSize;
  String backGroundColor;

  factory EditButton.fromJson(Map<String, dynamic> json) => EditButton(
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

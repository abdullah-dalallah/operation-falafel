// To parse this JSON data, do
//
//     final selectAddress = selectAddressFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../CommonElements/Elements/icon.dart';
import '../../../CommonElements/Elements/title_style.dart';

SelectAddress selectAddressFromJson(String str) => SelectAddress.fromJson(json.decode(str));

String selectAddressToJson(SelectAddress data) => json.encode(data.toJson());

class SelectAddress {
  SelectAddress({
    required this.visibility,
    required this.title,
    required this.backGroundColor,
    required this.hintText,
    required this.icon,
  });

  String visibility;
  TitleStyle title;
  String backGroundColor;
  TitleStyle hintText;
  Icon icon;

  factory SelectAddress.fromJson(Map<String, dynamic> json) => SelectAddress(
    visibility: json["visibility"],
    title: TitleStyle.fromJson(json["Title"]),
    backGroundColor: json["BackGroundColor"],
    hintText: TitleStyle.fromJson(json["HintText"]),
    icon: Icon.fromJson(json["Icon"]),
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "Title": title.toJson(),
    "BackGroundColor": backGroundColor,
    "HintText": hintText.toJson(),
    "Icon": icon.toJson(),
  };
}



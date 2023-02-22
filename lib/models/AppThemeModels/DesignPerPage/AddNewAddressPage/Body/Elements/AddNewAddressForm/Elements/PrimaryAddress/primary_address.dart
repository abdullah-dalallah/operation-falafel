// To parse this JSON data, do
//
//     final primaryAddress = primaryAddressFromJson(jsonString);

import 'dart:convert';

import '../../../../../../CommonElements/Elements/title_style.dart';
import 'Elements/primary_icon.dart';

PrimaryAddress primaryAddressFromJson(String str) => PrimaryAddress.fromJson(json.decode(str));

String primaryAddressToJson(PrimaryAddress data) => json.encode(data.toJson());

class PrimaryAddress {
  PrimaryAddress({
    required this.icon,
    required this.title,
  });

  PrimaryIcon icon;
  TitleStyle title;

  factory PrimaryAddress.fromJson(Map<String, dynamic> json) => PrimaryAddress(
    icon: PrimaryIcon.fromJson(json["Icon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "Icon": icon.toJson(),
    "Title": title.toJson(),
  };
}



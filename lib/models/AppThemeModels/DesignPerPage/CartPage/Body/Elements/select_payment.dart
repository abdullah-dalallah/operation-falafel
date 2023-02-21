// To parse this JSON data, do
//
//     final selectPayment = selectPaymentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../CommonElements/Elements/icon.dart';
import '../../../CommonElements/Elements/title_style.dart';

SelectPayment selectPaymentFromJson(String str) => SelectPayment.fromJson(json.decode(str));

String selectPaymentToJson(SelectPayment data) => json.encode(data.toJson());

class SelectPayment {
  SelectPayment({
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

  factory SelectPayment.fromJson(Map<String, dynamic> json) => SelectPayment(
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


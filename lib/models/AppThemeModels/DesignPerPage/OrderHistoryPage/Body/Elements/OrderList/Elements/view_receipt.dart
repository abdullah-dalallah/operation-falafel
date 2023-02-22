// To parse this JSON data, do
//
//     final viewReceipt = viewReceiptFromJson(jsonString);

import 'dart:convert';

import '../../../../../CommonElements/Elements/icon.dart';

ViewReceipt viewReceiptFromJson(String str) => ViewReceipt.fromJson(json.decode(str));

String viewReceiptToJson(ViewReceipt data) => json.encode(data.toJson());

class ViewReceipt {
  ViewReceipt({
    required this.icon,
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  Icon icon;
  String data;
  String color;
  String backGroundColor;

  factory ViewReceipt.fromJson(Map<String, dynamic> json) => ViewReceipt(
    icon: Icon.fromJson(json["Icon"]),
    data: json["Data"],
    color: json["Color"],
    backGroundColor: json["BackGroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "Icon": icon.toJson(),
    "Data": data,
    "Color": color,
    "BackGroundColor": backGroundColor,
  };
}



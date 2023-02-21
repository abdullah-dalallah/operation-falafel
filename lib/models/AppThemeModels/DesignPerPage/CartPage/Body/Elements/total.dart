// To parse this JSON data, do
//
//     final total = totalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../CommonElements/Elements/title_style.dart';

Total totalFromJson(String str) => Total.fromJson(json.decode(str));

String totalToJson(Total data) => json.encode(data.toJson());

class Total {
  Total({
    required this.backGroundColor,
    required this.totalTitle,
    required this.price,
  });

  String backGroundColor;
  TitleStyle totalTitle;
  TitleStyle price;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    backGroundColor: json["BackGroundColor"],
    totalTitle: TitleStyle.fromJson(json["TotalTitle"]),
    price: TitleStyle.fromJson(json["Price"]),
  );

  Map<String, dynamic> toJson() => {
    "BackGroundColor": backGroundColor,
    "TotalTitle": totalTitle.toJson(),
    "Price": price.toJson(),
  };
}



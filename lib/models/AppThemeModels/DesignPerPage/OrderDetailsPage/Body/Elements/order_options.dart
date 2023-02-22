// To parse this JSON data, do
//
//     final orderOptions = orderOptionsFromJson(jsonString);

import 'dart:convert';

import '../../../CommonElements/Elements/title_style.dart';

OrderOptions orderOptionsFromJson(String str) => OrderOptions.fromJson(json.decode(str));

String orderOptionsToJson(OrderOptions data) => json.encode(data.toJson());

class OrderOptions {
  OrderOptions({
    required this.optionTitle,
    required this.optionPrice,
  });

  TitleStyle optionTitle;
  TitleStyle optionPrice;

  factory OrderOptions.fromJson(Map<String, dynamic> json) => OrderOptions(
    optionTitle: TitleStyle.fromJson(json["OptionTitle"]),
    optionPrice: TitleStyle.fromJson(json["OptionPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "OptionTitle": optionTitle.toJson(),
    "OptionPrice": optionPrice.toJson(),
  };
}



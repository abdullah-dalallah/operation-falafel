// To parse this JSON data, do
//
//     final itemsList = itemsListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../../CommonElements/Elements/title_style.dart';
import 'Elements/plus_minus.dart';
import 'Elements/quantity.dart';

ItemsList itemsListFromJson(String str) => ItemsList.fromJson(json.decode(str));

String itemsListToJson(ItemsList data) => json.encode(data.toJson());

class ItemsList {
  ItemsList({
    required this.itemTitle,
    required this.optionsTitle,
    required this.plusMinus,
    required this.quantity,
    required this.totalPrice,
  });

  TitleStyle itemTitle;
  TitleStyle optionsTitle;
  PlusMinus plusMinus;
  Quantity quantity;
  TitleStyle totalPrice;

  factory ItemsList.fromJson(Map<String, dynamic> json) => ItemsList(
    itemTitle: TitleStyle.fromJson(json["ItemTitle"]),
    optionsTitle: TitleStyle.fromJson(json["OptionsTitle"]),
    plusMinus: PlusMinus.fromJson(json["Plus&Minus"]),
    quantity: Quantity.fromJson(json["Quantity"]),
    totalPrice: TitleStyle.fromJson(json["TotalPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "ItemTitle": itemTitle.toJson(),
    "OptionsTitle": optionsTitle.toJson(),
    "Plus&Minus": plusMinus.toJson(),
    "Quantity": quantity.toJson(),
    "TotalPrice": totalPrice.toJson(),
  };
}


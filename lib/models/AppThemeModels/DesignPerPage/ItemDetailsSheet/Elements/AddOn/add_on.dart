// To parse this JSON data, do
//
//     final addOn = addOnFromJson(jsonString);

import 'dart:convert';

import '../../../CommonElements/Elements/title_style.dart';
import '../../../MenuPage/Body/Elements/ItemsList/Elements/plus_minus.dart';
import '../../../MenuPage/Body/Elements/ItemsList/Elements/quantity.dart';

AddOn addOnFromJson(String str) => AddOn.fromJson(json.decode(str));

String addOnToJson(AddOn data) => json.encode(data.toJson());

class AddOn {
  AddOn({
    required this.title,
    required this.plusMinus,
    required this.quantity,
    required this.titlePrice,
  });

  TitleStyle title;
  PlusMinus plusMinus;
  Quantity quantity;
  TitleStyle titlePrice;

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
    title: TitleStyle.fromJson(json["Title"]),
    plusMinus: PlusMinus.fromJson(json["Plus&Minus"]),
    quantity: Quantity.fromJson(json["Quantity"]),
    titlePrice: TitleStyle.fromJson(json["Title&Price"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "Plus&Minus": plusMinus.toJson(),
    "Quantity": quantity.toJson(),
    "Title&Price": titlePrice.toJson(),
  };
}







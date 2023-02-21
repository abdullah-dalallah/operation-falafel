// To parse this JSON data, do
//
//     final itemDetailsSheet = itemDetailsSheetFromJson(jsonString);

import 'dart:convert';

import '../CommonElements/Elements/title_style.dart';
import 'Elements/AddOn/add_on.dart';
import 'Elements/add_to_cart.dart';
import 'Elements/options/options.dart';

ItemDetailsSheet itemDetailsSheetFromJson(String str) => ItemDetailsSheet.fromJson(json.decode(str));

String itemDetailsSheetToJson(ItemDetailsSheet data) => json.encode(data.toJson());

class ItemDetailsSheet {
  ItemDetailsSheet({
    required this.itemTitle,
    required this.itemSubTitle,
    required this.totalPrice,
    required this.options,
    required this.addOn,
    required this.addToCart,
  });

  TitleStyle itemTitle;
  TitleStyle itemSubTitle;
  TitleStyle totalPrice;
  Options options;
  AddOn addOn;
  AddToCart addToCart;

  factory ItemDetailsSheet.fromJson(Map<String, dynamic> json) => ItemDetailsSheet(
    itemTitle: TitleStyle.fromJson(json["ItemTitle"]),
    itemSubTitle: TitleStyle.fromJson(json["ItemSubTitle"]),
    totalPrice: TitleStyle.fromJson(json["TotalPrice"]),
    options: Options.fromJson(json["Options"]),
    addOn: AddOn.fromJson(json["AddOn"]),
    addToCart: AddToCart.fromJson(json["AddToCart"]),
  );

  Map<String, dynamic> toJson() => {
    "ItemTitle": itemTitle.toJson(),
    "ItemSubTitle": itemSubTitle.toJson(),
    "TotalPrice": totalPrice.toJson(),
    "Options": options.toJson(),
    "AddOn": addOn.toJson(),
    "AddToCart": addToCart.toJson(),
  };
}













// To parse this JSON data, do
//
//     final itemsList = itemsListFromJson(jsonString);

import 'dart:convert';

// import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CartPage/Body/Elements/ItemsList/Elements/quantity.dart';


import '../../../../CommonElements/Elements/title_style.dart';
import 'Elements/add_button.dart';
import 'Elements/plus_minus.dart';
import 'Elements/quantity.dart';

ItemsList itemsListFromJson(String str) => ItemsList.fromJson(json.decode(str));

String itemsListToJson(ItemsList data) => json.encode(data.toJson());

class ItemsList {
  ItemsList({
    required this.itemTitle,
    required this.itemSubTitle,
    required this.plusMinus,
    required this.quantity,
    required this.totalPrice,
    required this.addButton,
  });

  TitleStyle itemTitle;
  TitleStyle itemSubTitle;
  PlusMinus plusMinus;
  Quantity quantity;
  TitleStyle totalPrice;
  AddButton addButton;

  factory ItemsList.fromJson(Map<String, dynamic> json) => ItemsList(
    itemTitle: TitleStyle.fromJson(json["ItemTitle"]),
    itemSubTitle: TitleStyle.fromJson(json["ItemSubTitle"]),
    plusMinus: PlusMinus.fromJson(json["Plus&Minus"]),
    quantity: Quantity.fromJson(json["Quantity"]),
    totalPrice: TitleStyle.fromJson(json["TotalPrice"]),
    addButton: AddButton.fromJson(json["AddButton"]),
  );

  Map<String, dynamic> toJson() => {
    "ItemTitle": itemTitle.toJson(),
    "ItemSubTitle": itemSubTitle.toJson(),
    "Plus&Minus": plusMinus.toJson(),
    "Quantity": quantity.toJson(),
    "TotalPrice": totalPrice.toJson(),
    "AddButton": addButton.toJson(),
  };
}







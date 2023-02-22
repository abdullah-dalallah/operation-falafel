// To parse this JSON data, do
//
//     final orderTile = orderTileFromJson(jsonString);

import 'dart:convert';

import '../../../../CommonElements/Elements/title_style.dart';
import '../../../../OrderHistoryPage/Body/Elements/OrderList/Elements/reorder.dart';

OrderTile orderTileFromJson(String str) => OrderTile.fromJson(json.decode(str));

String orderTileToJson(OrderTile data) => json.encode(data.toJson());

class OrderTile {
  OrderTile({
    required this.orderTitle,
    required this.orderSubTitle,
    required this.reorder,
  });

  TitleStyle orderTitle;
  TitleStyle orderSubTitle;
  Reorder reorder;

  factory OrderTile.fromJson(Map<String, dynamic> json) => OrderTile(
    orderTitle: TitleStyle.fromJson(json["OrderTitle"]),
    orderSubTitle: TitleStyle.fromJson(json["OrderSubTitle"]),
    reorder: Reorder.fromJson(json["Reorder"]),
  );

  Map<String, dynamic> toJson() => {
    "OrderTitle": orderTitle.toJson(),
    "OrderSubTitle": orderSubTitle.toJson(),
    "Reorder": reorder.toJson(),
  };
}







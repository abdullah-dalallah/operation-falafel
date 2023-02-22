// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'dart:convert';

import '../../../../CommonElements/Elements/icon.dart';
import '../../../../CommonElements/Elements/title_style.dart';
import 'Elements/reorder.dart';
import 'Elements/view_receipt.dart';

OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
  OrderList({
    required this.orderTitle,
    required this.orderSubTitle,
    required this.viewReceipt,
    required this.reorder,
    required this.orderIcon,
  });

  TitleStyle orderTitle;
  TitleStyle orderSubTitle;
  ViewReceipt viewReceipt;
  Reorder reorder;
  Icon orderIcon;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    orderTitle: TitleStyle.fromJson(json["OrderTitle"]),
    orderSubTitle: TitleStyle.fromJson(json["OrderSubTitle"]),
    viewReceipt: ViewReceipt.fromJson(json["ViewReceipt"]),
    reorder: Reorder.fromJson(json["Reorder"]),
    orderIcon: Icon.fromJson(json["OrderIcon"]),
  );

  Map<String, dynamic> toJson() => {
    "OrderTitle": orderTitle.toJson(),
    "OrderSubTitle": orderSubTitle.toJson(),
    "ViewReceipt": viewReceipt.toJson(),
    "Reorder": reorder.toJson(),
    "OrderIcon": orderIcon.toJson(),
  };
}







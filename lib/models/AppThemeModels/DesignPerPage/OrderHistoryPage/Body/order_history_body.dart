// To parse this JSON data, do
//
//     final orderHistoryBody = orderHistoryBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';
import 'Elements/OrderList/order_list.dart';

OrderHistoryBody orderHistoryBodyFromJson(String str) => OrderHistoryBody.fromJson(json.decode(str));

String orderHistoryBodyToJson(OrderHistoryBody data) => json.encode(data.toJson());

class OrderHistoryBody {
  OrderHistoryBody({
    required this.pageTitle,
    required this.orderList,
  });

  TitleStyle pageTitle;
  OrderList orderList;

  factory OrderHistoryBody.fromJson(Map<String, dynamic> json) => OrderHistoryBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    orderList: OrderList.fromJson(json["OrderList"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "OrderList": orderList.toJson(),
  };
}


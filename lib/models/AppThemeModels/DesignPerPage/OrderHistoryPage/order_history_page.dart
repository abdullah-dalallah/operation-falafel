// To parse this JSON data, do
//
//     final orderHistoryPage = orderHistoryPageFromJson(jsonString);

import 'dart:convert';

import 'AppBar/Elements/order_history_appbar.dart';
import 'Body/order_history_body.dart';

OrderHistoryPage orderHistoryPageFromJson(String str) => OrderHistoryPage.fromJson(json.decode(str));

String orderHistoryPageToJson(OrderHistoryPage data) => json.encode(data.toJson());

class OrderHistoryPage {
  OrderHistoryPage({
    required this.appBar,
    required this.body,
  });

  OrderHistoryPageAppBar appBar;
  OrderHistoryBody body;

  factory OrderHistoryPage.fromJson(Map<String, dynamic> json) => OrderHistoryPage(
    appBar: OrderHistoryPageAppBar.fromJson(json["AppBar"]),
    body: OrderHistoryBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}





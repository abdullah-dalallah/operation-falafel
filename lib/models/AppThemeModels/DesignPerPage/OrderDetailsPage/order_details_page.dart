// To parse this JSON data, do
//
//     final orderDetailsPage = orderDetailsPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/order_details_appbar.dart';
import 'Body/order_details_body.dart';

OrderDetailsPage orderDetailsPageFromJson(String str) => OrderDetailsPage.fromJson(json.decode(str));

String orderDetailsPageToJson(OrderDetailsPage data) => json.encode(data.toJson());

class OrderDetailsPage {
  OrderDetailsPage({
    required this.appBar,
    required this.body,
  });

  OrderDetailsAppbar appBar;
  OrderDetailsBody body;

  factory OrderDetailsPage.fromJson(Map<String, dynamic> json) => OrderDetailsPage(
    appBar: OrderDetailsAppbar.fromJson(json["AppBar"]),
    body: OrderDetailsBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}


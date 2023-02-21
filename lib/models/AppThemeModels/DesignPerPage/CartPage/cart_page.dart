// To parse this JSON data, do
//
//     final cartPage = cartPageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'Appbar/cart_page_appbar.dart';
import 'Body/cart_page_body.dart';

CartPage cartPageFromJson(String str) => CartPage.fromJson(json.decode(str));

String cartPageToJson(CartPage data) => json.encode(data.toJson());

class CartPage {
  CartPage({
    required this.appBar,
    required this.body,
  });

  CartPageAppBar appBar;
  CartPageBody body;

  factory CartPage.fromJson(Map<String, dynamic> json) => CartPage(
    appBar: CartPageAppBar.fromJson(json["AppBar"]),
    body: CartPageBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}







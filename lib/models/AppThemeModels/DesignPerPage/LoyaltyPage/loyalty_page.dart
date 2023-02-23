// To parse this JSON data, do
//
//     final loyaltyPage = loyaltyPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_appbar.dart';
import 'Body/loyalty_body.dart';

LoyaltyPage loyaltyPageFromJson(String str) => LoyaltyPage.fromJson(json.decode(str));

String loyaltyPageToJson(LoyaltyPage data) => json.encode(data.toJson());

class LoyaltyPage {
  LoyaltyPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyAppBar appBar;
  LoyaltyBody body;

  factory LoyaltyPage.fromJson(Map<String, dynamic> json) => LoyaltyPage(
    appBar: LoyaltyAppBar.fromJson(json["AppBar"]),
    body: LoyaltyBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}


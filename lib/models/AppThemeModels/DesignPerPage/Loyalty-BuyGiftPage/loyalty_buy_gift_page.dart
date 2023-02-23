// To parse this JSON data, do
//
//     final loyaltyBuyGiftPage = loyaltyBuyGiftPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_buy_gift_page.dart';
import 'Body/loyalty_buy_gift_body.dart';

LoyaltyBuyGiftPage loyaltyBuyGiftPageFromJson(String str) => LoyaltyBuyGiftPage.fromJson(json.decode(str));

String loyaltyBuyGiftPageToJson(LoyaltyBuyGiftPage data) => json.encode(data.toJson());

class LoyaltyBuyGiftPage {
  LoyaltyBuyGiftPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyBuyGiftAppbar appBar;
  LoyaltyBuyGiftBody body;

  factory LoyaltyBuyGiftPage.fromJson(Map<String, dynamic> json) => LoyaltyBuyGiftPage(
    appBar: LoyaltyBuyGiftAppbar.fromJson(json["AppBar"]),
    body: LoyaltyBuyGiftBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



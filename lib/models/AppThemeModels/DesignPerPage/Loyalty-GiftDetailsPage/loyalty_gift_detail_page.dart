// To parse this JSON data, do
//
//     final loyaltyGiftDetailsPage = loyaltyGiftDetailsPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_gift_details_page.dart';
import 'Body/loyalty_gift_details_body.dart';

LoyaltyGiftDetailsPage loyaltyGiftDetailsPageFromJson(String str) => LoyaltyGiftDetailsPage.fromJson(json.decode(str));

String loyaltyGiftDetailsPageToJson(LoyaltyGiftDetailsPage data) => json.encode(data.toJson());

class LoyaltyGiftDetailsPage {
  LoyaltyGiftDetailsPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyGiftDetailsAppbar appBar;
  LoyaltyGiftDetailsBody body;

  factory LoyaltyGiftDetailsPage.fromJson(Map<String, dynamic> json) => LoyaltyGiftDetailsPage(
    appBar: LoyaltyGiftDetailsAppbar.fromJson(json["AppBar"]),
    body: LoyaltyGiftDetailsBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



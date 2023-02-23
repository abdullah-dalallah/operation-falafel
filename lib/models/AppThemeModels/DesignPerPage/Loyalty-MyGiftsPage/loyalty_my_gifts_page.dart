// To parse this JSON data, do
//
//     final loyaltyMyGiftsPage = loyaltyMyGiftsPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_my_gifts_appbar.dart';
import 'Body/loyalty_my_gifts_body.dart';

LoyaltyMyGiftsPage loyaltyMyGiftsPageFromJson(String str) => LoyaltyMyGiftsPage.fromJson(json.decode(str));

String loyaltyMyGiftsPageToJson(LoyaltyMyGiftsPage data) => json.encode(data.toJson());

class LoyaltyMyGiftsPage {
  LoyaltyMyGiftsPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyMyGiftsAppbar appBar;
  LoyaltyMyGiftsBody body;

  factory LoyaltyMyGiftsPage.fromJson(Map<String, dynamic> json) => LoyaltyMyGiftsPage(
    appBar: LoyaltyMyGiftsAppbar.fromJson(json["AppBar"]),
    body: LoyaltyMyGiftsBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}


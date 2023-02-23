// To parse this JSON data, do
//
//     final loyaltyHowItWorkPage = loyaltyHowItWorkPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty-how_it_work_appbar.dart';
import 'Body/loyalty_how_it_work_body.dart';

LoyaltyHowItWorkPage loyaltyHowItWorkPageFromJson(String str) => LoyaltyHowItWorkPage.fromJson(json.decode(str));

String loyaltyHowItWorkPageToJson(LoyaltyHowItWorkPage data) => json.encode(data.toJson());

class LoyaltyHowItWorkPage {
  LoyaltyHowItWorkPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyHowItWorkAppbar appBar;
  LoyaltyHowItWorkBody body;

  factory LoyaltyHowItWorkPage.fromJson(Map<String, dynamic> json) => LoyaltyHowItWorkPage(
    appBar: LoyaltyHowItWorkAppbar.fromJson(json["AppBar"]),
    body: LoyaltyHowItWorkBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}





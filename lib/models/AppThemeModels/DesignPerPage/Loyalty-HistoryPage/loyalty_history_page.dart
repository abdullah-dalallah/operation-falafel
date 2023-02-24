// To parse this JSON data, do
//
//     final loyaltyHistoryPage = loyaltyHistoryPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_history_appbar.dart';
import 'Body/loyalty_history_body.dart';

LoyaltyHistoryPage loyaltyHistoryPageFromJson(String str) => LoyaltyHistoryPage.fromJson(json.decode(str));

String loyaltyHistoryPageToJson(LoyaltyHistoryPage data) => json.encode(data.toJson());

class LoyaltyHistoryPage {
  LoyaltyHistoryPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyHistoryAppBar appBar;
  LoyaltyHistoryBody body;

  factory LoyaltyHistoryPage.fromJson(Map<String, dynamic> json) => LoyaltyHistoryPage(
    appBar: LoyaltyHistoryAppBar.fromJson(json["AppBar"]),
    body: LoyaltyHistoryBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



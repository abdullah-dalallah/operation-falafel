// To parse this JSON data, do
//
//     final loyaltyTransferCreditPage = loyaltyTransferCreditPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_transfer_credit_appbar.dart';
import 'Body/loyalty_transfer_credit_body.dart';

LoyaltyTransferCreditPage loyaltyTransferCreditPageFromJson(String str) => LoyaltyTransferCreditPage.fromJson(json.decode(str));

String loyaltyTransferCreditPageToJson(LoyaltyTransferCreditPage data) => json.encode(data.toJson());

class LoyaltyTransferCreditPage {
  LoyaltyTransferCreditPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyTransferCreditAppbar appBar;
  LoyaltyTransferCreditBody body;

  factory LoyaltyTransferCreditPage.fromJson(Map<String, dynamic> json) => LoyaltyTransferCreditPage(
    appBar: LoyaltyTransferCreditAppbar.fromJson(json["AppBar"]),
    body: LoyaltyTransferCreditBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



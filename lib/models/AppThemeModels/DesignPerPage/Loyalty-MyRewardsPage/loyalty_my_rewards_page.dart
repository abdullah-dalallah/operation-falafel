// To parse this JSON data, do
//
//     final loyaltyMyRewardsPage = loyaltyMyRewardsPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_my_rewards_page.dart';
import 'Body/loyalty_my_rewards_body.dart';

LoyaltyMyRewardsPage loyaltyMyRewardsPageFromJson(String str) => LoyaltyMyRewardsPage.fromJson(json.decode(str));

String loyaltyMyRewardsPageToJson(LoyaltyMyRewardsPage data) => json.encode(data.toJson());

class LoyaltyMyRewardsPage {
  LoyaltyMyRewardsPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyMyRewardsAppbar appBar;
  LoyaltyMyRewardsBody body;

  factory LoyaltyMyRewardsPage.fromJson(Map<String, dynamic> json) => LoyaltyMyRewardsPage(
    appBar: LoyaltyMyRewardsAppbar.fromJson(json["AppBar"]),
    body: LoyaltyMyRewardsBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



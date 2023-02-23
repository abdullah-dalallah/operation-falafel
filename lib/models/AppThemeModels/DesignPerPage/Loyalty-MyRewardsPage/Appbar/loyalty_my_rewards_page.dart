// To parse this JSON data, do
//
//     final loyaltyMyRewardsAppbar = loyaltyMyRewardsAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyMyRewardsAppbar loyaltyMyRewardsAppbarFromJson(String str) => LoyaltyMyRewardsAppbar.fromJson(json.decode(str));

String loyaltyMyRewardsAppbarToJson(LoyaltyMyRewardsAppbar data) => json.encode(data.toJson());

class LoyaltyMyRewardsAppbar {
  LoyaltyMyRewardsAppbar({
    required this.backIcon,
    required this.title,
  });

  DrawerIcon backIcon;
  TitleStyle title;

  factory LoyaltyMyRewardsAppbar.fromJson(Map<String, dynamic> json) => LoyaltyMyRewardsAppbar(
    backIcon: DrawerIcon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}


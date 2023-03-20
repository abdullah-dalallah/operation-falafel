// To parse this JSON data, do
//
//     final loyaltyBuyGiftAppbar = loyaltyBuyGiftAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyBuyGiftAppbar loyaltyBuyGiftAppbarFromJson(String str) => LoyaltyBuyGiftAppbar.fromJson(json.decode(str));

String loyaltyBuyGiftAppbarToJson(LoyaltyBuyGiftAppbar data) => json.encode(data.toJson());

class LoyaltyBuyGiftAppbar {
  LoyaltyBuyGiftAppbar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory LoyaltyBuyGiftAppbar.fromJson(Map<String, dynamic> json) => LoyaltyBuyGiftAppbar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



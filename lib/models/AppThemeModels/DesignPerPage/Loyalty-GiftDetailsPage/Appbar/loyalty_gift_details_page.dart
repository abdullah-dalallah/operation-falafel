// To parse this JSON data, do
//
//     final loyaltyGiftDetailsAppbar = loyaltyGiftDetailsAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyGiftDetailsAppbar loyaltyGiftDetailsAppbarFromJson(String str) => LoyaltyGiftDetailsAppbar.fromJson(json.decode(str));

String loyaltyGiftDetailsAppbarToJson(LoyaltyGiftDetailsAppbar data) => json.encode(data.toJson());

class LoyaltyGiftDetailsAppbar {
  LoyaltyGiftDetailsAppbar({
    required this.backIcon,
    required this.title,
  });

  DrawerIcon backIcon;
  TitleStyle title;

  factory LoyaltyGiftDetailsAppbar.fromJson(Map<String, dynamic> json) => LoyaltyGiftDetailsAppbar(
    backIcon: DrawerIcon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



// To parse this JSON data, do
//
//     final loyaltyGiftDetailsAppbar = loyaltyGiftDetailsAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyGiftForSaleDetailsAppbar loyaltyGiftDetailsAppbarFromJson(String str) => LoyaltyGiftForSaleDetailsAppbar.fromJson(json.decode(str));

String loyaltyGiftDetailsAppbarToJson(LoyaltyGiftForSaleDetailsAppbar data) => json.encode(data.toJson());

class LoyaltyGiftForSaleDetailsAppbar {
  LoyaltyGiftForSaleDetailsAppbar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory LoyaltyGiftForSaleDetailsAppbar.fromJson(Map<String, dynamic> json) => LoyaltyGiftForSaleDetailsAppbar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



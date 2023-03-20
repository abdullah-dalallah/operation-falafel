// To parse this JSON data, do
//
//     final loyaltyMyGiftsAppbar = loyaltyMyGiftsAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyMyGiftsAppbar loyaltyMyGiftsAppbarFromJson(String str) => LoyaltyMyGiftsAppbar.fromJson(json.decode(str));

String loyaltyMyGiftsAppbarToJson(LoyaltyMyGiftsAppbar data) => json.encode(data.toJson());

class LoyaltyMyGiftsAppbar {
  LoyaltyMyGiftsAppbar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory LoyaltyMyGiftsAppbar.fromJson(Map<String, dynamic> json) => LoyaltyMyGiftsAppbar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



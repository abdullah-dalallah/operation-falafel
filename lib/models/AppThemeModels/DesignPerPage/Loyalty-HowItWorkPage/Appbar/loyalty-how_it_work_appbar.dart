// To parse this JSON data, do
//
//     final loyaltyHowItWorkAppbar = loyaltyHowItWorkAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyHowItWorkAppbar loyaltyHowItWorkAppbarFromJson(String str) => LoyaltyHowItWorkAppbar.fromJson(json.decode(str));

String loyaltyHowItWorkAppbarToJson(LoyaltyHowItWorkAppbar data) => json.encode(data.toJson());

class LoyaltyHowItWorkAppbar {
  LoyaltyHowItWorkAppbar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory LoyaltyHowItWorkAppbar.fromJson(Map<String, dynamic> json) => LoyaltyHowItWorkAppbar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}





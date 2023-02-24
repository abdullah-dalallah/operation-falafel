// To parse this JSON data, do
//
//     final loyaltyHistoryAppBar = loyaltyHistoryAppBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyHistoryAppBar loyaltyHistoryAppBarFromJson(String str) => LoyaltyHistoryAppBar.fromJson(json.decode(str));

String loyaltyHistoryAppBarToJson(LoyaltyHistoryAppBar data) => json.encode(data.toJson());

class LoyaltyHistoryAppBar {
  LoyaltyHistoryAppBar({
    required this.backIcon,
    required this.title,
  });

  DrawerIcon backIcon;
  TitleStyle title;

  factory LoyaltyHistoryAppBar.fromJson(Map<String, dynamic> json) => LoyaltyHistoryAppBar(
    backIcon: DrawerIcon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



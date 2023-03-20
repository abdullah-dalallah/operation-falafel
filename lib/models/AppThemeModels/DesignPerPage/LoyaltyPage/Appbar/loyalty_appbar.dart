// To parse this JSON data, do
//
//     final loyaltyAppBar = loyaltyAppBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyAppBar loyaltyAppBarFromJson(String str) => LoyaltyAppBar.fromJson(json.decode(str));

String loyaltyAppBarToJson(LoyaltyAppBar data) => json.encode(data.toJson());

class LoyaltyAppBar {
  LoyaltyAppBar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory LoyaltyAppBar.fromJson(Map<String, dynamic> json) => LoyaltyAppBar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}





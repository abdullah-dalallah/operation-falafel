// To parse this JSON data, do
//
//     final loyaltySendAsGiftAppBar = loyaltySendAsGiftAppBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltySendAsGiftAppBar loyaltySendAsGiftAppBarFromJson(String str) => LoyaltySendAsGiftAppBar.fromJson(json.decode(str));

String loyaltySendAsGiftAppBarToJson(LoyaltySendAsGiftAppBar data) => json.encode(data.toJson());

class LoyaltySendAsGiftAppBar {
  LoyaltySendAsGiftAppBar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory LoyaltySendAsGiftAppBar.fromJson(Map<String, dynamic> json) => LoyaltySendAsGiftAppBar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



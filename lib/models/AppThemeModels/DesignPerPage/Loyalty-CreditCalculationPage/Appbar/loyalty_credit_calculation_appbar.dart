// To parse this JSON data, do
//
//     final loyaltyCreditCalculationAppbar = loyaltyCreditCalculationAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyCreditCalculationAppbar loyaltyCreditCalculationAppbarFromJson(String str) => LoyaltyCreditCalculationAppbar.fromJson(json.decode(str));

String loyaltyCreditCalculationAppbarToJson(LoyaltyCreditCalculationAppbar data) => json.encode(data.toJson());

class LoyaltyCreditCalculationAppbar {
  LoyaltyCreditCalculationAppbar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory LoyaltyCreditCalculationAppbar.fromJson(Map<String, dynamic> json) => LoyaltyCreditCalculationAppbar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}


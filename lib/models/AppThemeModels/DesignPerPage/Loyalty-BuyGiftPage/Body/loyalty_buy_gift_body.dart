// To parse this JSON data, do
//
//     final loyaltyBuyGiftBody = loyaltyBuyGiftBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

LoyaltyBuyGiftBody loyaltyBuyGiftBodyFromJson(String str) => LoyaltyBuyGiftBody.fromJson(json.decode(str));

String loyaltyBuyGiftBodyToJson(LoyaltyBuyGiftBody data) => json.encode(data.toJson());

class LoyaltyBuyGiftBody {
  LoyaltyBuyGiftBody({
    required this.pageTitle,
  });

  TitleStyle pageTitle;

  factory LoyaltyBuyGiftBody.fromJson(Map<String, dynamic> json) => LoyaltyBuyGiftBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
  };
}



// To parse this JSON data, do
//
//     final loyaltyBody = loyaltyBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';
import 'Elements/buttons.dart';
import 'Elements/credit_balance.dart';

LoyaltyBody loyaltyBodyFromJson(String str) => LoyaltyBody.fromJson(json.decode(str));

String loyaltyBodyToJson(LoyaltyBody data) => json.encode(data.toJson());

class LoyaltyBody {
  LoyaltyBody({
    required this.pageTitle,
    required this.creditBalance,
    required this.buttons,
  });

  TitleStyle pageTitle;
  CreditBalance creditBalance;
  Buttons buttons;

  factory LoyaltyBody.fromJson(Map<String, dynamic> json) => LoyaltyBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    creditBalance: CreditBalance.fromJson(json["CreditBalance"]),
    buttons: Buttons.fromJson(json["Buttons"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "CreditBalance": creditBalance.toJson(),
    "Buttons": buttons.toJson(),
  };
}



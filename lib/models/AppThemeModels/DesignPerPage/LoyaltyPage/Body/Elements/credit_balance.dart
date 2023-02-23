// To parse this JSON data, do
//
//     final creditBalance = creditBalanceFromJson(jsonString);

import 'dart:convert';

import '../../../CommonElements/Elements/title_style.dart';

CreditBalance creditBalanceFromJson(String str) => CreditBalance.fromJson(json.decode(str));

String creditBalanceToJson(CreditBalance data) => json.encode(data.toJson());

class CreditBalance {
  CreditBalance({
    required this.backGroundColor,
    required this.creditTitle,
    required this.balance,
  });

  String backGroundColor;
  TitleStyle creditTitle;
  TitleStyle balance;

  factory CreditBalance.fromJson(Map<String, dynamic> json) => CreditBalance(
    backGroundColor: json["BackGroundColor"],
    creditTitle: TitleStyle.fromJson(json["CreditTitle"]),
    balance: TitleStyle.fromJson(json["Balance"]),
  );

  Map<String, dynamic> toJson() => {
    "BackGroundColor": backGroundColor,
    "CreditTitle": creditTitle.toJson(),
    "Balance": balance.toJson(),
  };
}



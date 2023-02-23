// To parse this JSON data, do
//
//     final buttons = buttonsFromJson(jsonString);

import 'dart:convert';

import '../../../CommonElements/Elements/buttons.dart';

Buttons buttonsFromJson(String str) => Buttons.fromJson(json.decode(str));

String buttonsToJson(Buttons data) => json.encode(data.toJson());

class Buttons {
  Buttons({
    required this.howItWorks,
    required this.myRewards,
    required this.referFriend,
    required this.transferCredits,
    required this.creditCalculator,
    required this.history,
  });

  Button howItWorks;
  Button myRewards;
  Button referFriend;
  Button transferCredits;
  Button creditCalculator;
  Button history;

  factory Buttons.fromJson(Map<String, dynamic> json) => Buttons(
    howItWorks: Button.fromJson(json["HowItWorks"]),
    myRewards: Button.fromJson(json["MyRewards"]),
    referFriend: Button.fromJson(json["ReferFriend"]),
    transferCredits: Button.fromJson(json["TransferCredits"]),
    creditCalculator: Button.fromJson(json["CreditCalculator"]),
    history: Button.fromJson(json["History"]),
  );

  Map<String, dynamic> toJson() => {
    "HowItWorks": howItWorks.toJson(),
    "MyRewards": myRewards.toJson(),
    "ReferFriend": referFriend.toJson(),
    "TransferCredits": transferCredits.toJson(),
    "CreditCalculator": creditCalculator.toJson(),
    "History": history.toJson(),
  };
}



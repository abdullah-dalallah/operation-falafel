// To parse this JSON data, do
//
//     final buttons = buttonsFromJson(jsonString);

import 'dart:convert';

import 'dashboard_buttons_style.dart';

Buttons buttonsFromJson(String str) => Buttons.fromJson(json.decode(str));

String buttonsToJson(Buttons data) => json.encode(data.toJson());

class Buttons {
  Buttons({
    required this.myCode,
    required this.myRewards,
    required this.referFriend,
    required this.transferCredit,
  });

  DashboardButtonsStyle myCode;
  DashboardButtonsStyle myRewards;
  DashboardButtonsStyle referFriend;
  DashboardButtonsStyle transferCredit;

  factory Buttons.fromJson(Map<String, dynamic> json) => Buttons(
    myCode: DashboardButtonsStyle.fromJson(json["MyCode"]),
    myRewards: DashboardButtonsStyle.fromJson(json["MyRewards"]),
    referFriend: DashboardButtonsStyle.fromJson(json["ReferFriend"]),
    transferCredit: DashboardButtonsStyle.fromJson(json["TransferCredit"]),
  );

  Map<String, dynamic> toJson() => {
    "MyCode": myCode.toJson(),
    "MyRewards": myRewards.toJson(),
    "ReferFriend": referFriend.toJson(),
    "TransferCredit": transferCredit.toJson(),
  };
}



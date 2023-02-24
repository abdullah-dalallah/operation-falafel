// To parse this JSON data, do
//
//     final loyaltyTransferCreditBody = loyaltyTransferCreditBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

LoyaltyTransferCreditBody loyaltyTransferCreditBodyFromJson(String str) => LoyaltyTransferCreditBody.fromJson(json.decode(str));

String loyaltyTransferCreditBodyToJson(LoyaltyTransferCreditBody data) => json.encode(data.toJson());

class LoyaltyTransferCreditBody {
  LoyaltyTransferCreditBody({
    required this.pageImage,
    required this.pageTitle,
    required this.form,
  });

  String pageImage;
  TitleStyle pageTitle;
  Form form;

  factory LoyaltyTransferCreditBody.fromJson(Map<String, dynamic> json) => LoyaltyTransferCreditBody(
    pageImage: json["PageImage"],
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    form: Form.fromJson(json["Form"]),
  );

  Map<String, dynamic> toJson() => {
    "PageImage": pageImage,
    "PageTitle": pageTitle.toJson(),
    "Form": form.toJson(),
  };
}

class Form {
  Form({
    required this.enterAmount,
    required this.creditLeft,
    required this.creditLeftTitle,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  TitleStyle enterAmount;
  CreditLeft creditLeft;
  TitleStyle creditLeftTitle;
  TitleStyle name;
  TitleStyle phoneNumber;
  TitleStyle email;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    enterAmount: TitleStyle.fromJson(json["EnterAmount"]),
    creditLeft: CreditLeft.fromJson(json["CreditLeft"]),
    creditLeftTitle: TitleStyle.fromJson(json["CreditLeftTitle"]),
    name: TitleStyle.fromJson(json["Name"]),
    phoneNumber: TitleStyle.fromJson(json["PhoneNumber"]),
    email: TitleStyle.fromJson(json["Email"]),
  );

  Map<String, dynamic> toJson() => {
    "EnterAmount": enterAmount.toJson(),
    "CreditLeft": creditLeft.toJson(),
    "CreditLeftTitle": creditLeftTitle.toJson(),
    "Name": name.toJson(),
    "PhoneNumber": phoneNumber.toJson(),
    "Email": email.toJson(),
  };
}

class CreditLeft {
  CreditLeft({
    required this.color,
  });

  String color;

  factory CreditLeft.fromJson(Map<String, dynamic> json) => CreditLeft(
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Color": color,
  };
}


// To parse this JSON data, do
//
//     final loyaltyCreditCalculationBody = loyaltyCreditCalculationBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

LoyaltyCreditCalculationBody loyaltyCreditCalculationBodyFromJson(String str) => LoyaltyCreditCalculationBody.fromJson(json.decode(str));

String loyaltyCreditCalculationBodyToJson(LoyaltyCreditCalculationBody data) => json.encode(data.toJson());

class LoyaltyCreditCalculationBody {
  LoyaltyCreditCalculationBody({
    required this.pageTitle,
    required this.form,
  });

  TitleStyle pageTitle;
  Form form;

  factory LoyaltyCreditCalculationBody.fromJson(Map<String, dynamic> json) => LoyaltyCreditCalculationBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    form: Form.fromJson(json["Form"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "Form": form.toJson(),
  };
}

class Form {
  Form({
    required this.enterAmount,
    required this.earnedCredit,
  });

  TitleStyle enterAmount;
  TitleStyle earnedCredit;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    enterAmount: TitleStyle.fromJson(json["EnterAmount"]),
    earnedCredit: TitleStyle.fromJson(json["EarnedCredit"]),
  );

  Map<String, dynamic> toJson() => {
    "EnterAmount": enterAmount.toJson(),
    "EarnedCredit": earnedCredit.toJson(),
  };
}



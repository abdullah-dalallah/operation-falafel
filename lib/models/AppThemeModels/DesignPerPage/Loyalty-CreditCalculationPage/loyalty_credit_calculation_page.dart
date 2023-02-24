// To parse this JSON data, do
//
//     final loyaltyCreditCalculationPage = loyaltyCreditCalculationPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_credit_calculation_appbar.dart';
import 'Body/loyalty_calculation_body.dart';

LoyaltyCreditCalculationPage loyaltyCreditCalculationPageFromJson(String str) => LoyaltyCreditCalculationPage.fromJson(json.decode(str));

String loyaltyCreditCalculationPageToJson(LoyaltyCreditCalculationPage data) => json.encode(data.toJson());

class LoyaltyCreditCalculationPage {
  LoyaltyCreditCalculationPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyCreditCalculationAppbar appBar;
  LoyaltyCreditCalculationBody body;

  factory LoyaltyCreditCalculationPage.fromJson(Map<String, dynamic> json) => LoyaltyCreditCalculationPage(
    appBar: LoyaltyCreditCalculationAppbar.fromJson(json["AppBar"]),
    body: LoyaltyCreditCalculationBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



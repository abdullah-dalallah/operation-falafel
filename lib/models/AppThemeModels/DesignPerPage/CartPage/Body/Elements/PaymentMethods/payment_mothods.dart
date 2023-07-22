// To parse this JSON data, do
//
//     final paymentMethods = paymentMethodsFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CartPage/Body/Elements/PaymentMethods/Elements/MethodCheckBox.dart';

import 'Elements/OFGifts.dart';

PaymentMethods paymentMethodsFromJson(String str) => PaymentMethods.fromJson(json.decode(str));

String paymentMethodsToJson(PaymentMethods data) => json.encode(data.toJson());

class PaymentMethods {
  MethodCheckBox? creditCardPaymentMethodCheckBox;
  MethodCheckBox? loyaltyCreditPeymantMethodCheckBox;
  OFGifts? oFGifts;

  PaymentMethods({
    this.creditCardPaymentMethodCheckBox,
    this.loyaltyCreditPeymantMethodCheckBox,
    this.oFGifts,
  });

  factory PaymentMethods.fromJson(Map<String, dynamic> json) => PaymentMethods(
    creditCardPaymentMethodCheckBox: json["CreditCardPaymentMethodCheckBox"] == null ? null : MethodCheckBox.fromJson(json["CreditCardPaymentMethodCheckBox"]),
    loyaltyCreditPeymantMethodCheckBox: json["LoyaltyCreditPeymantMethodCheckBox"] == null ? null : MethodCheckBox.fromJson(json["LoyaltyCreditPeymantMethodCheckBox"]),
    oFGifts: json["O:FGifts"] == null ? null : OFGifts.fromJson(json["O:FGifts"]),
  );

  Map<String, dynamic> toJson() => {
    "CreditCardPaymentMethodCheckBox": creditCardPaymentMethodCheckBox?.toJson(),
    "LoyaltyCreditPeymantMethodCheckBox": loyaltyCreditPeymantMethodCheckBox?.toJson(),
    "O:FGifts": oFGifts?.toJson(),
  };
}
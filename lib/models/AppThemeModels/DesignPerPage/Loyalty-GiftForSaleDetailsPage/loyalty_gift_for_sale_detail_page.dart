// To parse this JSON data, do
//
//     final loyaltyGiftDetailsPage = loyaltyGiftDetailsPageFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-GiftForSaleDetailsPage/Appbar/loyalty_gift_for_sale_details_page.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-GiftForSaleDetailsPage/Body/loyalty_gift_for_sale_details_body.dart';



LoyaltyGiftForSaleDetailsPage loyaltyGiftDetailsPageFromJson(String str) => LoyaltyGiftForSaleDetailsPage.fromJson(json.decode(str));

String loyaltyGiftDetailsPageToJson(LoyaltyGiftForSaleDetailsPage data) => json.encode(data.toJson());

class LoyaltyGiftForSaleDetailsPage {
  LoyaltyGiftForSaleDetailsPage({
    required this.appBar,
    required this.body,
  });

  LoyaltyGiftForSaleDetailsAppbar appBar;
  LoyaltyGiftForSaleDetailsBody body;

  factory LoyaltyGiftForSaleDetailsPage.fromJson(Map<String, dynamic> json) => LoyaltyGiftForSaleDetailsPage(
    appBar: LoyaltyGiftForSaleDetailsAppbar.fromJson(json["AppBar"]),
    body: LoyaltyGiftForSaleDetailsBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



// To parse this JSON data, do
//
//     final loyaltyGiftDetailsBody = loyaltyGiftDetailsBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/buttons.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyGiftDetailsBody loyaltyGiftDetailsBodyFromJson(String str) => LoyaltyGiftDetailsBody.fromJson(json.decode(str));

String loyaltyGiftDetailsBodyToJson(LoyaltyGiftDetailsBody data) => json.encode(data.toJson());

class LoyaltyGiftDetailsBody {
  LoyaltyGiftDetailsBody({
    required this.pageImage,
    required this.pageTitle,
    required this.giftTitle,
    required this.voucher,
    required this.redeemButton,
    required this.sendAsGiftButton,
  });

  String pageImage;
  TitleStyle pageTitle;
  TitleStyle giftTitle;
  Voucher voucher;
  Button redeemButton;
  TitleStyle sendAsGiftButton;

  factory LoyaltyGiftDetailsBody.fromJson(Map<String, dynamic> json) => LoyaltyGiftDetailsBody(
    pageImage: json["PageImage"],
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    giftTitle: TitleStyle.fromJson(json["GiftTitle"]),
    voucher: Voucher.fromJson(json["Voucher"]),
    redeemButton: Button.fromJson(json["RedeemButton"]),
    sendAsGiftButton: TitleStyle.fromJson(json["SendAsGiftButton"]),
  );

  Map<String, dynamic> toJson() => {
    "PageImage": pageImage,
    "PageTitle": pageTitle.toJson(),
    "GiftTitle": giftTitle.toJson(),
    "Voucher": voucher.toJson(),
    "RedeemButton": redeemButton.toJson(),
    "SendAsGiftButton": sendAsGiftButton.toJson(),
  };
}





class Voucher {
  Voucher({
    required this.title,
    required this.subTitle,
  });

  TitleStyle title;
  TitleStyle subTitle;

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
    title: TitleStyle.fromJson(json["Title"]),
    subTitle: TitleStyle.fromJson(json["SubTitle"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "SubTitle": subTitle.toJson(),
  };
}

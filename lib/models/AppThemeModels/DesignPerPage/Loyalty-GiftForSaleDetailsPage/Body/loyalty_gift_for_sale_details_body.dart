// To parse this JSON data, do
//
//     final loyaltyGiftDetailsBody = loyaltyGiftDetailsBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/buttons.dart';
import '../../CommonElements/Elements/title_style.dart';

LoyaltyGiftForSaleDetailsBody loyaltyGiftDetailsBodyFromJson(String str) => LoyaltyGiftForSaleDetailsBody.fromJson(json.decode(str));

String loyaltyGiftDetailsBodyToJson(LoyaltyGiftForSaleDetailsBody data) => json.encode(data.toJson());

class LoyaltyGiftForSaleDetailsBody {
  LoyaltyGiftForSaleDetailsBody({
    required this.pageImage,
    required this.pageTitle,
    required this.giftTitle,
    required this.voucher,
    required this.buyButton,
    required this.sendAsGiftButton,
    required this.redeemDialog,
  });

  String pageImage;
  TitleStyle pageTitle;
  TitleStyle giftTitle;
  Voucher voucher;
  Button buyButton;
  TitleStyle sendAsGiftButton;
  RedeemDialog redeemDialog;

  factory LoyaltyGiftForSaleDetailsBody.fromJson(Map<String, dynamic> json) => LoyaltyGiftForSaleDetailsBody(
    pageImage: json["PageImage"],
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    giftTitle: TitleStyle.fromJson(json["GiftTitle"]),
    voucher: Voucher.fromJson(json["Voucher"]),
    buyButton: Button.fromJson(json["BuyButton"]),
    sendAsGiftButton: TitleStyle.fromJson(json["SendAsGiftButton"]),
    redeemDialog: RedeemDialog.fromJson(json["RedeemDialog"]),
  );

  Map<String, dynamic> toJson() => {
    "PageImage": pageImage,
    "PageTitle": pageTitle.toJson(),
    "GiftTitle": giftTitle.toJson(),
    "Voucher": voucher.toJson(),
    "BuyButton": buyButton.toJson(),
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






class RedeemDialog {
  TitleStyle? dialogTitle;
  TitleStyle? giftTitle;
  TitleStyle? codeTitle;
  Button? copyPromoCodButton;
  TitleStyle? dineInTitle;

  RedeemDialog({
    this.dialogTitle,
    this.giftTitle,
    this.codeTitle,
    this.copyPromoCodButton,
    this.dineInTitle,
  });

  factory RedeemDialog.fromJson(Map<String, dynamic> json) => RedeemDialog(
    dialogTitle: json["DialogTitle"] == null ? null : TitleStyle.fromJson(json["DialogTitle"]),
    giftTitle: json["GiftTitle"] == null ? null : TitleStyle.fromJson(json["GiftTitle"]),
    codeTitle: json["CodeTitle"] == null ? null : TitleStyle.fromJson(json["CodeTitle"]),
    copyPromoCodButton: json["CopyPromoCodButton"] == null ? null : Button.fromJson(json["CopyPromoCodButton"]),
    dineInTitle: json["DineinTitle"] == null ? null : TitleStyle.fromJson(json["DineinTitle"]),
  );

  Map<String, dynamic> toJson() => {
    "DialogTitle": dialogTitle?.toJson(),
    "GiftTitle": giftTitle?.toJson(),
    "CodeTitle": codeTitle?.toJson(),
    "CopyPromoCodButton": copyPromoCodButton?.toJson(),
    "DineinTitle": dineInTitle?.toJson(),
  };
}
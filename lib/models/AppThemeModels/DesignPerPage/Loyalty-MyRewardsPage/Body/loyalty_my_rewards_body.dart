// To parse this JSON data, do
//
//     final loyaltyMyRewardsBody = loyaltyMyRewardsBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/buttons.dart';
import '../../CommonElements/Elements/title_style.dart';
import '../../HomePage/Body/Elements/DashBoarderWidgetElements/dashboard_buttons_style.dart';

LoyaltyMyRewardsBody loyaltyMyRewardsBodyFromJson(String str) => LoyaltyMyRewardsBody.fromJson(json.decode(str));

String loyaltyMyRewardsBodyToJson(LoyaltyMyRewardsBody data) => json.encode(data.toJson());

class LoyaltyMyRewardsBody {
  LoyaltyMyRewardsBody({
    required this.pageTitle,
    required this.pageImage,
    required this.myGiftsButton,
    required this.buyGiftButton,
    required this.myCode,
  });

  TitleStyle pageTitle;
  String pageImage;
  Button myGiftsButton;
  Button buyGiftButton;
  DashboardButtonsStyle myCode;

  factory LoyaltyMyRewardsBody.fromJson(Map<String, dynamic> json) => LoyaltyMyRewardsBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    pageImage: json["PageImage"],
    myGiftsButton: Button.fromJson(json["MyGiftsButton"]),
    buyGiftButton: Button.fromJson(json["BuyGiftButton"]),
    myCode: DashboardButtonsStyle.fromJson(json["MyCode"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "PageImage": pageImage,
    "MyGiftsButton": myGiftsButton.toJson(),
    "BuyGiftButton": buyGiftButton.toJson(),
    "MyCode": myCode.toJson(),
  };
}





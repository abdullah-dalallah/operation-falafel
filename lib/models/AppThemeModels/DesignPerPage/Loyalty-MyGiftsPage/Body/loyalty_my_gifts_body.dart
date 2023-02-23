// To parse this JSON data, do
//
//     final loyaltyMyGiftsBody = loyaltyMyGiftsBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

LoyaltyMyGiftsBody loyaltyMyGiftsBodyFromJson(String str) => LoyaltyMyGiftsBody.fromJson(json.decode(str));

String loyaltyMyGiftsBodyToJson(LoyaltyMyGiftsBody data) => json.encode(data.toJson());

class LoyaltyMyGiftsBody {
  LoyaltyMyGiftsBody({
    required this.pageTitle,
    required this.emptyList,
    required this.giftsList,
  });

  TitleStyle pageTitle;
  TitleStyle emptyList;
  GiftsList giftsList;

  factory LoyaltyMyGiftsBody.fromJson(Map<String, dynamic> json) => LoyaltyMyGiftsBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    emptyList: TitleStyle.fromJson(json["EmptyList"]),
    giftsList: GiftsList.fromJson(json["GiftsList"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "EmptyList": emptyList.toJson(),
    "GiftsList": giftsList.toJson(),
  };
}



class GiftsList {
  GiftsList({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  TitleStyle title;
  TitleStyle subTitle;
  String image;

  factory GiftsList.fromJson(Map<String, dynamic> json) => GiftsList(
    title: TitleStyle.fromJson(json["Title"]),
    subTitle: TitleStyle.fromJson(json["SubTitle"]),
    image: json["Image"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "SubTitle": subTitle.toJson(),
    "Image": image,
  };
}

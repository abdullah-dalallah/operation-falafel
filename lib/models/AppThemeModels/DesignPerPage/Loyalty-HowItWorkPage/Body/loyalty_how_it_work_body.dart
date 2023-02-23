// To parse this JSON data, do
//
//     final loyaltyHowItWorkBody = loyaltyHowItWorkBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

LoyaltyHowItWorkBody loyaltyHowItWorkBodyFromJson(String str) => LoyaltyHowItWorkBody.fromJson(json.decode(str));

String loyaltyHowItWorkBodyToJson(LoyaltyHowItWorkBody data) => json.encode(data.toJson());

class LoyaltyHowItWorkBody {
  LoyaltyHowItWorkBody({
    required this.pageTitle,
    required this.intro,
    required this.howItWorkItemList,
  });

  TitleStyle pageTitle;
  TitleStyle intro;
  List<HowItWorkItemList> howItWorkItemList;

  factory LoyaltyHowItWorkBody.fromJson(Map<String, dynamic> json) => LoyaltyHowItWorkBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    intro: TitleStyle.fromJson(json["Intro"]),
    howItWorkItemList: List<HowItWorkItemList>.from(json["HowItWorkItemList"].map((x) => HowItWorkItemList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "Intro": intro.toJson(),
    "HowItWorkItemList": List<dynamic>.from(howItWorkItemList.map((x) => x.toJson())),
  };
}

class HowItWorkItemList {
  HowItWorkItemList({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  TitleStyle title;
  TitleStyle subTitle;
  Image image;

  factory HowItWorkItemList.fromJson(Map<String, dynamic> json) => HowItWorkItemList(
    title: TitleStyle.fromJson(json["Title"]),
    subTitle: TitleStyle.fromJson(json["SubTitle"]),
    image: Image.fromJson(json["Image"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "SubTitle": subTitle.toJson(),
    "Image": image.toJson(),
  };
}

class Image {
  Image({
    required this.imagePath,
    required this.side,
  });

  String imagePath;
  String side;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    imagePath: json["imagePath"],
    side: json["side"],
  );

  Map<String, dynamic> toJson() => {
    "imagePath": imagePath,
    "side": side,
  };
}



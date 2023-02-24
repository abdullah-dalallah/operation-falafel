// To parse this JSON data, do
//
//     final loyaltyHistoryBody = loyaltyHistoryBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

LoyaltyHistoryBody loyaltyHistoryBodyFromJson(String str) => LoyaltyHistoryBody.fromJson(json.decode(str));

String loyaltyHistoryBodyToJson(LoyaltyHistoryBody data) => json.encode(data.toJson());

class LoyaltyHistoryBody {
  LoyaltyHistoryBody({
    required this.pageTitle,
    required this.historyList,
  });

  TitleStyle pageTitle;
  HistoryList historyList;

  factory LoyaltyHistoryBody.fromJson(Map<String, dynamic> json) => LoyaltyHistoryBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    historyList: HistoryList.fromJson(json["HistoryList"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "HistoryList": historyList.toJson(),
  };
}

class HistoryList {
  HistoryList({
    required this.title,
    required this.subTitle,
    required this.dateTitle,
  });

  TitleStyle title;
  TitleStyle subTitle;
  TitleStyle dateTitle;

  factory HistoryList.fromJson(Map<String, dynamic> json) => HistoryList(
    title: TitleStyle.fromJson(json["Title"]),
    subTitle: TitleStyle.fromJson(json["SubTitle"]),
    dateTitle: TitleStyle.fromJson(json["DateTitle"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "SubTitle": subTitle.toJson(),
    "DateTitle": dateTitle.toJson(),
  };
}



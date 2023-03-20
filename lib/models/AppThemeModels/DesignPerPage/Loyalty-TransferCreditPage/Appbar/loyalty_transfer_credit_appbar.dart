// To parse this JSON data, do
//
//     final loyaltyTransferCreditAppbar = loyaltyTransferCreditAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/icon.dart';

LoyaltyTransferCreditAppbar loyaltyTransferCreditAppbarFromJson(String str) => LoyaltyTransferCreditAppbar.fromJson(json.decode(str));

String loyaltyTransferCreditAppbarToJson(LoyaltyTransferCreditAppbar data) => json.encode(data.toJson());

class LoyaltyTransferCreditAppbar {
  LoyaltyTransferCreditAppbar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  Title title;

  factory LoyaltyTransferCreditAppbar.fromJson(Map<String, dynamic> json) => LoyaltyTransferCreditAppbar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: Title.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}

class BackIcon {
  BackIcon({
    required this.imageIcon,
    required this.size,
  });

  String imageIcon;
  String size;

  factory BackIcon.fromJson(Map<String, dynamic> json) => BackIcon(
    imageIcon: json["ImageIcon"],
    size: json["Size"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "Size": size,
  };
}

class Title {
  Title({
    required this.data,
    required this.color,
  });

  String data;
  String color;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
  };
}

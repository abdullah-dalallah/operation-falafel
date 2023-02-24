// To parse this JSON data, do
//
//     final drawerPartnersBody = drawerPartnersBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

DrawerPartnersBody drawerPartnersBodyFromJson(String str) => DrawerPartnersBody.fromJson(json.decode(str));

String drawerPartnersBodyToJson(DrawerPartnersBody data) => json.encode(data.toJson());

class DrawerPartnersBody {
  DrawerPartnersBody({
    required this.pageTitle,
    required this.partnersList,
  });

  TitleStyle pageTitle;
  PartnersList partnersList;

  factory DrawerPartnersBody.fromJson(Map<String, dynamic> json) => DrawerPartnersBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    partnersList: PartnersList.fromJson(json["PartnersList"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "PartnersList": partnersList.toJson(),
  };
}



class PartnersList {
  PartnersList({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  String image;
  TitleStyle title;
  TitleStyle subTitle;

  factory PartnersList.fromJson(Map<String, dynamic> json) => PartnersList(
    image: json["Image"],
    title: TitleStyle.fromJson(json["Title"]),
    subTitle: TitleStyle.fromJson(json["SubTitle"]),
  );

  Map<String, dynamic> toJson() => {
    "Image": image,
    "Title": title.toJson(),
    "SubTitle": subTitle.toJson(),
  };
}

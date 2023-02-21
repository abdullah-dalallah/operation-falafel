// To parse this JSON data, do
//
//     final appBar = appBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';



HomePageAppBar appBarFromJson(String str) => HomePageAppBar.fromJson(json.decode(str));

String appBarToJson(HomePageAppBar data) => json.encode(data.toJson());

class HomePageAppBar {
  HomePageAppBar({
    required this.drawerIcon,
    required this.titleText,
    required this.searchAction,
  });

  DrawerIcon drawerIcon;
  TitleStyle titleText;
  Icon searchAction;

  factory HomePageAppBar.fromJson(Map<String, dynamic> json) => HomePageAppBar(
    drawerIcon: DrawerIcon.fromJson(json["DrawerIcon"]),
    titleText: TitleStyle.fromJson(json["TitleText"]),
    searchAction: Icon.fromJson(json["SearchAction"]),
  );

  Map<String, dynamic> toJson() => {
    "DrawerIcon": drawerIcon.toJson(),
    "TitleText": titleText.toJson(),
    "SearchAction": searchAction.toJson(),
  };
}



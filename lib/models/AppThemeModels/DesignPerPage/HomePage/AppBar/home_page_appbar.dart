// To parse this JSON data, do
//
//     final appBar = appBarFromJson(jsonString);

import 'dart:convert';

import 'Elements/drawer_icon.dart';
import 'Elements/search_action.dart';
import 'Elements/title_text.dart';

HomePageAppBar appBarFromJson(String str) => HomePageAppBar.fromJson(json.decode(str));

String appBarToJson(HomePageAppBar data) => json.encode(data.toJson());

class HomePageAppBar {
  HomePageAppBar({
    required this.drawerIcon,
    required this.titleText,
    required this.searchAction,
  });

  DrawerIcon drawerIcon;
  TitleText titleText;
  SearchAction searchAction;

  factory HomePageAppBar.fromJson(Map<String, dynamic> json) => HomePageAppBar(
    drawerIcon: DrawerIcon.fromJson(json["DrawerIcon"]),
    titleText: TitleText.fromJson(json["TitleText"]),
    searchAction: SearchAction.fromJson(json["SearchAction"]),
  );

  Map<String, dynamic> toJson() => {
    "DrawerIcon": drawerIcon.toJson(),
    "TitleText": titleText.toJson(),
    "SearchAction": searchAction.toJson(),
  };
}



// To parse this JSON data, do
//
//     final helpAppBar = helpAppBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

HelpAppBar helpAppBarFromJson(String str) => HelpAppBar.fromJson(json.decode(str));

String helpAppBarToJson(HelpAppBar data) => json.encode(data.toJson());

class HelpAppBar {
  HelpAppBar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory HelpAppBar.fromJson(Map<String, dynamic> json) => HelpAppBar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



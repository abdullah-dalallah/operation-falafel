// To parse this JSON data, do
//
//     final appBar = appBarFromJson(jsonString);
import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';

import '../../CommonElements/Elements/title_style.dart';


TrackOrderPageAppBar appBarFromJson(String str) => TrackOrderPageAppBar.fromJson(json.decode(str));

String appBarToJson(TrackOrderPageAppBar data) => json.encode(data.toJson());

class TrackOrderPageAppBar {
  TrackOrderPageAppBar({
    required this.drawerIcon,
    required this.title,
  });

  DrawerIcon drawerIcon;
  TitleStyle title;

  factory TrackOrderPageAppBar.fromJson(Map<String, dynamic> json) => TrackOrderPageAppBar(
    drawerIcon: DrawerIcon.fromJson(json["DrawerIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "DrawerIcon": drawerIcon.toJson(),
    "Title": title.toJson(),
  };
}



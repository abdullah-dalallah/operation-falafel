// To parse this JSON data, do
//
//     final profilePageAppBar = profilePageAppBarFromJson(jsonString);

import 'dart:convert';

import '../../../CommonElements/Elements/drawer_Icon.dart';
import '../../../CommonElements/Elements/title_style.dart';

ProfilePageAppBar profilePageAppBarFromJson(String str) => ProfilePageAppBar.fromJson(json.decode(str));

String profilePageAppBarToJson(ProfilePageAppBar data) => json.encode(data.toJson());

class ProfilePageAppBar {
  ProfilePageAppBar({
    required this.drawerIcon,
    required this.title,
  });

  DrawerIcon drawerIcon;
  TitleStyle title;

  factory ProfilePageAppBar.fromJson(Map<String, dynamic> json) => ProfilePageAppBar(
    drawerIcon: DrawerIcon.fromJson(json["DrawerIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "DrawerIcon": drawerIcon.toJson(),
    "Title": title.toJson(),
  };
}




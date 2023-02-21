// To parse this JSON data, do
//
//     final appBar = appBarFromJson(jsonString);
import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/title_style.dart';






CartPageAppBar appBarFromJson(String str) => CartPageAppBar.fromJson(json.decode(str));

String appBarToJson(CartPageAppBar data) => json.encode(data.toJson());

class CartPageAppBar {
  CartPageAppBar({
    required this.drawerIcon,
    required this.title,
  });

  DrawerIcon drawerIcon;
  TitleStyle title;

  factory CartPageAppBar.fromJson(Map<String, dynamic> json) => CartPageAppBar(
    drawerIcon: DrawerIcon.fromJson(json["DrawerIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "DrawerIcon": drawerIcon.toJson(),
    "Title": title.toJson(),
  };
}



// To parse this JSON data, do
//
//     final menuPageAppBar = menuPageAppBarFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/search_action.dart';

import '../../CommonElements/Elements/drawer_Icon.dart';

MenuPageAppBar menuPageAppBarFromJson(String str) => MenuPageAppBar.fromJson(json.decode(str));

String menuPageAppBarToJson(MenuPageAppBar data) => json.encode(data.toJson());

class MenuPageAppBar {
  MenuPageAppBar({
    required this.drawerIcon,
    required this.searchAction,
  });

  DrawerIcon drawerIcon;
  SearchAction searchAction;

  factory MenuPageAppBar.fromJson(Map<String, dynamic> json) => MenuPageAppBar(
    drawerIcon: DrawerIcon.fromJson(json["DrawerIcon"]),
    searchAction: SearchAction.fromJson(json["SearchAction"]),
  );

  Map<String, dynamic> toJson() => {
    "DrawerIcon": drawerIcon.toJson(),
    "SearchAction": searchAction.toJson(),
  };
}



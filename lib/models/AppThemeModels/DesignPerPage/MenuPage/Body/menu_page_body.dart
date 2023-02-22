// To parse this JSON data, do
//
//     final menuPageBody = menuPageBodyFromJson(jsonString);

import 'dart:convert';

// import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/menu_checkbox.dart';

import '../../CommonElements/Elements/menu_checkbox.dart';
import 'Elements/ItemsList/items_list.dart';
import 'Elements/menus_title.dart';

MenuPageBody menuPageBodyFromJson(String str) => MenuPageBody.fromJson(json.decode(str));

String menuPageBodyToJson(MenuPageBody data) => json.encode(data.toJson());

class MenuPageBody {
  MenuPageBody({
    required this.menusTitle,
    required this.vegetarianCheckBox,
    required this.veganCheckBox,
    required this.itemsList,
  });

  MenusTitle menusTitle;
  MenuCheckBox vegetarianCheckBox;
  MenuCheckBox veganCheckBox;
  ItemsList itemsList;

  factory MenuPageBody.fromJson(Map<String, dynamic> json) => MenuPageBody(
    menusTitle: MenusTitle.fromJson(json["MenusTitle"]),
    vegetarianCheckBox: MenuCheckBox.fromJson(json["VegetarianCheckBox"]),
    veganCheckBox: MenuCheckBox.fromJson(json["VeganCheckBox"]),
    itemsList: ItemsList.fromJson(json["ItemsList"]),
  );

  Map<String, dynamic> toJson() => {
    "MenusTitle": menusTitle.toJson(),
    "VegetarianCheckBox": vegetarianCheckBox.toJson(),
    "VeganCheckBox": veganCheckBox.toJson(),
    "ItemsList": itemsList.toJson(),
  };
}










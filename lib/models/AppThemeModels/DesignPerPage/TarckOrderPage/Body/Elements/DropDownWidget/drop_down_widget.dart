// To parse this JSON data, do
//
//     final dropDownWidget = dropDownWidgetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../../CommonElements/Elements/title_style.dart';

import 'ELements/selected_icon.dart';

DropDownWidget dropDownWidgetFromJson(String str) => DropDownWidget.fromJson(json.decode(str));

String dropDownWidgetToJson(DropDownWidget data) => json.encode(data.toJson());

class DropDownWidget {
  DropDownWidget({
    required this.labelText,
    required this.itemsTitle,
    required this.itemsSubTitle,
    required this.selectedIcon,
  });

  TitleStyle labelText;
  TitleStyle itemsTitle;
  TitleStyle itemsSubTitle;
  SelectedIcon selectedIcon;

  factory DropDownWidget.fromJson(Map<String, dynamic> json) => DropDownWidget(
    labelText: TitleStyle.fromJson(json["LabelText"]),
    itemsTitle: TitleStyle.fromJson(json["ItemsTitle"]),
    itemsSubTitle: TitleStyle.fromJson(json["ItemsSubTitle"]),
    selectedIcon: SelectedIcon.fromJson(json["SelectedIcon"]),
  );

  Map<String, dynamic> toJson() => {
    "LabelText": labelText.toJson(),
    "ItemsTitle": itemsTitle.toJson(),
    "ItemsSubTitle": itemsSubTitle.toJson(),
    "SelectedIcon": selectedIcon.toJson(),
  };
}





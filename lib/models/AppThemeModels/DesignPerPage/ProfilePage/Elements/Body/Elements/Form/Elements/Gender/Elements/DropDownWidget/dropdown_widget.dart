// To parse this JSON data, do
//
//     final dropDownWidget = dropDownWidgetFromJson(jsonString);

import 'dart:convert';

import '../../../../../../../../../CommonElements/Elements/title_style.dart';
import 'Elements/selected_icon.dart';

DropDownWidget dropDownWidgetFromJson(String str) => DropDownWidget.fromJson(json.decode(str));

String dropDownWidgetToJson(DropDownWidget data) => json.encode(data.toJson());

class DropDownWidget {
  DropDownWidget({
    required this.labelText,
    required this.itemsTitle,
    required this.selectedIcon,
  });

  TitleStyle labelText;
  TitleStyle itemsTitle;
  SelectedIcon selectedIcon;

  factory DropDownWidget.fromJson(Map<String, dynamic> json) => DropDownWidget(
    labelText: TitleStyle.fromJson(json["LabelText"]),
    itemsTitle: TitleStyle.fromJson(json["ItemsTitle"]),
    selectedIcon: SelectedIcon.fromJson(json["SelectedIcon"]),
  );

  Map<String, dynamic> toJson() => {
    "LabelText": labelText.toJson(),
    "ItemsTitle": itemsTitle.toJson(),
    "SelectedIcon": selectedIcon.toJson(),
  };
}





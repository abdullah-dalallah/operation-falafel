// To parse this JSON data, do
//
//     final addressTypeDropDown = addressTypeDropDownFromJson(jsonString);

import 'dart:convert';

import '../../../../../CommonElements/Elements/image_icon.dart';
import '../../../../../CommonElements/Elements/title_style.dart';

AddressTypeDropDown addressTypeDropDownFromJson(String str) => AddressTypeDropDown.fromJson(json.decode(str));

String addressTypeDropDownToJson(AddressTypeDropDown data) => json.encode(data.toJson());

class AddressTypeDropDown {
  AddressTypeDropDown({
    required this.labelText,
    required this.itemsTitle,
    required this.selectedIcon,
  });

  TitleStyle labelText;
  TitleStyle itemsTitle;
  ImageIcon selectedIcon;

  factory AddressTypeDropDown.fromJson(Map<String, dynamic> json) => AddressTypeDropDown(
    labelText: TitleStyle.fromJson(json["LabelText"]),
    itemsTitle: TitleStyle.fromJson(json["ItemsTitle"]),
    selectedIcon: ImageIcon.fromJson(json["SelectedIcon"]),
  );

  Map<String, dynamic> toJson() => {
    "LabelText": labelText.toJson(),
    "ItemsTitle": itemsTitle.toJson(),
    "SelectedIcon": selectedIcon.toJson(),
  };
}



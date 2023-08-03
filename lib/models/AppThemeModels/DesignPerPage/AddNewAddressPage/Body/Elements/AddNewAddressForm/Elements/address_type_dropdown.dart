// To parse this JSON data, do
//
//     final addressTypeDropDown = addressTypeDropDownFromJson(jsonString);

import 'dart:convert';

import '../../../../../CommonElements/Elements/buttons.dart';
import '../../../../../CommonElements/Elements/image_icon.dart';
import '../../../../../CommonElements/Elements/title_style.dart';
import '../../../../../EditAddressPage/Body/Elements/EditAddressForm/Elements/PrimaryAddress/primary_address.dart';

AddressDropDown addressTypeDropDownFromJson(String str) => AddressDropDown.fromJson(json.decode(str));

String addressTypeDropDownToJson(AddressDropDown data) => json.encode(data.toJson());

class AddressDropDown {
  AddressDropDown({
    required this.labelText,
    required this.itemsTitle,
    required this.selectedIcon,

  });

  TitleStyle labelText;
  TitleStyle itemsTitle;
  ImageIcon selectedIcon;



  factory AddressDropDown.fromJson(Map<String, dynamic> json) => AddressDropDown(
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



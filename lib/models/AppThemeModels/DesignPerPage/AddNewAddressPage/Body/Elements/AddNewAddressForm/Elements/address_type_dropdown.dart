// To parse this JSON data, do
//
//     final addressTypeDropDown = addressTypeDropDownFromJson(jsonString);

import 'dart:convert';

import '../../../../../CommonElements/Elements/buttons.dart';
import '../../../../../CommonElements/Elements/image_icon.dart';
import '../../../../../CommonElements/Elements/title_style.dart';
import '../../../../../EditAddressPage/Body/Elements/EditAddressForm/Elements/PrimaryAddress/primary_address.dart';

AddressTypeDropDown addressTypeDropDownFromJson(String str) => AddressTypeDropDown.fromJson(json.decode(str));

String addressTypeDropDownToJson(AddressTypeDropDown data) => json.encode(data.toJson());

class AddressTypeDropDown {
  AddressTypeDropDown({
    required this.labelText,
    required this.itemsTitle,
    required this.selectedIcon,
    required this.primaryAddress,
    required this.addNewAddressButton
  });

  TitleStyle labelText;
  TitleStyle itemsTitle;
  ImageIcon selectedIcon;
  PrimaryAddress primaryAddress;
  Button addNewAddressButton;


  factory AddressTypeDropDown.fromJson(Map<String, dynamic> json) => AddressTypeDropDown(
    labelText: TitleStyle.fromJson(json["LabelText"]),
    itemsTitle: TitleStyle.fromJson(json["ItemsTitle"]),
    selectedIcon: ImageIcon.fromJson(json["SelectedIcon"]),
    primaryAddress: PrimaryAddress.fromJson(json["PrimaryAddress"]),
    addNewAddressButton: Button.fromJson(json["AddNewAddressButton"]),
  );

  Map<String, dynamic> toJson() => {
    "LabelText": labelText.toJson(),
    "ItemsTitle": itemsTitle.toJson(),
    "SelectedIcon": selectedIcon.toJson(),
    "PrimaryAddress": primaryAddress.toJson(),
    "AddNewAddressButton": addNewAddressButton.toJson(),
  };
}



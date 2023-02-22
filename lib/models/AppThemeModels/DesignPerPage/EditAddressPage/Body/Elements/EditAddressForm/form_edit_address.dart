// To parse this JSON data, do
//
//     final formEditAddress = formEditAddressFromJson(jsonString);

import 'dart:convert';

import '../../../../CommonElements/Elements/buttons.dart';
import '../../../../CommonElements/Elements/title_style.dart';
import 'Elements/PrimaryAddress/primary_address.dart';
import 'Elements/address_type_dropdown.dart';

FormEditAddress formEditAddressFromJson(String str) => FormEditAddress.fromJson(json.decode(str));

String formEditAddressToJson(FormEditAddress data) => json.encode(data.toJson());

class FormEditAddress {
  FormEditAddress({
    required this.addressLine,
    required this.buildingName,
    required this.villa,
    required this.area,
    required this.addressTypeDropDown,
    required this.primaryAddress,
    required this.updateAddressButton,
  });

  TitleStyle addressLine;
  TitleStyle buildingName;
  TitleStyle villa;
  TitleStyle area;
  AddressTypeDropDown addressTypeDropDown;
  PrimaryAddress primaryAddress;
  Button updateAddressButton;

  factory FormEditAddress.fromJson(Map<String, dynamic> json) => FormEditAddress(
    addressLine: TitleStyle.fromJson(json["AddressLine"]),
    buildingName: TitleStyle.fromJson(json["BuildingName"]),
    villa: TitleStyle.fromJson(json["Villa"]),
    area: TitleStyle.fromJson(json["Area"]),
    addressTypeDropDown: AddressTypeDropDown.fromJson(json["AddressTypeDropDown"]),
    primaryAddress: PrimaryAddress.fromJson(json["PrimaryAddress"]),
    updateAddressButton: Button.fromJson(json["UpdateAddressButton"]),
  );

  Map<String, dynamic> toJson() => {
    "AddressLine": addressLine.toJson(),
    "BuildingName": buildingName.toJson(),
    "Villa": villa.toJson(),
    "Area": area.toJson(),
    "AddressTypeDropDown": addressTypeDropDown.toJson(),
    "PrimaryAddress": primaryAddress.toJson(),
    "UpdateAddressButton": updateAddressButton.toJson(),
  };
}



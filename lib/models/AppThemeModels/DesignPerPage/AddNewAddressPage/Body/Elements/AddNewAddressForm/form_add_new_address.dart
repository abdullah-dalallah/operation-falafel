// To parse this JSON data, do
//
//     final formEditAddress = formEditAddressFromJson(jsonString);

import 'dart:convert';

import '../../../../CommonElements/Elements/buttons.dart';
import '../../../../CommonElements/Elements/title_style.dart';
import 'Elements/PrimaryAddress/primary_address.dart';
import 'Elements/address_type_dropdown.dart';

FormAddNewAddress formEditAddressFromJson(String str) => FormAddNewAddress.fromJson(json.decode(str));

String formEditAddressToJson(FormAddNewAddress data) => json.encode(data.toJson());

class FormAddNewAddress {
  FormAddNewAddress({
    required this.addressLine,
    required this.buildingName,
    required this.villa,
    required this.area,
    required this.addressTypeDropDown,
    required this.addressCityDropDown,
    required this.primaryAddress,
    required this.addNewAddressButton
  });

  TitleStyle addressLine;
  TitleStyle buildingName;
  TitleStyle villa;
  TitleStyle area;
  AddressDropDown addressTypeDropDown;
  AddressDropDown addressCityDropDown;
  PrimaryAddress primaryAddress;
  Button addNewAddressButton;


  factory FormAddNewAddress.fromJson(Map<String, dynamic> json) => FormAddNewAddress(
    addressLine: TitleStyle.fromJson(json["AddressLine"]),
    buildingName: TitleStyle.fromJson(json["BuildingName"]),
    villa: TitleStyle.fromJson(json["Villa"]),
    area: TitleStyle.fromJson(json["Area"]),
    addressTypeDropDown: AddressDropDown.fromJson(json["AddressTypeDropDown"]),
    addressCityDropDown: AddressDropDown.fromJson(json["AddressCityDropDown"]),
    primaryAddress: PrimaryAddress.fromJson(json["PrimaryAddress"]),
    addNewAddressButton: Button.fromJson(json["AddNewAddressButton"]),

  );

  Map<String, dynamic> toJson() => {
    "AddressLine": addressLine.toJson(),
    "BuildingName": buildingName.toJson(),
    "Villa": villa.toJson(),
    "Area": area.toJson(),
    "AddressTypeDropDown": addressTypeDropDown.toJson(),
    "AddressCityDropDown": addressCityDropDown.toJson(),
    "PrimaryAddress": primaryAddress.toJson(),
    "AddNewAddressButton": addNewAddressButton.toJson(),

  };
}



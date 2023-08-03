// To parse this JSON data, do
//
//     final formEditAddress = formEditAddressFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/AddNewAddressPage/Body/Elements/AddNewAddressForm/Elements/address_type_dropdown.dart';

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
    required this.addressCityDropDown,
    required this.primaryAddress,
    required this.updateAddressButton,
  });

  TitleStyle addressLine;
  TitleStyle buildingName;
  TitleStyle villa;
  TitleStyle area;
  AddressDropDown addressTypeDropDown;
  AddressDropDown addressCityDropDown;
  PrimaryAddress primaryAddress;
  Button updateAddressButton;

  factory FormEditAddress.fromJson(Map<String, dynamic> json) => FormEditAddress(
    addressLine: TitleStyle.fromJson(json["AddressLine"]),
    buildingName: TitleStyle.fromJson(json["BuildingName"]),
    villa: TitleStyle.fromJson(json["Villa"]),
    area: TitleStyle.fromJson(json["Area"]),
    addressTypeDropDown: AddressDropDown.fromJson(json["AddressTypeDropDown"]),
    addressCityDropDown: AddressDropDown.fromJson(json["AddressCityDropDown"]),
    primaryAddress: PrimaryAddress.fromJson(json["PrimaryAddress"]),
    updateAddressButton: Button.fromJson(json["UpdateAddressButton"]),
  );

  Map<String, dynamic> toJson() => {
    "AddressLine": addressLine.toJson(),
    "BuildingName": buildingName.toJson(),
    "Villa": villa.toJson(),
    "Area": area.toJson(),
    "AddressTypeDropDown": addressTypeDropDown.toJson(),
    "AddressCityDropDown": addressCityDropDown.toJson(),
    "PrimaryAddress": primaryAddress.toJson(),
    "UpdateAddressButton": updateAddressButton.toJson(),
  };
}



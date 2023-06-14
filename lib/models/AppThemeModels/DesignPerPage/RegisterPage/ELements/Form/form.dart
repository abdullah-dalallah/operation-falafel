// To parse this JSON data, do
//
//     final form = formFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/RegisterPage/ELements/Form/Elements/DropDownMenu/drop_down_menu.dart';

import '../../../CommonElements/Elements/title_style.dart';

import 'Elements/PhoneNumber/phone_number.dart';

Form formFromJson(String str) => Form.fromJson(json.decode(str));

String formToJson(Form data) => json.encode(data.toJson());

class Form {
  Form({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.gender,
    required this.password,
    required this.nationality,
  });

  TitleStyle name;
  PhoneNumber phoneNumber;
  TitleStyle email;
  TitleStyle dateOfBirth;
  DropDownMenu gender;
  TitleStyle password;
  DropDownMenu nationality;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    name: TitleStyle.fromJson(json["Name"]),
    phoneNumber: PhoneNumber.fromJson(json["PhoneNumber"]),
    email: TitleStyle.fromJson(json["Email"]),
    dateOfBirth: TitleStyle.fromJson(json["DateOfBirth"]),
    gender: DropDownMenu.fromJson(json["Gender"]),
    password: TitleStyle.fromJson(json["Password"]),
    nationality: DropDownMenu.fromJson(json["Nationality"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name.toJson(),
    "PhoneNumber": phoneNumber.toJson(),
    "Email": email.toJson(),
    "DateOfBirth": dateOfBirth.toJson(),
    "Gender": gender.toJson(),
    "Password": password.toJson(),
    "Nationality": nationality.toJson(),
  };
}







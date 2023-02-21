// To parse this JSON data, do
//
//     final form = formFromJson(jsonString);

import 'dart:convert';

import '../../../../../CommonElements/Elements/title_style.dart';
import 'Elements/Gender/gender.dart';
import 'Elements/ID/upload_id.dart';
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
    required this.uploadId,
  });

  TitleStyle name;
  PhoneNumber phoneNumber;
  TitleStyle email;
  TitleStyle dateOfBirth;
  Gender gender;
  TitleStyle password;
  UploadId uploadId;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    name: TitleStyle.fromJson(json["Name"]),
    phoneNumber: PhoneNumber.fromJson(json["PhoneNumber"]),
    email: TitleStyle.fromJson(json["Email"]),
    dateOfBirth: TitleStyle.fromJson(json["DateOfBirth"]),
    gender: Gender.fromJson(json["Gender"]),
    password: TitleStyle.fromJson(json["Password"]),
    uploadId: UploadId.fromJson(json["UploadID"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name.toJson(),
    "PhoneNumber": phoneNumber.toJson(),
    "Email": email.toJson(),
    "DateOfBirth": dateOfBirth.toJson(),
    "Gender": gender.toJson(),
    "Password": password.toJson(),
    "UploadID": uploadId.toJson(),
  };
}

















// To parse this JSON data, do
//
//     final forgetPasswordForm = forgetPasswordFormFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

ForgetPasswordForm forgetPasswordFormFromJson(String str) => ForgetPasswordForm.fromJson(json.decode(str));

String forgetPasswordFormToJson(ForgetPasswordForm data) => json.encode(data.toJson());

class ForgetPasswordForm {
  ForgetPasswordForm({
    required this.phoneNumber,
  });

  TitleStyle phoneNumber;

  factory ForgetPasswordForm.fromJson(Map<String, dynamic> json) => ForgetPasswordForm(
    phoneNumber: TitleStyle.fromJson(json["PhoneNumber"]),
  );

  Map<String, dynamic> toJson() => {
    "PhoneNumber": phoneNumber.toJson(),
  };
}



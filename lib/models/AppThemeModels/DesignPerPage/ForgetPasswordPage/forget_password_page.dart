// To parse this JSON data, do
//
//     final forgetPasswordPage = forgetPasswordPageFromJson(jsonString);

import 'dart:convert';

import '../CommonElements/Elements/title_style.dart';
import 'Elements/forget_password_form.dart';

ForgetPasswordPage forgetPasswordPageFromJson(String str) => ForgetPasswordPage.fromJson(json.decode(str));

String forgetPasswordPageToJson(ForgetPasswordPage data) => json.encode(data.toJson());

class ForgetPasswordPage {
  ForgetPasswordPage({
    required this.pageTile,
    required this.form,
  });

  TitleStyle pageTile;
  ForgetPasswordForm form;

  factory ForgetPasswordPage.fromJson(Map<String, dynamic> json) => ForgetPasswordPage(
    pageTile: TitleStyle.fromJson(json["PageTile"]),
    form: ForgetPasswordForm.fromJson(json["Form"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTile": pageTile.toJson(),
    "Form": form.toJson(),
  };
}



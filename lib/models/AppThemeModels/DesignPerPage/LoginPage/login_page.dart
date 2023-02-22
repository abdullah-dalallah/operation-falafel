// To parse this JSON data, do
//
//     final loginPage = loginPageFromJson(jsonString);

import 'dart:convert';

import '../CommonElements/Elements/title_style.dart';
import 'Elements/login_form.dart';

LoginPage loginPageFromJson(String str) => LoginPage.fromJson(json.decode(str));

String loginPageToJson(LoginPage data) => json.encode(data.toJson());

class LoginPage {
  LoginPage({
    required this.pageTile,
    required this.form,
  });

  TitleStyle pageTile;
  LoginForm form;

  factory LoginPage.fromJson(Map<String, dynamic> json) => LoginPage(
    pageTile: TitleStyle.fromJson(json["PageTile"]),
    form: LoginForm.fromJson(json["Form"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTile": pageTile.toJson(),
    "Form": form.toJson(),
  };
}



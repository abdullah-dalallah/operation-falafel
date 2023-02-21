// To parse this JSON data, do
//
//     final enterOfWorldPage = enterOfWorldPageFromJson(jsonString);

import 'dart:convert';

import '../CommonElements/Elements/title_style.dart';
import 'Elements/apple_login_button.dart';
import 'Elements/register_button.dart';

EnterOfWorldPage enterOfWorldPageFromJson(String str) => EnterOfWorldPage.fromJson(json.decode(str));

String enterOfWorldPageToJson(EnterOfWorldPage data) => json.encode(data.toJson());

class EnterOfWorldPage {
  EnterOfWorldPage({
    required this.title,
    required this.appleLoginButton,
    required this.registerButton,
    required this.resiterLater,
    required this.login,
  });

  TitleStyle title;
  AppleLoginButton appleLoginButton;
  RegisterButton registerButton;
  TitleStyle resiterLater;
  TitleStyle login;

  factory EnterOfWorldPage.fromJson(Map<String, dynamic> json) => EnterOfWorldPage(
    title: TitleStyle.fromJson(json["Title"]),
    appleLoginButton: AppleLoginButton.fromJson(json["AppleLoginButton"]),
    registerButton: RegisterButton.fromJson(json["RegisterButton"]),
    resiterLater: TitleStyle.fromJson(json["ResiterLater"]),
    login: TitleStyle.fromJson(json["Login"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "AppleLoginButton": appleLoginButton.toJson(),
    "RegisterButton": registerButton.toJson(),
    "ResiterLater": resiterLater.toJson(),
    "Login": login.toJson(),
  };
}



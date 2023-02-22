// To parse this JSON data, do
//
//     final loginForm = loginFormFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

LoginForm loginFormFromJson(String str) => LoginForm.fromJson(json.decode(str));

String loginFormToJson(LoginForm data) => json.encode(data.toJson());

class LoginForm {
  LoginForm({
    required this.email,
    required this.password,
    required this.forgetPassword,
  });

  TitleStyle email;
  TitleStyle password;
  TitleStyle forgetPassword;

  factory LoginForm.fromJson(Map<String, dynamic> json) => LoginForm(
    email: TitleStyle.fromJson(json["Email"]),
    password: TitleStyle.fromJson(json["Password"]),
    forgetPassword: TitleStyle.fromJson(json["ForgetPassword"]),
  );

  Map<String, dynamic> toJson() => {
    "Email": email.toJson(),
    "Password": password.toJson(),
    "ForgetPassword": forgetPassword.toJson(),
  };
}



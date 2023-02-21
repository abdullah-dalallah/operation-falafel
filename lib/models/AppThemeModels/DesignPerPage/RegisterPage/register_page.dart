// To parse this JSON data, do
//
//     final registerPage = registerPageFromJson(jsonString);

import 'dart:convert';

import '../CommonElements/Elements/title_style.dart';
import 'ELements/Form/form.dart';
import 'ELements/terms_checkbox.dart';

RegisterPage registerPageFromJson(String str) => RegisterPage.fromJson(json.decode(str));

String registerPageToJson(RegisterPage data) => json.encode(data.toJson());

class RegisterPage {
  RegisterPage({
    required this.pageTile,
    required this.form,
    required this.termsCheckBox,
  });

  TitleStyle pageTile;
  Form form;
  TermsCheckBox termsCheckBox;

  factory RegisterPage.fromJson(Map<String, dynamic> json) => RegisterPage(
    pageTile: TitleStyle.fromJson(json["PageTile"]),
    form: Form.fromJson(json["Form"]),
    termsCheckBox: TermsCheckBox.fromJson(json["TermsCheckBox"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTile": pageTile.toJson(),
    "Form": form.toJson(),
    "TermsCheckBox": termsCheckBox.toJson(),
  };
}



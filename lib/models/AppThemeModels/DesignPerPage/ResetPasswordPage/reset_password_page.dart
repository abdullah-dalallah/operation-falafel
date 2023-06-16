// To parse this JSON data, do
//
//     final resetPasswordPage = resetPasswordPageFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/ResetPasswordPage/Elements/reset_password_form.dart';

ResetPasswordPage resetPasswordPageFromJson(String str) => ResetPasswordPage.fromJson(json.decode(str));

String resetPasswordPageToJson(ResetPasswordPage data) => json.encode(data.toJson());

class ResetPasswordPage {
  TitleStyle? pageTile;
  ResetPasswordForm? form;

  ResetPasswordPage({
    this.pageTile,
    this.form,
  });

  factory ResetPasswordPage.fromJson(Map<String, dynamic> json) => ResetPasswordPage(
    pageTile: json["PageTile"] == null ? null : TitleStyle.fromJson(json["PageTile"]),
    form: json["Form"] == null ? null : ResetPasswordForm.fromJson(json["Form"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTile": pageTile?.toJson(),
    "Form": form?.toJson(),
  };
}
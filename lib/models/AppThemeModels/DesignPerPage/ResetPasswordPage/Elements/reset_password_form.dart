import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

class ResetPasswordForm {
  TitleStyle? currentPassword;
  TitleStyle? newPassword;
  TitleStyle? confirmPassword;

  ResetPasswordForm({
    this.currentPassword,
    this.newPassword,
    this.confirmPassword,
  });

  factory ResetPasswordForm.fromJson(Map<String, dynamic> json) => ResetPasswordForm(
    currentPassword: json["CurrentPassword"] == null ? null : TitleStyle.fromJson(json["CurrentPassword"]),
    newPassword: json["NewPassword"] == null ? null : TitleStyle.fromJson(json["NewPassword"]),
    confirmPassword: json["ConfirmPassword"] == null ? null : TitleStyle.fromJson(json["ConfirmPassword"]),
  );

  Map<String, dynamic> toJson() => {
    "CurrentPassword": currentPassword?.toJson(),
    "NewPassword": newPassword?.toJson(),
    "ConfirmPassword": confirmPassword?.toJson(),
  };
}


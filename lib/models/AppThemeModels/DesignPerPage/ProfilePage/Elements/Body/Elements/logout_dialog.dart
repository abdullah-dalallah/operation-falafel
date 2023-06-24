// To parse this JSON data, do
//
//     final logoutDialog = logoutDialogFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/buttons.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

LogoutDialog logoutDialogFromJson(String str) => LogoutDialog.fromJson(json.decode(str));

String logoutDialogToJson(LogoutDialog data) => json.encode(data.toJson());

class LogoutDialog {
  TitleStyle? dialogTitle;
  TitleStyle? dialogBodyTitle;
  Button? logoutOnDevice;
  Button? logoutAllDevices;

  LogoutDialog({
    this.dialogTitle,
    this.dialogBodyTitle,
    this.logoutOnDevice,
    this.logoutAllDevices,
  });

  factory LogoutDialog.fromJson(Map<String, dynamic> json) => LogoutDialog(
    dialogTitle: json["DialogTitle"] == null ? null : TitleStyle.fromJson(json["DialogTitle"]),
    dialogBodyTitle: json["DialogBodyTitle"] == null ? null : TitleStyle.fromJson(json["DialogBodyTitle"]),
    logoutOnDevice: json["LogoutOnDevice"] == null ? null : Button.fromJson(json["LogoutOnDevice"]),
    logoutAllDevices: json["LogoutAllDevices"] == null ? null : Button.fromJson(json["LogoutAllDevices"]),
  );

  Map<String, dynamic> toJson() => {
    "DialogTitle": dialogTitle?.toJson(),
    "DialogBodyTitle": dialogBodyTitle?.toJson(),
    "LogoutOnDevice": logoutOnDevice?.toJson(),
    "LogoutAllDevices": logoutAllDevices?.toJson(),
  };
}
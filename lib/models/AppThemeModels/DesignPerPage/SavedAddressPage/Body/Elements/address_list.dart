// To parse this JSON data, do
//
//     final addressList = addressListFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/icon_button.dart';

import '../../../CommonElements/Elements/title_style.dart';

AddressList addressListFromJson(String str) => AddressList.fromJson(json.decode(str));

String addressListToJson(AddressList data) => json.encode(data.toJson());

class AddressList {
  AddressList({
    required this.title,
    required this.subTitle,
    required this.editButton,
    required this.deleteButton,
  });

  TitleStyle title;
  TitleStyle subTitle;
  IconButton editButton;
  IconButton deleteButton;

  factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
    title: TitleStyle.fromJson(json["Title"]),
    subTitle: TitleStyle.fromJson(json["SubTitle"]),
    editButton: IconButton.fromJson(json["EditButton"]),
    deleteButton: IconButton.fromJson(json["DeleteButton"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "SubTitle": subTitle.toJson(),
    "EditButton": editButton.toJson(),
    "DeleteButton": deleteButton.toJson(),
  };
}



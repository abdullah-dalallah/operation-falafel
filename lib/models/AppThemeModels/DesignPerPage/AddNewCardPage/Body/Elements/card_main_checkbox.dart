// To parse this JSON data, do
//
//     final cardMainCheckBox = cardMainCheckBoxFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';

CardMainCheckBox cardMainCheckBoxFromJson(String str) => CardMainCheckBox.fromJson(json.decode(str));

String cardMainCheckBoxToJson(CardMainCheckBox data) => json.encode(data.toJson());

class CardMainCheckBox {
  String? visibility;
  TitleStyle? activeTitle;
  TitleStyle? inactiveTitle;
  String? selectedImage;

  CardMainCheckBox({
    this.visibility,
    this.activeTitle,
    this.inactiveTitle,
    this.selectedImage,
  });

  factory CardMainCheckBox.fromJson(Map<String, dynamic> json) => CardMainCheckBox(
    visibility: json["visibility"],
    activeTitle: json["ActiveTitle"] == null ? null : TitleStyle.fromJson(json["ActiveTitle"]),
    inactiveTitle: json["InactiveTitle"] == null ? null : TitleStyle.fromJson(json["InactiveTitle"]),
    selectedImage: json["SelectedImage"],
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "ActiveTitle": activeTitle?.toJson(),
    "InactiveTitle": inactiveTitle?.toJson(),
    "SelectedImage": selectedImage,
  };
}



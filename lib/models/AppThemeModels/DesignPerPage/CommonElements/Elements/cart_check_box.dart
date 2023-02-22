// To parse this JSON data, do
//
//     final cutleryCheckBox = cutleryCheckBoxFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CommonElements/Elements/title_style.dart';






CartCheckBox cutleryCheckBoxFromJson(String str) => CartCheckBox.fromJson(json.decode(str));

String cutleryCheckBoxToJson(CartCheckBox data) => json.encode(data.toJson());

class CartCheckBox {
  CartCheckBox({
    required this.visibility,
    required this.title,
    required this.selectedImage,
  });

  String visibility;
  TitleStyle title;
  String selectedImage;

  factory CartCheckBox.fromJson(Map<String, dynamic> json) => CartCheckBox(
    visibility: json["visibility"],
    title: TitleStyle.fromJson(json["Title"]),
    selectedImage: json["SelectedImage"],
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "Title": title.toJson(),
    "SelectedImage": selectedImage,
  };
}



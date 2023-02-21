// To parse this JSON data, do
//
//     final menuCheckBox = menuCheckBoxFromJson(jsonString);

import 'dart:convert';

MenuCheckBox menuCheckBoxFromJson(String str) => MenuCheckBox.fromJson(json.decode(str));

String menuCheckBoxToJson(MenuCheckBox data) => json.encode(data.toJson());

class MenuCheckBox {
  MenuCheckBox({
    required this.data,
    required this.color,
    required this.selectedImage,
  });

  String data;
  String color;
  String selectedImage;

  factory MenuCheckBox.fromJson(Map<String, dynamic> json) => MenuCheckBox(
    data: json["Data"],
    color: json["Color"],
    selectedImage: json["SelectedImage"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "SelectedImage": selectedImage,
  };
}

// To parse this JSON data, do
//
//     final termsCheckBox = termsCheckBoxFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

TermsCheckBox termsCheckBoxFromJson(String str) => TermsCheckBox.fromJson(json.decode(str));

String termsCheckBoxToJson(TermsCheckBox data) => json.encode(data.toJson());

class TermsCheckBox {
  TermsCheckBox({
    required this.visibility,
    required this.title,
    required this.selectedImage,
  });

  String visibility;
  TitleStyle title;
  String selectedImage;

  factory TermsCheckBox.fromJson(Map<String, dynamic> json) => TermsCheckBox(
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



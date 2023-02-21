// To parse this JSON data, do
//
//     final promoCode = promoCodeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../../CommonElements/Elements/title_style.dart';
import 'Elements/add_button.dart';

PromoCode promoCodeFromJson(String str) => PromoCode.fromJson(json.decode(str));

String promoCodeToJson(PromoCode data) => json.encode(data.toJson());

class PromoCode {
  PromoCode({
    required this.visibility,
    required this.textfieldHint,
    required this.addButton,
  });

  String visibility;
  TitleStyle textfieldHint;
  AddButton addButton;

  factory PromoCode.fromJson(Map<String, dynamic> json) => PromoCode(
    visibility: json["visibility"],
    textfieldHint: TitleStyle.fromJson(json["TextfieldHint"]),
    addButton: AddButton.fromJson(json["AddButton"]),
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "TextfieldHint": textfieldHint.toJson(),
    "AddButton": addButton.toJson(),
  };
}





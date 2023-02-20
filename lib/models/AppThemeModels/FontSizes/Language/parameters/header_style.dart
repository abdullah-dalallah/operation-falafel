// To parse this JSON data, do
//
//     final headerStyle = headerStyleFromJson(jsonString);

import 'dart:convert';

HeaderStyle headerStyleFromJson(String str) => HeaderStyle.fromJson(json.decode(str));

String headerStyleToJson(HeaderStyle data) => json.encode(data.toJson());

class HeaderStyle {
  HeaderStyle({
    required this.size,
    required this.textFamily,
  });

  int size;
  String textFamily;

  factory HeaderStyle.fromJson(Map<String, dynamic> json) => HeaderStyle(
    size: json["Size"],
    textFamily: json["TextFamily"],
  );

  Map<String, dynamic> toJson() => {
    "Size": size,
    "TextFamily": textFamily,
  };
}

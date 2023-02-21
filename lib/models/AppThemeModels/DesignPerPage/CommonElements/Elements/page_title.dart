// To parse this JSON data, do
//
//     final pageTile = pageTileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PageTile pageTileFromJson(String str) => PageTile.fromJson(json.decode(str));

String pageTileToJson(PageTile data) => json.encode(data.toJson());

class PageTile {
  PageTile({
    required this.data,
    required this.color,
  });

  String data;
  String color;

  factory PageTile.fromJson(Map<String, dynamic> json) => PageTile(
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
  };
}

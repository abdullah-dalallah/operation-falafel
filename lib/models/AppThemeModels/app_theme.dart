// To parse this JSON data, do
//
//     final appTheme = appThemeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'DesignPerPage/design_per_page.dart';
import 'FontSizes/font_sizes.dart';

AppTheme appThemeFromJson(String str) => AppTheme.fromJson(json.decode(str));

String appThemeToJson(AppTheme data) => json.encode(data.toJson());

class AppTheme {
  AppTheme({
    required this.id,
    required this.themeId,
    required this.fontSizes,
    required this.designPerPage,
  });

  String id;
  int themeId;
  FontSizes fontSizes;
  DesignPerPage designPerPage;

  factory AppTheme.fromJson(Map<String, dynamic> json) => AppTheme(
    id: json["_id"],
    themeId: json["theme_id"],
    fontSizes: FontSizes.fromJson(json["FontSizes"]),
    designPerPage: DesignPerPage.fromJson(json["DesignPerPage"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "theme_id": themeId,
    "FontSizes": fontSizes.toJson(),
    "DesignPerPage": designPerPage.toJson(),
  };
}


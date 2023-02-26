// To parse this JSON data, do
//
//     final appTheme = appThemeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'DesignPerPage/design_per_page.dart';
import 'FontSizes/font_sizes.dart';

AppTheme appThemeFromJson(String str) => AppTheme.fromJson(json.decode(str));

String appThemeToJson(AppTheme data) => json.encode(data.toJson());

class AppTheme with ChangeNotifier {
  AppTheme({
     this.id,
     this.themeId,
     this.fontSizes,
     this.designPerPage,
     this.language,
  });

  String? id;
  int? themeId;
  FontSizes? fontSizes;
  DesignPerPage? designPerPage;
  String? language;

  factory AppTheme.fromJson(Map<String, dynamic> json) => AppTheme(
    id: json["_id"],
    themeId: json["theme_id"],
    fontSizes: FontSizes.fromJson(json["FontSizes"]),
    designPerPage: DesignPerPage.fromJson(json["DesignPerPage"]),
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "theme_id": themeId,
    "FontSizes": fontSizes?.toJson(),
    "DesignPerPage": designPerPage?.toJson(),
    "language": language,
  };

}


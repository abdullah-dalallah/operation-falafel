// To parse this JSON data, do
//
//     final appTheme = appThemeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'DesignPerPage/design_per_page.dart';
import 'FontSizes/font_sizes.dart';
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'app_theme.g.dart';

AppTheme appThemeFromJson(String str) => AppTheme.fromJson(json.decode(str));

String appThemeToJson(AppTheme data) => json.encode(data.toJson());

@JsonSerializable()
class AppTheme with ChangeNotifier {
  AppTheme({
     this.id,
     this.themeId,
     this.fontSizes,
     this.designPerPage,
     this.language,
    this.status,
    this.direction,
    this.createdBy,
    this.expiryDate,
    this.isDeleted,
    this.isExpired,
    this.v
  });

  String? id;
  int? themeId;
  FontSizes? fontSizes;
  DesignPerPage? designPerPage;
  String? language;

  String? direction;
  int? status;
  int? isDeleted  ;
  int? isExpired ;
  String? expiryDate;
  int? createdBy ;
  int? v;

  factory AppTheme.fromJson(Map<String, dynamic> json) => AppTheme(
    id: json["_id"],
    themeId: json["theme_id"],
    fontSizes: FontSizes.fromJson(json["FontSizes"]),
    designPerPage: DesignPerPage.fromJson(json["DesignPerPage"]),
    language: json["language"],

    createdBy: json["createdBy"],
    direction: json["direction"],
    expiryDate: json["expiry_date"],
    isDeleted: json["is_deleted"],
    isExpired: json["is_expired"],
    status: json["status"],
    v: json["__v"],


  );
  Map<String, dynamic> toJson() => {
    "_id": id,
    "theme_id": themeId,
    "FontSizes": fontSizes?.toJson(),
    "DesignPerPage": designPerPage?.toJson(),
    "language": language,

    "createdBy":createdBy,
    "direction": direction,
    "expiry_date" : expiryDate,
    "is_deleted": isDeleted,
    "is_expired" : isExpired,
    "status" :  status,
    "__v" : v,

  };

}


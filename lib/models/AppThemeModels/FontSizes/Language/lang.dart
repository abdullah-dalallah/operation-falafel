// To parse this JSON data, do
//
//     final ar = arFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/parameters/header_style.dart';



// import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/parameters/header_style.dart';





Language arFromJson(String str) => Language.fromJson(json.decode(str));

String arToJson(Language data) => json.encode(data.toJson());

class Language {
  Language({
    required this.logoTitle,
    required this.titleHeader1,
    required this.titleHeader2,
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.header5,
  });

  HeaderStyle logoTitle;
  HeaderStyle titleHeader1;
  HeaderStyle titleHeader2;
  HeaderStyle header1;
  HeaderStyle header2;
  HeaderStyle header3;
  HeaderStyle header4;
  HeaderStyle header5;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    logoTitle: HeaderStyle.fromJson(json["LogoTitle"]),
    titleHeader1: HeaderStyle.fromJson(json["TitleHeader1"]),
    titleHeader2: HeaderStyle.fromJson(json["TitleHeader2"]),
    header1: HeaderStyle.fromJson(json["Header1"]),
    header2: HeaderStyle.fromJson(json["Header2"]),
    header3: HeaderStyle.fromJson(json["Header3"]),
    header4: HeaderStyle.fromJson(json["Header4"]),
    header5: HeaderStyle.fromJson(json["Header5"]),
  );

  Map<String, dynamic> toJson() => {
    "LogoTitle": logoTitle.toJson(),
    "TitleHeader1": titleHeader1.toJson(),
    "TitleHeader2": titleHeader2.toJson(),
    "Header1": header1.toJson(),
    "Header2": header2.toJson(),
    "Header3": header3.toJson(),
    "Header4": header4.toJson(),
    "Header5": header5.toJson(),
  };
}


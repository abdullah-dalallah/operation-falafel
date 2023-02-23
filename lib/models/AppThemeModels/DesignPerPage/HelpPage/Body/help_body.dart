// To parse this JSON data, do
//
//     final helpBody = helpBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/reach_out_widget.dart';
import '../../CommonElements/Elements/title_style.dart';

HelpBody helpBodyFromJson(String str) => HelpBody.fromJson(json.decode(str));

String helpBodyToJson(HelpBody data) => json.encode(data.toJson());

class HelpBody {
  HelpBody({
    required this.pageTitle,
    required this.pageImage,
    required this.callUsWidget,
    required this.emailUsWidget,
  });

  TitleStyle pageTitle;
  String pageImage;
  ReachOutWidget callUsWidget;
  ReachOutWidget emailUsWidget;

  factory HelpBody.fromJson(Map<String, dynamic> json) => HelpBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    pageImage: json["PageImage"],
    callUsWidget: ReachOutWidget.fromJson(json["CallUsWidget"]),
    emailUsWidget: ReachOutWidget.fromJson(json["EmailUsWidget"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "PageImage": pageImage,
    "CallUsWidget": callUsWidget.toJson(),
    "EmailUsWidget": emailUsWidget.toJson(),
  };
}



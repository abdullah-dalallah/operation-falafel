// To parse this JSON data, do
//
//     final drawerFeedBackBody = drawerFeedBackBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/buttons.dart';
import '../../CommonElements/Elements/title_style.dart';

DrawerFeedBackBody drawerFeedBackBodyFromJson(String str) => DrawerFeedBackBody.fromJson(json.decode(str));

String drawerFeedBackBodyToJson(DrawerFeedBackBody data) => json.encode(data.toJson());

class DrawerFeedBackBody {
  DrawerFeedBackBody({
    required this.pageTitle,
    required this.promotTitle,
    required this.form,
    required this.submitButton,
  });

  TitleStyle pageTitle;
  TitleStyle promotTitle;
  Form form;
  Button submitButton;

  factory DrawerFeedBackBody.fromJson(Map<String, dynamic> json) => DrawerFeedBackBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    promotTitle: TitleStyle.fromJson(json["PromotTitle"]),
    form: Form.fromJson(json["Form"]),
    submitButton: Button.fromJson(json["SubmitButton"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "PromotTitle": promotTitle.toJson(),
    "Form": form.toJson(),
    "SubmitButton": submitButton.toJson(),
  };
}

class Form {
  Form({
    required this.yourComment,
  });

  TitleStyle yourComment;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    yourComment: TitleStyle.fromJson(json["YourComment"]),
  );

  Map<String, dynamic> toJson() => {
    "YourComment": yourComment.toJson(),
  };
}





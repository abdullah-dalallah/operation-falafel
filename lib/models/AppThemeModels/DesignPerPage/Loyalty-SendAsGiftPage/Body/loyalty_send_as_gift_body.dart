// To parse this JSON data, do
//
//     final loyaltySendAsGiftBody = loyaltySendAsGiftBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

LoyaltySendAsGiftBody loyaltySendAsGiftBodyFromJson(String str) => LoyaltySendAsGiftBody.fromJson(json.decode(str));

String loyaltySendAsGiftBodyToJson(LoyaltySendAsGiftBody data) => json.encode(data.toJson());

class LoyaltySendAsGiftBody {
  LoyaltySendAsGiftBody({
    required this.pageImage,
    required this.pageTitle,
    required this.giftTitle,
    required this.form,
  });

  String pageImage;
  TitleStyle pageTitle;
  TitleStyle giftTitle;
  Form form;

  factory LoyaltySendAsGiftBody.fromJson(Map<String, dynamic> json) => LoyaltySendAsGiftBody(
    pageImage: json["PageImage"],
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    giftTitle: TitleStyle.fromJson(json["GiftTitle"]),
    form: Form.fromJson(json["Form"]),
  );

  Map<String, dynamic> toJson() => {
    "PageImage": pageImage,
    "PageTitle": pageTitle.toJson(),
    "GiftTitle": giftTitle.toJson(),
    "Form": form.toJson(),
  };
}

class Form {
  Form({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.addNotes,
  });

  TitleStyle name;
  TitleStyle phoneNumber;
  TitleStyle email;
  TitleStyle addNotes;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    name: TitleStyle.fromJson(json["Name"]),
    phoneNumber: TitleStyle.fromJson(json["PhoneNumber"]),
    email: TitleStyle.fromJson(json["Email"]),
    addNotes: TitleStyle.fromJson(json["AddNotes"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name.toJson(),
    "PhoneNumber": phoneNumber.toJson(),
    "Email": email.toJson(),
    "AddNotes": addNotes.toJson(),
  };
}



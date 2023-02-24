// To parse this JSON data, do
//
//     final drawerContactUsBody = drawerContactUsBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/buttons.dart';
import '../../CommonElements/Elements/image_icon.dart';
import '../../CommonElements/Elements/title_style.dart';

DrawerContactUsBody drawerContactUsBodyFromJson(String str) => DrawerContactUsBody.fromJson(json.decode(str));

String drawerContactUsBodyToJson(DrawerContactUsBody data) => json.encode(data.toJson());

class DrawerContactUsBody {
  DrawerContactUsBody({
    required this.pageTitle,
    required this.promotTitle,
    required this.form,
    required this.submitButton,
  });

  TitleStyle pageTitle;
  TitleStyle promotTitle;
  Form form;
  Button submitButton;

  factory DrawerContactUsBody.fromJson(Map<String, dynamic> json) => DrawerContactUsBody(
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
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.inquiryTypeDropDown,
    required this.yourmessage,
  });

  TitleStyle name;
  TitleStyle email;
  TitleStyle phoneNumber;
  InquiryTypeDropDown inquiryTypeDropDown;
  TitleStyle yourmessage;

  factory Form.fromJson(Map<String, dynamic> json) => Form(
    name: TitleStyle.fromJson(json["Name"]),
    email: TitleStyle.fromJson(json["Email"]),
    phoneNumber: TitleStyle.fromJson(json["PhoneNumber"]),
    inquiryTypeDropDown: InquiryTypeDropDown.fromJson(json["InquiryTypeDropDown"]),
    yourmessage: TitleStyle.fromJson(json["Yourmessage"]),
  );

  Map<String, dynamic> toJson() => {
    "Name": name.toJson(),
    "Email": email.toJson(),
    "PhoneNumber": phoneNumber.toJson(),
    "InquiryTypeDropDown": inquiryTypeDropDown.toJson(),
    "Yourmessage": yourmessage.toJson(),
  };
}

class InquiryTypeDropDown {
  InquiryTypeDropDown({
    required this.labelText,
    required this.itemsTitle,
    required this.selectedIcon,
  });

  TitleStyle labelText;
  TitleStyle itemsTitle;
  ImageIcon selectedIcon;

  factory InquiryTypeDropDown.fromJson(Map<String, dynamic> json) => InquiryTypeDropDown(
    labelText: TitleStyle.fromJson(json["LabelText"]),
    itemsTitle: TitleStyle.fromJson(json["ItemsTitle"]),
    selectedIcon: ImageIcon.fromJson(json["SelectedIcon"]),
  );

  Map<String, dynamic> toJson() => {
    "LabelText": labelText.toJson(),
    "ItemsTitle": itemsTitle.toJson(),
    "SelectedIcon": selectedIcon.toJson(),
  };
}





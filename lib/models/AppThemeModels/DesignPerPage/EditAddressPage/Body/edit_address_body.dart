// To parse this JSON data, do
//
//     final editAddressBody = editAddressBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';
import 'Elements/EditAddressForm/form_edit_address.dart';

EditAddressBody editAddressBodyFromJson(String str) => EditAddressBody.fromJson(json.decode(str));

String editAddressBodyToJson(EditAddressBody data) => json.encode(data.toJson());

class EditAddressBody {
  EditAddressBody({
    required this.pageTitle,
    required this.pageImage,
    required this.form,
  });

  TitleStyle pageTitle;
  String pageImage;
  FormEditAddress form;

  factory EditAddressBody.fromJson(Map<String, dynamic> json) => EditAddressBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    pageImage: json["PageImage"],
    form: FormEditAddress.fromJson(json["Form"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "PageImage": pageImage,
    "Form": form.toJson(),
  };
}








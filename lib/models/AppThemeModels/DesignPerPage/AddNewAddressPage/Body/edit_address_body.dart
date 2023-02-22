// To parse this JSON data, do
//
//     final editAddressBody = editAddressBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';
import 'Elements/AddNewAddressForm/form_add_new_address.dart';


AddNewAddressBody editAddressBodyFromJson(String str) => AddNewAddressBody.fromJson(json.decode(str));

String editAddressBodyToJson(AddNewAddressBody data) => json.encode(data.toJson());

class AddNewAddressBody {
  AddNewAddressBody({
    required this.pageTitle,
    required this.pageImage,
    required this.form,
  });

  TitleStyle pageTitle;
  String pageImage;
  FormAddNewAddress form;

  factory AddNewAddressBody.fromJson(Map<String, dynamic> json) => AddNewAddressBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    pageImage: json["PageImage"],
    form: FormAddNewAddress.fromJson(json["Form"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "PageImage": pageImage,
    "Form": form.toJson(),
  };
}








// To parse this JSON data, do
//
//     final editAddressAppBar = editAddressAppBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

AddNewAddressAppBar editAddressAppBarFromJson(String str) => AddNewAddressAppBar.fromJson(json.decode(str));

String editAddressAppBarToJson(AddNewAddressAppBar data) => json.encode(data.toJson());

class AddNewAddressAppBar {
  AddNewAddressAppBar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory AddNewAddressAppBar.fromJson(Map<String, dynamic> json) => AddNewAddressAppBar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}





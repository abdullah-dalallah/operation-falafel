// To parse this JSON data, do
//
//     final editAddressAppBar = editAddressAppBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

EditAddressAppBar editAddressAppBarFromJson(String str) => EditAddressAppBar.fromJson(json.decode(str));

String editAddressAppBarToJson(EditAddressAppBar data) => json.encode(data.toJson());

class EditAddressAppBar {
  EditAddressAppBar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory EditAddressAppBar.fromJson(Map<String, dynamic> json) => EditAddressAppBar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}





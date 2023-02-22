// To parse this JSON data, do
//
//     final savedAddressAppbar = savedAddressAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/title_style.dart';

SavedAddressAppbar savedAddressAppbarFromJson(String str) => SavedAddressAppbar.fromJson(json.decode(str));

String savedAddressAppbarToJson(SavedAddressAppbar data) => json.encode(data.toJson());

class SavedAddressAppbar {
  SavedAddressAppbar({
    required this.backIcon,
    required this.title,
  });

  DrawerIcon backIcon;
  TitleStyle title;

  factory SavedAddressAppbar.fromJson(Map<String, dynamic> json) => SavedAddressAppbar(
    backIcon: DrawerIcon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



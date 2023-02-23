// To parse this JSON data, do
//
//     final savedCardsAppBar = savedCardsAppBarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/icon.dart';
import '../../CommonElements/Elements/title_style.dart';

SavedCardsAppBar savedCardsAppBarFromJson(String str) => SavedCardsAppBar.fromJson(json.decode(str));

String savedCardsAppBarToJson(SavedCardsAppBar data) => json.encode(data.toJson());

class SavedCardsAppBar {
  SavedCardsAppBar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory SavedCardsAppBar.fromJson(Map<String, dynamic> json) => SavedCardsAppBar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}





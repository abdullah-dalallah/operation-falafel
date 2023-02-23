// To parse this JSON data, do
//
//     final cardsList = cardsListFromJson(jsonString);

import 'dart:convert';

import '../../../../CommonElements/Elements/icon_button.dart';
import '../../../../CommonElements/Elements/title_style.dart';

CardsList cardsListFromJson(String str) => CardsList.fromJson(json.decode(str));

String cardsListToJson(CardsList data) => json.encode(data.toJson());

class CardsList {
  CardsList({
    required this.title,
    required this.subTitle,
    required this.editButton,
    required this.deleteButton,
  });

  TitleStyle title;
  TitleStyle subTitle;
  IconButton editButton;
  IconButton deleteButton;

  factory CardsList.fromJson(Map<String, dynamic> json) => CardsList(
    title: TitleStyle.fromJson(json["Title"]),
    subTitle: TitleStyle.fromJson(json["SubTitle"]),
    editButton: IconButton.fromJson(json["EditButton"]),
    deleteButton: IconButton.fromJson(json["DeleteButton"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "SubTitle": subTitle.toJson(),
    "EditButton": editButton.toJson(),
    "DeleteButton": deleteButton.toJson(),
  };
}



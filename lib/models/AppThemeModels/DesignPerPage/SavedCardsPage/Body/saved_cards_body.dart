// To parse this JSON data, do
//
//     final savedCardsBody = savedCardsBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/buttons.dart';
import '../../CommonElements/Elements/title_style.dart';
import 'Elements/CardsList/card_list.dart';

SavedCardsBody savedCardsBodyFromJson(String str) => SavedCardsBody.fromJson(json.decode(str));

String savedCardsBodyToJson(SavedCardsBody data) => json.encode(data.toJson());

class SavedCardsBody {
  SavedCardsBody({
    required this.pageTitle,
    required this.cardsList,
    required this.emptyList,
    required this.addNewCardButton,
  });

  TitleStyle pageTitle;
  CardsList cardsList;
  TitleStyle emptyList;
  Button addNewCardButton;

  factory SavedCardsBody.fromJson(Map<String, dynamic> json) => SavedCardsBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    cardsList: CardsList.fromJson(json["CardsList"]),
    emptyList: TitleStyle.fromJson(json["EmptyList"]),
    addNewCardButton: Button.fromJson(json["AddNewCardButton"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "CardsList": cardsList.toJson(),
    "EmptyList": emptyList.toJson(),
    "AddNewCardButton": addNewCardButton.toJson(),
  };
}



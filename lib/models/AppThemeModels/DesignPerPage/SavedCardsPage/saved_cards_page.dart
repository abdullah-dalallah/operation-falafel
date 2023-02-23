// To parse this JSON data, do
//
//     final savedCardsPage = savedCardsPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/saved_cards_appbar.dart';
import 'Body/saved_cards_body.dart';

SavedCardsPage savedCardsPageFromJson(String str) => SavedCardsPage.fromJson(json.decode(str));

String savedCardsPageToJson(SavedCardsPage data) => json.encode(data.toJson());

class SavedCardsPage {
  SavedCardsPage({
    required this.appBar,
    required this.body,
  });

  SavedCardsAppBar appBar;
  SavedCardsBody body;

  factory SavedCardsPage.fromJson(Map<String, dynamic> json) => SavedCardsPage(
    appBar: SavedCardsAppBar.fromJson(json["AppBar"]),
    body: SavedCardsBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}

// To parse this JSON data, do
//
//     final savedCards = savedCardsFromJson(jsonString);

import 'dart:convert';

import 'package:operation_falafel/providers/ProfileProviders/models/Saved%20cards/card_item.dart';

import 'package:json_annotation/json_annotation.dart';
part 'saved_cards.g.dart';

SavedCards savedCardsFromJson(String str) => SavedCards.fromJson(json.decode(str));

String savedCardsToJson(SavedCards data) => json.encode(data.toJson());

@JsonSerializable()
class SavedCards {
  bool? success;
  List<CardItem>? body;

  SavedCards({
    this.success,
    this.body,
  });

  factory SavedCards.fromJson(Map<String, dynamic> json) => SavedCards(
    success: json["success"],
    body: json["body"] == null ? [] : List<CardItem>.from(json["body"]!.map((x) => CardItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}



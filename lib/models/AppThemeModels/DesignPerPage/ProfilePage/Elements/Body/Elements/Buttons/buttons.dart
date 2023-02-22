// To parse this JSON data, do
//
//     final buttons = buttonsFromJson(jsonString);

import 'dart:convert';

import '../../../../../CommonElements/Elements/buttons.dart';

Buttons buttonsFromJson(String str) => Buttons.fromJson(json.decode(str));

String buttonsToJson(Buttons data) => json.encode(data.toJson());

class Buttons {
  Buttons({
    required this.orderHistory,
    required this.savedAddress,
    required this.savedCards,
    required this.loyalty,
    required this.help,
    required this.signOut,
  });

  Button orderHistory;
  Button savedAddress;
  Button savedCards;
  Button loyalty;
  Button help;
  Button signOut;

  factory Buttons.fromJson(Map<String, dynamic> json) => Buttons(
    orderHistory: Button.fromJson(json["OrderHistory"]),
    savedAddress: Button.fromJson(json["SavedAddress"]),
    savedCards: Button.fromJson(json["SavedCards"]),
    loyalty: Button.fromJson(json["Loyalty"]),
    help: Button.fromJson(json["Help"]),
    signOut: Button.fromJson(json["SignOut"]),
  );

  Map<String, dynamic> toJson() => {
    "OrderHistory": orderHistory.toJson(),
    "SavedAddress": savedAddress.toJson(),
    "SavedCards": savedCards.toJson(),
    "Loyalty": loyalty.toJson(),
    "Help": help.toJson(),
    "SignOut": signOut.toJson(),
  };
}



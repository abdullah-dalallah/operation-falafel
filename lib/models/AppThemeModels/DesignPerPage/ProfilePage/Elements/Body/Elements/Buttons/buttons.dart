// To parse this JSON data, do
//
//     final buttons = buttonsFromJson(jsonString);

import 'dart:convert';

import '../../../../../CommonElements/Elements/profile_buttons.dart';

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

  ProfileButton orderHistory;
  ProfileButton savedAddress;
  ProfileButton savedCards;
  ProfileButton loyalty;
  ProfileButton help;
  ProfileButton signOut;

  factory Buttons.fromJson(Map<String, dynamic> json) => Buttons(
    orderHistory: ProfileButton.fromJson(json["OrderHistory"]),
    savedAddress: ProfileButton.fromJson(json["SavedAddress"]),
    savedCards: ProfileButton.fromJson(json["SavedCards"]),
    loyalty: ProfileButton.fromJson(json["Loyalty"]),
    help: ProfileButton.fromJson(json["Help"]),
    signOut: ProfileButton.fromJson(json["SignOut"]),
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



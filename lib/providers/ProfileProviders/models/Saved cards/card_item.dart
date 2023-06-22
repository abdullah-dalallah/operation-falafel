// To parse this JSON data, do
//
//     final card = cardFromJson(jsonString);

import 'dart:convert';

CardItem cardFromJson(String str) => CardItem.fromJson(json.decode(str));

String cardToJson(CardItem data) => json.encode(data.toJson());

class CardItem {
  int? id;
  String? cardholderName;
  String? cardNumber;
  int? expirationMonth;
  int? expirationYear;
  int? userId;
  int? isMain;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  CardItem({
    this.id,
    this.cardholderName,
    this.cardNumber,
    this.expirationMonth,
    this.expirationYear,
    this.userId,
    this.isMain,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory CardItem.fromJson(Map<String, dynamic> json) => CardItem(
    id: json["id"],
    cardholderName: json["cardholder_name"],
    cardNumber: json["card_number"],
    expirationMonth: json["expiration_month"],
    expirationYear: json["expiration_year"],
    userId: json["user_id"],
    isMain: json["is_main"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cardholder_name": cardholderName,
    "card_number": cardNumber,
    "expiration_month": expirationMonth,
    "expiration_year": expirationYear,
    "user_id": userId,
    "is_main": isMain,
    "status": status,
    "is_deleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

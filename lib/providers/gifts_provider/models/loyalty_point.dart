// To parse this JSON data, do
//
//     final loyaltyPoint = loyaltyPointFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'loyalty_point.g.dart';
LoyaltyPoint loyaltyPointFromJson(String str) => LoyaltyPoint.fromJson(json.decode(str));

String loyaltyPointToJson(LoyaltyPoint data) => json.encode(data.toJson());
@JsonSerializable()
class LoyaltyPoint {
  bool? success;
  Body? body;

  LoyaltyPoint({
    this.success,
    this.body,
  });

  factory LoyaltyPoint.fromJson(Map<String, dynamic> json) => LoyaltyPoint(
    success: json["success"],
    body: json["body"] == null ? null : Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "body": body?.toJson(),
  };
}

class Body {
  int? id;
  int? userId;
  int? amount;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  Body({
    this.id,
    this.userId,
    this.amount,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    userId: json["user_id"],
    amount: json["amount"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "amount": amount,
    "status": status,
    "is_deleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

// To parse this JSON data, do
//
//     final loyaltyPointRate = loyaltyPointRateFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'loyalty_point_rate.g.dart';
LoyaltyPointRate loyaltyPointRateFromJson(String str) => LoyaltyPointRate.fromJson(json.decode(str));

String loyaltyPointRateToJson(LoyaltyPointRate data) => json.encode(data.toJson());
@JsonSerializable()
class LoyaltyPointRate {
  bool? success;
  Body? body;

  LoyaltyPointRate({
    this.success,
    this.body,
  });

  factory LoyaltyPointRate.fromJson(Map<String, dynamic> json) => LoyaltyPointRate(
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
  int? value;
  int? status;
  int? isDeleted;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Body({
    this.id,
    this.value,
    this.status,
    this.isDeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    value: json["value"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "status": status,
    "is_deleted": isDeleted,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

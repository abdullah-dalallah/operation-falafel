// To parse this JSON data, do
//
//     final gift = giftFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'gift.g.dart';
Gift giftFromJson(String str) => Gift.fromJson(json.decode(str));

String giftToJson(Gift data) => json.encode(data.toJson());

@JsonSerializable()
class Gift {
  int? id;
  String? name;
  dynamic reason;
  String? code;
  String? transaction;
  DateTime? expireAt;
  int? userId;
  int? giftCategoryId;
  int? giftSourceId;
  int? amount;
  int? paidAmount;
  int? point;
  int? ownerId;
  int? approved;
  int? approvedBy;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  GiftCategory? giftCategory;

  Gift({
    this.id,
    this.name,
    this.reason,
    this.code,
    this.transaction,
    this.expireAt,
    this.userId,
    this.giftCategoryId,
    this.giftSourceId,
    this.amount,
    this.paidAmount,
    this.point,
    this.ownerId,
    this.approved,
    this.approvedBy,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.giftCategory,
  });

  factory Gift.fromJson(Map<String, dynamic> json) => Gift(
    id: json["id"],
    name: json["name"],
    reason: json["reason"],
    code: json["code"],
    transaction: json["transaction"],
    expireAt: json["expire_at"] == null ? null : DateTime.parse(json["expire_at"]),
    userId: json["user_id"],
    giftCategoryId: json["gift_category_id"],
    giftSourceId: json["gift_source_id"],
    amount: json["amount"],
    paidAmount: json["paid_amount"],
    point: json["point"],
    ownerId: json["owner_id"],
    approved: json["approved"],
    approvedBy: json["approvedBy"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    giftCategory: json["giftCategory"] == null ? null : GiftCategory.fromJson(json["giftCategory"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "reason": reason,
    "code": code,
    "transaction": transaction,
    "expire_at": expireAt?.toIso8601String(),
    "user_id": userId,
    "gift_category_id": giftCategoryId,
    "gift_source_id": giftSourceId,
    "amount": amount,
    "paid_amount": paidAmount,
    "point": point,
    "owner_id": ownerId,
    "approved": approved,
    "approvedBy": approvedBy,
    "status": status,
    "is_deleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "giftCategory": giftCategory?.toJson(),
  };
}

class GiftCategory {
  int? id;
  List<GiftCondition>? giftConditions;

  GiftCategory({
    this.id,
    this.giftConditions,
  });

  factory GiftCategory.fromJson(Map<String, dynamic> json) => GiftCategory(
    id: json["id"],
    giftConditions: json["gift_conditions"] == null ? [] : List<GiftCondition>.from(json["gift_conditions"]!.map((x) => GiftCondition.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gift_conditions": giftConditions == null ? [] : List<dynamic>.from(giftConditions!.map((x) => x.toJson())),
  };
}

class GiftCondition {
  int? id;
  List<GiftConditionTranslate>? giftConditionTranslates;
  GiftsConditionsCategories? giftsConditionsCategories;

  GiftCondition({
    this.id,
    this.giftConditionTranslates,
    this.giftsConditionsCategories,
  });

  factory GiftCondition.fromJson(Map<String, dynamic> json) => GiftCondition(
    id: json["id"],
    giftConditionTranslates: json["gift_condition_translates"] == null ? [] : List<GiftConditionTranslate>.from(json["gift_condition_translates"]!.map((x) => GiftConditionTranslate.fromJson(x))),
    giftsConditionsCategories: json["gifts_conditions_categories"] == null ? null : GiftsConditionsCategories.fromJson(json["gifts_conditions_categories"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gift_condition_translates": giftConditionTranslates == null ? [] : List<dynamic>.from(giftConditionTranslates!.map((x) => x.toJson())),
    "gifts_conditions_categories": giftsConditionsCategories?.toJson(),
  };
}

class GiftConditionTranslate {
  String? title;

  GiftConditionTranslate({
    this.title,
  });

  factory GiftConditionTranslate.fromJson(Map<String, dynamic> json) => GiftConditionTranslate(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}

class GiftsConditionsCategories {
  int? id;
  int? giftCategoryId;
  int? giftConditionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  GiftsConditionsCategories({
    this.id,
    this.giftCategoryId,
    this.giftConditionId,
    this.createdAt,
    this.updatedAt,
  });

  factory GiftsConditionsCategories.fromJson(Map<String, dynamic> json) => GiftsConditionsCategories(
    id: json["id"],
    giftCategoryId: json["gift_category_id"],
    giftConditionId: json["gift_condition_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gift_category_id": giftCategoryId,
    "gift_condition_id": giftConditionId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

// To parse this JSON data, do
//
//     final giftForSale = giftForSaleFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'gift_for_sale.g.dart';

GiftForSale giftForSaleFromJson(String str) => GiftForSale.fromJson(json.decode(str));

String giftForSaleToJson(GiftForSale data) => json.encode(data.toJson());
@JsonSerializable()
class GiftForSale {
  int? id;
  String? title;
  String? name;
  int? countryId;
  String? image;
  int? validityPeriod;
  int? price;
  int? point;
  int? forSale;
  int? status;
  int? isDeleted;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GiftCategoryTranslate>? giftCategoryTranslates;
  List<GiftCondition>? giftConditions;
  dynamic imageUrl;

  GiftForSale({
    this.id,
    this.title,
    this.name,
    this.countryId,
    this.image,
    this.validityPeriod,
    this.price,
    this.point,
    this.forSale,
    this.status,
    this.isDeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.giftCategoryTranslates,
    this.giftConditions,
    this.imageUrl,
  });

  factory GiftForSale.fromJson(Map<String, dynamic> json) => GiftForSale(
    id: json["id"],
    title: json["title"],
    name: json["name"],
    countryId: json["country_id"],
    image: json["image"],
    validityPeriod: json["validity_period"],
    price: json["price"],
    point: json["point"],
    forSale: json["for_sale"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    giftCategoryTranslates: json["gift_category_translates"] == null ? [] : List<GiftCategoryTranslate>.from(json["gift_category_translates"]!.map((x) => GiftCategoryTranslate.fromJson(x))),
    giftConditions: json["gift_conditions"] == null ? [] : List<GiftCondition>.from(json["gift_conditions"]!.map((x) => GiftCondition.fromJson(x))),
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "name": name,
    "country_id": countryId,
    "image": image,
    "validity_period": validityPeriod,
    "price": price,
    "point": point,
    "for_sale": forSale,
    "status": status,
    "is_deleted": isDeleted,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "gift_category_translates": giftCategoryTranslates == null ? [] : List<dynamic>.from(giftCategoryTranslates!.map((x) => x.toJson())),
    "gift_conditions": giftConditions == null ? [] : List<dynamic>.from(giftConditions!.map((x) => x.toJson())),
    "imageUrl": imageUrl,
  };
}

class GiftCategoryTranslate {
  String? title;
  String? name;

  GiftCategoryTranslate({
    this.title,
    this.name,
  });

  factory GiftCategoryTranslate.fromJson(Map<String, dynamic> json) => GiftCategoryTranslate(
    title: json["title"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "name": name,
  };
}

class GiftCondition {
  int? id;
  String? title;
  int? sort;
  int? status;
  int? isDeleted;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  GiftsConditionsCategories? giftsConditionsCategories;
  List<GiftConditionTranslate>? giftConditionTranslates;

  GiftCondition({
    this.id,
    this.title,
    this.sort,
    this.status,
    this.isDeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.giftsConditionsCategories,
    this.giftConditionTranslates,
  });

  factory GiftCondition.fromJson(Map<String, dynamic> json) => GiftCondition(
    id: json["id"],
    title: json["title"],
    sort: json["sort"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    giftsConditionsCategories: json["gifts_conditions_categories"] == null ? null : GiftsConditionsCategories.fromJson(json["gifts_conditions_categories"]),
    giftConditionTranslates: json["gift_condition_translates"] == null ? [] : List<GiftConditionTranslate>.from(json["gift_condition_translates"]!.map((x) => GiftConditionTranslate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "sort": sort,
    "status": status,
    "is_deleted": isDeleted,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "gifts_conditions_categories": giftsConditionsCategories?.toJson(),
    "gift_condition_translates": giftConditionTranslates == null ? [] : List<dynamic>.from(giftConditionTranslates!.map((x) => x.toJson())),
  };
}

class GiftConditionTranslate {
  int? id;
  String? title;
  String? langCode;
  int? giftConditionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  GiftConditionTranslate({
    this.id,
    this.title,
    this.langCode,
    this.giftConditionId,
    this.createdAt,
    this.updatedAt,
  });

  factory GiftConditionTranslate.fromJson(Map<String, dynamic> json) => GiftConditionTranslate(
    id: json["id"],
    title: json["title"],
    langCode: json["lang_code"],
    giftConditionId: json["gift_condition_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "lang_code": langCode,
    "gift_condition_id": giftConditionId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
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

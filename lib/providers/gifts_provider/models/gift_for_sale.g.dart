// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_for_sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftForSale _$GiftForSaleFromJson(Map<String, dynamic> json) => GiftForSale(
      id: json['id'] as int?,
      title: json['title'] as String?,
      name: json['name'] as String?,
      countryId: json['countryId'] as int?,
      image: json['image'] as String?,
      validityPeriod: json['validityPeriod'] as int?,
      price: json['price'] as int?,
      point: json['point'] as int?,
      forSale: json['forSale'] as int?,
      status: json['status'] as int?,
      isDeleted: json['isDeleted'] as int?,
      createdBy: json['createdBy'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      giftCategoryTranslates: (json['giftCategoryTranslates'] as List<dynamic>?)
          ?.map(
              (e) => GiftCategoryTranslate.fromJson(e as Map<String, dynamic>))
          .toList(),
      giftConditions: (json['giftConditions'] as List<dynamic>?)
          ?.map((e) => GiftCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['imageUrl'],
    );

Map<String, dynamic> _$GiftForSaleToJson(GiftForSale instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'countryId': instance.countryId,
      'image': instance.image,
      'validityPeriod': instance.validityPeriod,
      'price': instance.price,
      'point': instance.point,
      'forSale': instance.forSale,
      'status': instance.status,
      'isDeleted': instance.isDeleted,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'giftCategoryTranslates': instance.giftCategoryTranslates,
      'giftConditions': instance.giftConditions,
      'imageUrl': instance.imageUrl,
    };

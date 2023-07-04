// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gift _$GiftFromJson(Map<String, dynamic> json) => Gift(
      id: json['id'] as int?,
      name: json['name'] as String?,
      reason: json['reason'],
      code: json['code'] as String?,
      transaction: json['transaction'] as String?,
      expireAt: json['expireAt'] == null
          ? null
          : DateTime.parse(json['expireAt'] as String),
      userId: json['userId'] as int?,
      giftCategoryId: json['giftCategoryId'] as int?,
      giftSourceId: json['giftSourceId'] as int?,
      amount: json['amount'] as int?,
      paidAmount: json['paidAmount'] as int?,
      point: json['point'] as int?,
      ownerId: json['ownerId'] as int?,
      approved: json['approved'] as int?,
      approvedBy: json['approvedBy'] as int?,
      status: json['status'] as int?,
      isDeleted: json['isDeleted'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      giftCategory: json['giftCategory'] == null
          ? null
          : GiftCategory.fromJson(json['giftCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GiftToJson(Gift instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'reason': instance.reason,
      'code': instance.code,
      'transaction': instance.transaction,
      'expireAt': instance.expireAt?.toIso8601String(),
      'userId': instance.userId,
      'giftCategoryId': instance.giftCategoryId,
      'giftSourceId': instance.giftSourceId,
      'amount': instance.amount,
      'paidAmount': instance.paidAmount,
      'point': instance.point,
      'ownerId': instance.ownerId,
      'approved': instance.approved,
      'approvedBy': instance.approvedBy,
      'status': instance.status,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'giftCategory': instance.giftCategory,
    };

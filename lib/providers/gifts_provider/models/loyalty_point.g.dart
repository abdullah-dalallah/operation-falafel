// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyaltyPoint _$LoyaltyPointFromJson(Map<String, dynamic> json) => LoyaltyPoint(
      success: json['success'] as bool?,
      body: json['body'] == null
          ? null
          : Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoyaltyPointToJson(LoyaltyPoint instance) =>
    <String, dynamic>{
      'success': instance.success,
      'body': instance.body,
    };

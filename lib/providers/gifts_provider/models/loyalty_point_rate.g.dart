// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_point_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyaltyPointRate _$LoyaltyPointRateFromJson(Map<String, dynamic> json) =>
    LoyaltyPointRate(
      success: json['success'] as bool?,
      body: json['body'] == null
          ? null
          : Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoyaltyPointRateToJson(LoyaltyPointRate instance) =>
    <String, dynamic>{
      'success': instance.success,
      'body': instance.body,
    };

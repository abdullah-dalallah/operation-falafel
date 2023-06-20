// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfomodelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      success: json['success'] as bool?,
      body: json['body'] == null
          ? null
          : Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfomodelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'body': instance.body,
    };

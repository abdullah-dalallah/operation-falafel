// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppTheme _$AppThemeFromJson(Map<String, dynamic> json) => AppTheme(
      id: json['id'] as String?,
      themeId: json['themeId'] as int?,
      fontSizes: json['fontSizes'] == null
          ? null
          : FontSizes.fromJson(json['fontSizes'] as Map<String, dynamic>),
      designPerPage: json['designPerPage'] == null
          ? null
          : DesignPerPage.fromJson(
              json['designPerPage'] as Map<String, dynamic>),
      language: json['language'] as String?,
      status: json['status'] as int?,
      direction: json['direction'] as String?,
      createdBy: json['createdBy'] as int?,
      expiryDate: json['expiryDate'] as String?,
      isDeleted: json['isDeleted'] as int?,
      isExpired: json['isExpired'] as int?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$AppThemeToJson(AppTheme instance) => <String, dynamic>{
      'id': instance.id,
      'themeId': instance.themeId,
      'fontSizes': instance.fontSizes,
      'designPerPage': instance.designPerPage,
      'language': instance.language,
      'direction': instance.direction,
      'status': instance.status,
      'isDeleted': instance.isDeleted,
      'isExpired': instance.isExpired,
      'expiryDate': instance.expiryDate,
      'createdBy': instance.createdBy,
      'v': instance.v,
    };

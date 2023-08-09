// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTokenResponse _$RequestTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RequestTokenResponse(
      accessToken: json['accessToken'] as String?,
      expiresIn: json['expiresIn'] as int?,
      refreshExpiresIn: json['refreshExpiresIn'] as int?,
      refreshToken: json['refreshToken'] as String?,
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$RequestTokenResponseToJson(
        RequestTokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'expiresIn': instance.expiresIn,
      'refreshExpiresIn': instance.refreshExpiresIn,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
    };

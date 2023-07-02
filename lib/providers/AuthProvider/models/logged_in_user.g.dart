// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedInUser _$LoggedInUserFromJson(Map<String, dynamic> json) => LoggedInUser(
      token: json['token'] as String?,
      expiredAt: json['expiredAt'] as int?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$LoggedInUserToJson(LoggedInUser instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiredAt': instance.expiredAt,
      'userId': instance.userId,
    };

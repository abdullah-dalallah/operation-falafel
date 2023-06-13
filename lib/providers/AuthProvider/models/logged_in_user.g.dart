// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedInUser _$LoggedInUserFromJson(Map<String, dynamic> json) => LoggedInUser(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoggedInUserToJson(LoggedInUser instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

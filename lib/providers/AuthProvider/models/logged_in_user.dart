// To parse this JSON data, do
//
//     final loggedInUser = loggedInUserFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';


// To parse this JSON data, do
//
//     final loggedInUser = loggedInUserFromJson(jsonString);
part 'logged_in_user.g.dart';


LoggedInUser loggedInUserFromJson(String str) => LoggedInUser.fromJson(json.decode(str));

String loggedInUserToJson(LoggedInUser data) => json.encode(data.toJson());

@JsonSerializable()
class LoggedInUser {
  String? token;
  int? expiredAt;
  int? userId;

  LoggedInUser({
    this.token,
    this.expiredAt,
    this.userId,
  });

  factory LoggedInUser.fromJson(Map<String, dynamic> json) => LoggedInUser(
    token: json["token"],
    expiredAt: json["expired_at"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expired_at": expiredAt,
    "user_id": userId,
  };
}


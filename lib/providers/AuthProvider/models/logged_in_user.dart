// To parse this JSON data, do
//
//     final loggedInUser = loggedInUserFromJson(jsonString);

import 'dart:convert';

LoggedInUser loggedInUserFromJson(String str) => LoggedInUser.fromJson(json.decode(str));

String loggedInUserToJson(LoggedInUser data) => json.encode(data.toJson());

class LoggedInUser {
  LoggedInUser({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory LoggedInUser.fromJson(Map<String, dynamic> json) => LoggedInUser(
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  User({
    this.name,
    this.id,
  });

  String? name;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}

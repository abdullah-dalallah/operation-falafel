// To parse this JSON data, do
//
//     final userInfomodel = userInfomodelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'user_info_model.g.dart';

UserInfoModel userInfomodelFromJson(String str) => UserInfoModel.fromJson(json.decode(str));

String userInfomodelToJson(UserInfoModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserInfoModel {
  bool? success;
  Body? body;

  UserInfoModel({
    this.success,
    this.body,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    success: json["success"],
    body: json["body"] == null ? null : Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "body": body?.toJson(),
  };
}

class Body {
  String? name;
  String? email;
  String? mobile;
  String? image;
  DateTime? dateOfBirth;
  String? gender;
  int? verified;
  Nationality? nationality;

  Body({
    this.name,
    this.email,
    this.mobile,
    this.image,
    this.dateOfBirth,
    this.gender,
    this.verified,
    this.nationality,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    image: json["image"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    gender: json["gender"],
    verified: json["verified"],
    nationality: json["nationality"] == null ? null : Nationality.fromJson(json["nationality"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobile": mobile,
    "image": image,
    "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "verified": verified,
    "nationality": nationality?.toJson(),
  };
}

class Nationality {
  String? name;

  Nationality({
    this.name,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) => Nationality(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

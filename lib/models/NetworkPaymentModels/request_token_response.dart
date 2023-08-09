// To parse this JSON data, do
//
//     final requestTokenResponse = requestTokenResponseFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';


part 'request_token_response.g.dart';

RequestTokenResponse requestTokenResponseFromJson(String str) => RequestTokenResponse.fromJson(json.decode(str));

String requestTokenResponseToJson(RequestTokenResponse data) => json.encode(data.toJson());

@JsonSerializable()
class RequestTokenResponse {
  String? accessToken;
  int? expiresIn;
  int? refreshExpiresIn;
  String? refreshToken;
  String? tokenType;

  RequestTokenResponse({
    this.accessToken,
    this.expiresIn,
    this.refreshExpiresIn,
    this.refreshToken,
    this.tokenType,
  });

  factory RequestTokenResponse.fromJson(Map<String, dynamic> json) => RequestTokenResponse(
    accessToken: json["access_token"],
    expiresIn: json["expires_in"],
    refreshExpiresIn: json["refresh_expires_in"],
    refreshToken: json["refresh_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "expires_in": expiresIn,
    "refresh_expires_in": refreshExpiresIn,
    "refresh_token": refreshToken,
    "token_type": tokenType,
  };
}

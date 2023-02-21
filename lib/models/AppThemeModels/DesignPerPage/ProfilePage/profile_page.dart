// To parse this JSON data, do
//
//     final profilePage = profilePageFromJson(jsonString);

import 'dart:convert';

import 'Elements/Appbar/profile_page_appbar.dart';
import 'Elements/Body/profile_page_body.dart';

ProfilePage profilePageFromJson(String str) => ProfilePage.fromJson(json.decode(str));

String profilePageToJson(ProfilePage data) => json.encode(data.toJson());

class ProfilePage {
  ProfilePage({
    required this.appBar,
    required this.body,
  });

  ProfilePageAppBar appBar;
  ProfilePageBody body;

  factory ProfilePage.fromJson(Map<String, dynamic> json) => ProfilePage(
    appBar: ProfilePageAppBar.fromJson(json["AppBar"]),
    body: ProfilePageBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}

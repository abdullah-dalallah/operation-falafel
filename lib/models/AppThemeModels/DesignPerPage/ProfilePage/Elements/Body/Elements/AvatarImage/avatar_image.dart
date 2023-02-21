// To parse this JSON data, do
//
//     final avatarImage = avatarImageFromJson(jsonString);

import 'dart:convert';

import 'Elements/edit_button.dart';

AvatarImage avatarImageFromJson(String str) => AvatarImage.fromJson(json.decode(str));

String avatarImageToJson(AvatarImage data) => json.encode(data.toJson());

class AvatarImage {
  AvatarImage({
    required this.defaultImage,
    required this.editButton,
  });

  String defaultImage;
  EditButton editButton;

  factory AvatarImage.fromJson(Map<String, dynamic> json) => AvatarImage(
    defaultImage: json["DefaultImage"],
    editButton: EditButton.fromJson(json["EditButton"]),
  );

  Map<String, dynamic> toJson() => {
    "DefaultImage": defaultImage,
    "EditButton": editButton.toJson(),
  };
}



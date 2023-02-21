// To parse this JSON data, do
//
//     final profilePageBody = profilePageBodyFromJson(jsonString);

import 'dart:convert';

import '../../../CommonElements/Elements/title_style.dart';
import 'Elements/AvatarImage/avatar_image.dart';
import 'Elements/Buttons/buttons.dart';
import 'Elements/Form/form.dart';

ProfilePageBody profilePageBodyFromJson(String str) => ProfilePageBody.fromJson(json.decode(str));

String profilePageBodyToJson(ProfilePageBody data) => json.encode(data.toJson());

class ProfilePageBody {
  ProfilePageBody({
    required this.avatarImage,
    required this.name,
    required this.editProfileButton,
    required this.form,
    required this.buttons,
  });

  AvatarImage avatarImage;
  TitleStyle name;
  TitleStyle editProfileButton;
  Form form;
  Buttons buttons;

  factory ProfilePageBody.fromJson(Map<String, dynamic> json) => ProfilePageBody(
    avatarImage: AvatarImage.fromJson(json["AvatarImage"]),
    name: TitleStyle.fromJson(json["Name"]),
    editProfileButton: TitleStyle.fromJson(json["EditProfileButton"]),
    form: Form.fromJson(json["Form"]),
    buttons: Buttons.fromJson(json["Buttons"]),
  );

  Map<String, dynamic> toJson() => {
    "AvatarImage": avatarImage.toJson(),
    "Name": name.toJson(),
    "EditProfileButton": editProfileButton.toJson(),
    "Form": form.toJson(),
    "Buttons": buttons.toJson(),
  };
}
















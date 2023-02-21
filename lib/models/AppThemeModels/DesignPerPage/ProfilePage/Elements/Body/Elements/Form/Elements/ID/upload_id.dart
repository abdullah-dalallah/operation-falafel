// To parse this JSON data, do
//
//     final uploadId = uploadIdFromJson(jsonString);

import 'dart:convert';

import 'Elements/choose_button.dart';

UploadId uploadIdFromJson(String str) => UploadId.fromJson(json.decode(str));

String uploadIdToJson(UploadId data) => json.encode(data.toJson());

class UploadId {
  UploadId({
    required this.data,
    required this.color,
    required this.chooseButton,
  });

  String data;
  String color;
  ChooseButton chooseButton;

  factory UploadId.fromJson(Map<String, dynamic> json) => UploadId(
    data: json["Data"],
    color: json["Color"],
    chooseButton: ChooseButton.fromJson(json["ChooseButton"]),
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "ChooseButton": chooseButton.toJson(),
  };
}


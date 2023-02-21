// To parse this JSON data, do
//
//     final statusImage = statusImageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StatusImage statusImageFromJson(String str) => StatusImage.fromJson(json.decode(str));

String statusImageToJson(StatusImage data) => json.encode(data.toJson());

class StatusImage {
  StatusImage({
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  String imageUrl;
  String height;
  String width;

  factory StatusImage.fromJson(Map<String, dynamic> json) => StatusImage(
    imageUrl: json["Image_Url"],
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "Image_Url": imageUrl,
    "height": height,
    "width": width,
  };
}

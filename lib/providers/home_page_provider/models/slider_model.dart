// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderItem sliderModelFromJson(String str) => SliderItem.fromJson(json.decode(str));

String sliderModelToJson(SliderItem data) => json.encode(data.toJson());

class SliderItem {
  int? id;
  String? image;
  int? status;
  int? isDeleted;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imageUrl;

  SliderItem({
    this.id,
    this.image,
    this.status,
    this.isDeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) => SliderItem(
    id: json["id"],
    image: json["image"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "status": status,
    "is_deleted": isDeleted,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "imageUrl": imageUrl,
  };
}

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
  String? target;
  String? destination;
  String? imageUrl;

  SliderItem({
    this.id,
    this.image,
    this.status,
    this.isDeleted,

    this.target,
    this.destination,
    this.imageUrl,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) => SliderItem(
    id: json["id"],
    image: json["image"],
    status: json["status"],
    isDeleted: json["is_deleted"],

    destination: json["destination"],
    target: json["target"] ,
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "status": status,
    "is_deleted": isDeleted,
    "target": target,
    "destination": destination,
    "imageUrl": imageUrl,
  };
}

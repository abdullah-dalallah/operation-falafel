// To parse this JSON data, do
//
//     final imageIcon = imageIconFromJson(jsonString);

import 'dart:convert';

ImageIcon imageIconFromJson(String str) => ImageIcon.fromJson(json.decode(str));

String imageIconToJson(ImageIcon data) => json.encode(data.toJson());

class ImageIcon {
  ImageIcon({
    required this.imageIcon,
    required this.height,
    required this.width,
  });

  String imageIcon;
  String height;
  String width;

  factory ImageIcon.fromJson(Map<String, dynamic> json) => ImageIcon(
    imageIcon: json["ImageIcon"],
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "height": height,
    "width": width,
  };
}

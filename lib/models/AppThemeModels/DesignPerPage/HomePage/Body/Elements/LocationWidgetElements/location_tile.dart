// To parse this JSON data, do
//
//     final locationTile = locationTileFromJson(jsonString);

import 'dart:convert';

LocationTile locationTileFromJson(String str) => LocationTile.fromJson(json.decode(str));

String locationTileToJson(LocationTile data) => json.encode(data.toJson());

class LocationTile {
  LocationTile({
    required this.color,
  });

  String color;

  factory LocationTile.fromJson(Map<String, dynamic> json) => LocationTile(
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "Color": color,
  };
}

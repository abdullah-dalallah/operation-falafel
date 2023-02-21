// To parse this JSON data, do
//
//     final menusTitle = menusTitleFromJson(jsonString);

import 'dart:convert';

MenusTitle menusTitleFromJson(String str) => MenusTitle.fromJson(json.decode(str));

String menusTitleToJson(MenusTitle data) => json.encode(data.toJson());

class MenusTitle {
  MenusTitle({
    required this.data,
    required this.color,
    required this.activeColo,
    required this.inactiveColor,
  });

  String data;
  String color;
  String activeColo;
  String inactiveColor;

  factory MenusTitle.fromJson(Map<String, dynamic> json) => MenusTitle(
    data: json["Data"],
    color: json["Color"],
    activeColo: json["ActiveColo"],
    inactiveColor: json["InactiveColor"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "ActiveColo": activeColo,
    "InactiveColor": inactiveColor,
  };
}

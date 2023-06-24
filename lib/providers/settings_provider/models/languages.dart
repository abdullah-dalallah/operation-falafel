// To parse this JSON data, do
//
//     final languages = languagesFromJson(jsonString);

import 'dart:convert';

Languages languagesFromJson(String str) => Languages.fromJson(json.decode(str));

String languagesToJson(Languages data) => json.encode(data.toJson());

class Languages {
  bool? success;
  List<Body>? body;

  Languages({
    this.success,
    this.body,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
    success: json["success"],
    body: json["body"] == null ? [] : List<Body>.from(json["body"]!.map((x) => Body.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "body": body == null ? [] : List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}

class Body {
  int? id;
  String? name;
  String? icon;
  String? code;
  int? isDeleted;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Body({
    this.id,
    this.name,
    this.icon,
    this.code,
    this.isDeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    code: json["code"],
    isDeleted: json["is_deleted"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "code": code,
    "is_deleted": isDeleted,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

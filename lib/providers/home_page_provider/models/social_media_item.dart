// To parse this JSON data, do
//
//     final socialmediaItem = socialmediaItemFromJson(jsonString);

import 'dart:convert';

List<SocialMediaItem> socialmediaItemFromJson(String str) => List<SocialMediaItem>.from(json.decode(str).map((x) => SocialMediaItem.fromJson(x)));

String socialmediaItemToJson(List<SocialMediaItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SocialMediaItem {
  int? id;
  String? name;
  String? icon;
  String? link;
  int? status;
  int? isDeleted;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? iconUrl;

  SocialMediaItem({
    this.id,
    this.name,
    this.icon,
    this.link,
    this.status,
    this.isDeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.iconUrl,
  });

  factory SocialMediaItem.fromJson(Map<String, dynamic> json) => SocialMediaItem(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    link: json["link"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    iconUrl: json["iconUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "link": link,
    "status": status,
    "is_deleted": isDeleted,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "iconUrl": iconUrl,
  };
}

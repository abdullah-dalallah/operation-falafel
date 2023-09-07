// To parse this JSON data, do
//
//     final savedAddressList = savedAddressListFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'saved_address_list_res_model.g.dart';
SavedAddressList savedAddressListFromJson(String str) => SavedAddressList.fromJson(json.decode(str));

String savedAddressListToJson(SavedAddressList data) => json.encode(data.toJson());

@JsonSerializable()
class SavedAddressList {
  SavedAddressList({
    this.success,
    this.savedAddressItems,
  });

  bool? success;
  List<SavedAddressItem>? savedAddressItems;

  factory SavedAddressList.fromJson(Map<String, dynamic> json) => SavedAddressList(
    success: json["success"],
    savedAddressItems: json["body"] == null ? [] : List<SavedAddressItem>.from(json["body"]!.map((x) => SavedAddressItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "body": savedAddressItems == null ? [] : List<dynamic>.from(savedAddressItems!.map((x) => x.toJson())),
  };
}

class SavedAddressItem {
  SavedAddressItem({
    this.id,
    this.name,
    this.area,
    this.building,
    this.flat,
    this.lat,
    this.long,
    this.isPrimary,
    this.userId,
    this.cityId,
    this.addressTypeId,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? area;
  String? building;
  String? flat;
  String? lat;
  String? long;
  int? isPrimary;
  int? userId;
  int? cityId;
  int? addressTypeId;
  int? status;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SavedAddressItem.fromJson(Map<String, dynamic> json) => SavedAddressItem(
    id: json["id"],
    name: json["name"],
    area: json["area"],
    building: json["building"],
    flat: json["flat"],
    lat: json["lat"],
    long: json["long"],
    isPrimary: json["is_primary"],
    userId: json["user_id"],
    cityId: json["city_id"],
    addressTypeId: json["address_type_id"],
    status: json["status"],
    isDeleted: json["is_deleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "area": area,
    "building": building,
    "flat": flat,
    "lat": lat,
    "long": long,
    "is_primary": isPrimary,
    "user_id": userId,
    "city_id": cityId,
    "address_type_id": addressTypeId,
    "status": status,
    "is_deleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

// To parse this JSON data, do
//
//     final loyaltyPointHistory = loyaltyPointHistoryFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
// part 'loyalty_point.g.dart';
LoyaltyPointHistory loyaltyPointHistoryFromJson(String str) => LoyaltyPointHistory.fromJson(json.decode(str));

String loyaltyPointHistoryToJson(LoyaltyPointHistory data) => json.encode(data.toJson());
@JsonSerializable()
class LoyaltyPointHistory {
  bool? success;
  List<HistoryList>? historyList;

  LoyaltyPointHistory({
    this.success,
    this.historyList,
  });

  factory LoyaltyPointHistory.fromJson(Map<String, dynamic> json) => LoyaltyPointHistory(
    success: json["success"],
    historyList: json["body"] == null ? [] : List<HistoryList>.from(json["body"]!.map((x) => HistoryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "body": historyList == null ? [] : List<dynamic>.from(historyList!.map((x) => x.toJson())),
  };
}

class HistoryList {
  int? id;
  String? reason;
  int? userId;
  String? orderNumber;
  int? orderAmount;
  int? loyaltySourceId;
  int? amount;
  int? loyaltyTypeId;
  dynamic parentId;
  int? loyaltyStatusId;
  int? expired;
  DateTime? expiredAt;
  dynamic expiredDate;
  int? isDeleted;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  HistoryList({
    this.id,
    this.reason,
    this.userId,
    this.orderNumber,
    this.orderAmount,
    this.loyaltySourceId,
    this.amount,
    this.loyaltyTypeId,
    this.parentId,
    this.loyaltyStatusId,
    this.expired,
    this.expiredAt,
    this.expiredDate,
    this.isDeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryList.fromJson(Map<String, dynamic> json) => HistoryList(
    id: json["id"],
    reason: json["reason"],
    userId: json["user_id"],
    orderNumber: json["order_number"],
    orderAmount: json["order_amount"],
    loyaltySourceId: json["loyalty_source_id"],
    amount: json["amount"],
    loyaltyTypeId: json["loyalty_type_id"],
    parentId: json["parent_id"],
    loyaltyStatusId: json["loyalty_status_id"],
    expired: json["expired"],
    expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]),
    expiredDate: json["expired_date"],
    isDeleted: json["is_deleted"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reason": reason,
    "user_id": userId,
    "order_number": orderNumber,
    "order_amount": orderAmount,
    "loyalty_source_id": loyaltySourceId,
    "amount": amount,
    "loyalty_type_id": loyaltyTypeId,
    "parent_id": parentId,
    "loyalty_status_id": loyaltyStatusId,
    "expired": expired,
    "expired_at": expiredAt?.toIso8601String(),
    "expired_date": expiredDate,
    "is_deleted": isDeleted,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

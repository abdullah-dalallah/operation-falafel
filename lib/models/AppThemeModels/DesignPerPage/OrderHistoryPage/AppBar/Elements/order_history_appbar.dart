// To parse this JSON data, do
//
//     final orderHistoryPageAppBar = orderHistoryPageAppBarFromJson(jsonString);

import 'dart:convert';

import '../../../CommonElements/Elements/icon.dart';
import '../../../CommonElements/Elements/title_style.dart';

OrderHistoryPageAppBar orderHistoryPageAppBarFromJson(String str) => OrderHistoryPageAppBar.fromJson(json.decode(str));

String orderHistoryPageAppBarToJson(OrderHistoryPageAppBar data) => json.encode(data.toJson());

class OrderHistoryPageAppBar {
  OrderHistoryPageAppBar({
    required this.backIcon,
    required this.title,
  });

  Icon backIcon;
  TitleStyle title;

  factory OrderHistoryPageAppBar.fromJson(Map<String, dynamic> json) => OrderHistoryPageAppBar(
    backIcon: Icon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}



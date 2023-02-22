// To parse this JSON data, do
//
//     final orderDetailsAppbar = orderDetailsAppbarFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/drawer_Icon.dart';
import '../../CommonElements/Elements/title_style.dart';

OrderDetailsAppbar orderDetailsAppbarFromJson(String str) => OrderDetailsAppbar.fromJson(json.decode(str));

String orderDetailsAppbarToJson(OrderDetailsAppbar data) => json.encode(data.toJson());

class OrderDetailsAppbar {
  OrderDetailsAppbar({
    required this.backIcon,
    required this.title,
  });

  DrawerIcon backIcon;
  TitleStyle title;

  factory OrderDetailsAppbar.fromJson(Map<String, dynamic> json) => OrderDetailsAppbar(
    backIcon: DrawerIcon.fromJson(json["BackIcon"]),
    title: TitleStyle.fromJson(json["Title"]),
  );

  Map<String, dynamic> toJson() => {
    "BackIcon": backIcon.toJson(),
    "Title": title.toJson(),
  };
}





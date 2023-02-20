// To parse this JSON data, do
//
//     final orderNowButtonWidget = orderNowButtonWidgetFromJson(jsonString);

import 'dart:convert';

OrderNowButtonWidget orderNowButtonWidgetFromJson(String str) => OrderNowButtonWidget.fromJson(json.decode(str));

String orderNowButtonWidgetToJson(OrderNowButtonWidget data) => json.encode(data.toJson());

class OrderNowButtonWidget {
  OrderNowButtonWidget({
    required this.data,
    required this.color,
    required this.backGroundColor,
  });

  String data;
  String color;
  String backGroundColor;

  factory OrderNowButtonWidget.fromJson(Map<String, dynamic> json) => OrderNowButtonWidget(
    data: json["Data"],
    color: json["Color"],
    backGroundColor: json["BackGroundColor"],
  );

  Map<String, dynamic> toJson() => {
    "Data": data,
    "Color": color,
    "BackGroundColor": backGroundColor,
  };
}

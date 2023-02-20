// To parse this JSON data, do
//
//     final homePageBody = homePageBodyFromJson(jsonString);

import 'dart:convert';

import 'Elements/dashboard_widget.dart';
import 'Elements/location_widget.dart';
import 'Elements/order_now_button_widget.dart';

HomePageBody homePageBodyFromJson(String str) => HomePageBody.fromJson(json.decode(str));

String homePageBodyToJson(HomePageBody data) => json.encode(data.toJson());

class HomePageBody {
  HomePageBody({
    required this.locationWidget,
    required this.orderNowButtonWidget,
    required this.dashboardWidget,
  });

  LocationWidget locationWidget;
  OrderNowButtonWidget orderNowButtonWidget;
  DashboardWidget dashboardWidget;

  factory HomePageBody.fromJson(Map<String, dynamic> json) => HomePageBody(
    locationWidget: LocationWidget.fromJson(json["LocationWidget"]),
    orderNowButtonWidget: OrderNowButtonWidget.fromJson(json["OrderNowButtonWidget"]),
    dashboardWidget: DashboardWidget.fromJson(json["DashboardWidget"]),
  );

  Map<String, dynamic> toJson() => {
    "LocationWidget": locationWidget.toJson(),
    "OrderNowButtonWidget": orderNowButtonWidget.toJson(),
    "DashboardWidget": dashboardWidget.toJson(),
  };
}









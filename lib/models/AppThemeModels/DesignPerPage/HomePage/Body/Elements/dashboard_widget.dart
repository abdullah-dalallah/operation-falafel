// To parse this JSON data, do
//
//     final dashboardWidget = dashboardWidgetFromJson(jsonString);

import 'dart:convert';

import 'DashBoarderWidgetElements/buttons.dart';
import 'DashBoarderWidgetElements/header_title.dart';

DashboardWidget dashboardWidgetFromJson(String str) => DashboardWidget.fromJson(json.decode(str));

String dashboardWidgetToJson(DashboardWidget data) => json.encode(data.toJson());

class DashboardWidget {
  DashboardWidget({
    required this.headerTitle,
    required this.buttons,
  });

  HeaderTitle headerTitle;
  Buttons buttons;

  factory DashboardWidget.fromJson(Map<String, dynamic> json) => DashboardWidget(
    headerTitle: HeaderTitle.fromJson(json["HeaderTitle"]),
    buttons: Buttons.fromJson(json["Buttons"]),
  );

  Map<String, dynamic> toJson() => {
    "HeaderTitle": headerTitle.toJson(),
    "Buttons": buttons.toJson(),
  };
}







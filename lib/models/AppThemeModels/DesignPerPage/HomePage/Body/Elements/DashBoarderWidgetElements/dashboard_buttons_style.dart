// To parse this JSON data, do
//
//     final dashboardButtonsStyle = dashboardButtonsStyleFromJson(jsonString);

import 'dart:convert';

DashboardButtonsStyle dashboardButtonsStyleFromJson(String str) => DashboardButtonsStyle.fromJson(json.decode(str));

String dashboardButtonsStyleToJson(DashboardButtonsStyle data) => json.encode(data.toJson());

class DashboardButtonsStyle {
  DashboardButtonsStyle({
    required this.visibility,
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
    required this.data,
    required this.color,
  });

  String visibility;
  String imageIcon;
  String mobileSize;
  String tabletSize;
  String data;
  String color;

  factory DashboardButtonsStyle.fromJson(Map<String, dynamic> json) => DashboardButtonsStyle(
    visibility: json["visibility"],
    imageIcon: json["ImageIcon"],
    mobileSize: json["MobileSize"],
    tabletSize: json["TabletSize"],
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "ImageIcon": imageIcon,
    "MobileSize": mobileSize,
    "TabletSize": tabletSize,
    "Data": data,
    "Color": color,
  };
}

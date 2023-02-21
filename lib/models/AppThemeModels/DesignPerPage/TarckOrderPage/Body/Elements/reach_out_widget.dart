// To parse this JSON data, do
//
//     final reachOutWidget = reachOutWidgetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ReachOutWidget reachOutWidgetFromJson(String str) => ReachOutWidget.fromJson(json.decode(str));

String reachOutWidgetToJson(ReachOutWidget data) => json.encode(data.toJson());

class ReachOutWidget {
  ReachOutWidget({
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

  factory ReachOutWidget.fromJson(Map<String, dynamic> json) => ReachOutWidget(
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

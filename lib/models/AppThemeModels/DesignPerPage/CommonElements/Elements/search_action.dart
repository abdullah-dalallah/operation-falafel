// To parse this JSON data, do
//
//     final searchAction = searchActionFromJson(jsonString);

import 'dart:convert';

SearchAction searchActionFromJson(String str) => SearchAction.fromJson(json.decode(str));

String searchActionToJson(SearchAction data) => json.encode(data.toJson());

class SearchAction {
  SearchAction({
    required this.imageIcon,
    required this.mobileSize,
    required this.tabletSize,
  });

  String imageIcon;
  String mobileSize;
  String tabletSize;

  factory SearchAction.fromJson(Map<String, dynamic> json) => SearchAction(
    imageIcon: json["ImageIcon"],
    mobileSize: json["MobileSize"],
    tabletSize: json["TabletSize"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "MobileSize": mobileSize,
    "TabletSize": tabletSize,
  };
}

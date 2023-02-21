// To parse this JSON data, do
//
//     final searchAction = searchActionFromJson(jsonString);

import 'dart:convert';

SearchAction searchActionFromJson(String str) => SearchAction.fromJson(json.decode(str));

String searchActionToJson(SearchAction data) => json.encode(data.toJson());

class SearchAction {
  SearchAction({
    required this.imageIcon,
    required this.size,
  });

  String imageIcon;
  String size;

  factory SearchAction.fromJson(Map<String, dynamic> json) => SearchAction(
    imageIcon: json["ImageIcon"],
    size: json["Size"],
  );

  Map<String, dynamic> toJson() => {
    "ImageIcon": imageIcon,
    "Size": size,
  };
}

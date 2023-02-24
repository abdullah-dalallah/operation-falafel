// To parse this JSON data, do
//
//     final drawerNotificationBody = drawerNotificationBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';

DrawerNotificationBody drawerNotificationBodyFromJson(String str) => DrawerNotificationBody.fromJson(json.decode(str));

String drawerNotificationBodyToJson(DrawerNotificationBody data) => json.encode(data.toJson());

class DrawerNotificationBody {
  DrawerNotificationBody({
    required this.pageTitle,
    required this.notificationList,
  });

  TitleStyle pageTitle;
  NotificationList notificationList;

  factory DrawerNotificationBody.fromJson(Map<String, dynamic> json) => DrawerNotificationBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    notificationList: NotificationList.fromJson(json["NotificationList"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "NotificationList": notificationList.toJson(),
  };
}

class NotificationList {
  NotificationList({
    required this.title,
    required this.subTitle,
  });

  TitleStyle title;
  TitleStyle subTitle;

  factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
    title: TitleStyle.fromJson(json["Title"]),
    subTitle: TitleStyle.fromJson(json["SubTitle"]),
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "SubTitle": subTitle.toJson(),
  };
}



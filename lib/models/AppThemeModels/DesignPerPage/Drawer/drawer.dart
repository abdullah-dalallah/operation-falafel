// To parse this JSON data, do
//
//     final drawer = drawerFromJson(jsonString);

import 'dart:convert';

import '../CommonElements/Elements/drawer_Icon.dart';
import '../CommonElements/Elements/title_style.dart';

Drawer drawerFromJson(String str) => Drawer.fromJson(json.decode(str));

String drawerToJson(Drawer data) => json.encode(data.toJson());

class Drawer {
  Drawer({
    required this.drawerIcon,
    required this.name,
    required this.home,
    required this.notification,
    required this.partners,
    required this.locations,
    required this.feedback,
    required this.contactUs,
    required this.followUs,
  });

  DrawerIcon drawerIcon;
  TitleStyle name;
  DrawerOptions home;
  DrawerOptions notification;
  DrawerOptions partners;
  DrawerOptions locations;
  DrawerOptions feedback;
  DrawerOptions contactUs;
  DrawerOptions followUs;

  factory Drawer.fromJson(Map<String, dynamic> json) => Drawer(
    drawerIcon: DrawerIcon.fromJson(json["DrawerIcon"]),
    name: TitleStyle.fromJson(json["Name"]),
    home: DrawerOptions.fromJson(json["Home"]),
    notification: DrawerOptions.fromJson(json["Notification"]),
    partners: DrawerOptions.fromJson(json["Partners"]),
    locations: DrawerOptions.fromJson(json["Locations"]),
    feedback: DrawerOptions.fromJson(json["Feedback"]),
    contactUs: DrawerOptions.fromJson(json["ContactUs"]),
    followUs: DrawerOptions.fromJson(json["FollowUs"]),
  );

  Map<String, dynamic> toJson() => {
    "DrawerIcon": drawerIcon.toJson(),
    "Name": name.toJson(),
    "Home": home.toJson(),
    "Notification": notification.toJson(),
    "Partners": partners.toJson(),
    "Locations": locations.toJson(),
    "Feedback": feedback.toJson(),
    "ContactUs": contactUs.toJson(),
    "FollowUs": followUs.toJson(),
  };
}

class DrawerOptions {
  DrawerOptions({
    required this.visibility,
    required this.data,
    required this.color,
  });

  String visibility;
  String data;
  String color;

  factory DrawerOptions.fromJson(Map<String, dynamic> json) => DrawerOptions(
    visibility: json["visibility"],
    data: json["Data"],
    color: json["Color"],
  );

  Map<String, dynamic> toJson() => {
    "visibility": visibility,
    "Data": data,
    "Color": color,
  };
}





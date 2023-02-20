// To parse this JSON data, do
//
//     final bottomNavigationBar = bottomNavigationBarFromJson(jsonString);

import 'dart:convert';

import 'bottom_navigation_bar_button_style.dart';

BottomNavigationBar bottomNavigationBarFromJson(String str) => BottomNavigationBar.fromJson(json.decode(str));

String bottomNavigationBarToJson(BottomNavigationBar data) => json.encode(data.toJson());

class BottomNavigationBar {
  BottomNavigationBar({
    required this.home,
    required this.order,
    required this.cart,
    required this.trackMyOrder,
    required this.profile,
  });

  BottomNavigationBarButtonStyle home;
  BottomNavigationBarButtonStyle order;
  BottomNavigationBarButtonStyle cart;
  BottomNavigationBarButtonStyle trackMyOrder;
  BottomNavigationBarButtonStyle profile;

  factory BottomNavigationBar.fromJson(Map<String, dynamic> json) => BottomNavigationBar(
    home: BottomNavigationBarButtonStyle.fromJson(json["Home"]),
    order: BottomNavigationBarButtonStyle.fromJson(json["Order"]),
    cart: BottomNavigationBarButtonStyle.fromJson(json["BottomNavigationBarButtonStyle"]),
    trackMyOrder: BottomNavigationBarButtonStyle.fromJson(json["TrackMyOrder"]),
    profile: BottomNavigationBarButtonStyle.fromJson(json["Profile"]),
  );

  Map<String, dynamic> toJson() => {
    "Home": home.toJson(),
    "Order": order.toJson(),
    "BottomNavigationBarButtonStyle": cart.toJson(),
    "TrackMyOrder": trackMyOrder.toJson(),
    "Profile": profile.toJson(),
  };
}



// To parse this JSON data, do
//
//     final bottomNavigationBar = bottomNavigationBarFromJson(jsonString);

import 'dart:convert';

import 'bottom_navigation_bar_button_style.dart';

BottomNavigationButtonBar bottomNavigationBarFromJson(String str) => BottomNavigationButtonBar.fromJson(json.decode(str));

String bottomNavigationBarToJson(BottomNavigationButtonBar data) => json.encode(data.toJson());

class BottomNavigationButtonBar {
  BottomNavigationButtonBar({
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

  factory BottomNavigationButtonBar.fromJson(Map<String, dynamic> json) => BottomNavigationButtonBar(
    home: BottomNavigationBarButtonStyle.fromJson(json["Home"]),
    order: BottomNavigationBarButtonStyle.fromJson(json["Order"]),
    cart: BottomNavigationBarButtonStyle.fromJson(json["Cart"]),
    trackMyOrder: BottomNavigationBarButtonStyle.fromJson(json["TrackMyOrder"]),
    profile: BottomNavigationBarButtonStyle.fromJson(json["Profile"]),
  );

  Map<String, dynamic> toJson() => {
    "Home": home.toJson(),
    "Order": order.toJson(),
    "Cart": cart.toJson(),
    "TrackMyOrder": trackMyOrder.toJson(),
    "Profile": profile.toJson(),
  };
}



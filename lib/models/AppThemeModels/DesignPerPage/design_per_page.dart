// To parse this JSON data, do
//
//     final designPerPage = designPerPageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'BottomNavigationBar/bottom_navigation_bar_page.dart';
import 'CartPage/cart_page.dart';
import 'EnterOFWorldPage/enter_of_world_page.dart';
import 'HomePage/home_page.dart';
import 'ItemDetailsSheet/item_details_sheet.dart';
import 'MenuPage/menu_page.dart';
import 'ProfilePage/profile_page.dart';
import 'RegisterPage/register_page.dart';
import 'TarckOrderPage/track_order_page.dart';

DesignPerPage designPerPageFromJson(String str) => DesignPerPage.fromJson(json.decode(str));

String designPerPageToJson(DesignPerPage data) => json.encode(data.toJson());

class DesignPerPage {
  DesignPerPage({
    required this.bottomNavigationBar,
    required this.homePage,
    required this.tarckOrderPage,
    required this.cartPage,
    required this.menuPage,
    required this.itemDetailsSheet,
    required this.profilePage,
    required this.enterOfWorldPage,
    required this.registerPage,
  });

  BottomNavigationBar bottomNavigationBar;
  HomePage homePage;
  TarckOrderPage tarckOrderPage;
  CartPage cartPage;
  MenuPage menuPage;
  ItemDetailsSheet itemDetailsSheet;
  ProfilePage profilePage;
  EnterOfWorldPage enterOfWorldPage;
  RegisterPage registerPage;

  factory DesignPerPage.fromJson(Map<String, dynamic> json) => DesignPerPage(
    bottomNavigationBar: BottomNavigationBar.fromJson(json["BottomNavigationBar"]),
    homePage: HomePage.fromJson(json["HomePage"]),
    tarckOrderPage: TarckOrderPage.fromJson(json["TarckOrderPage"]),
    cartPage: CartPage.fromJson(json["CartPage"]),
    menuPage: MenuPage.fromJson(json["MenuPage"]),
    itemDetailsSheet: ItemDetailsSheet.fromJson(json["ItemDetailsSheet"]),
    profilePage: ProfilePage.fromJson(json["ProfilePage"]),
    enterOfWorldPage: EnterOfWorldPage.fromJson(json["EnterOFWorldPage"]),
    registerPage: RegisterPage.fromJson(json["RegisterPage"]),
  );

  Map<String, dynamic> toJson() => {
    "BottomNavigationBar": bottomNavigationBar.toJson(),
    "HomePage": homePage.toJson(),
    "TarckOrderPage": tarckOrderPage.toJson(),
    "CartPage": cartPage.toJson(),
    "MenuPage": menuPage.toJson(),
    "ItemDetailsSheet": itemDetailsSheet.toJson(),
    "ProfilePage": profilePage.toJson(),
    "EnterOFWorldPage": enterOfWorldPage.toJson(),
    "RegisterPage": registerPage.toJson(),
  };
}


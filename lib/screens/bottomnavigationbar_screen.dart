import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/screens/Tabbar%20Test%20page/Menu%20Tabebar.dart';
import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:operation_falafel/screens/homepage/mainmenu.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Tabs_Screen extends StatefulWidget{
  final String title;
  const Tabs_Screen({super.key, required this.title});

  @override
  State<Tabs_Screen> createState() => _Tabs_ScreenState();
}

class _Tabs_ScreenState extends State<Tabs_Screen> {


  void _changeLanguage (String languageCode) async {
    Locale _temp =await setLocale(languageCode);

    MyApp.setLocale(context,_temp);
  }


  late PersistentTabController _controller;


  @override
  void initState() {

    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        MainMenu(),
        Cart_Screen(),
        TabeBar(),
        TabeBar(),
        TabeBar(),

      ],
      items: [
        PersistentBottomNavBarItem(
          icon: FaIcon(CupertinoIcons.doc_plaintext),
          title: ("Order"),
          textStyle: TextStyle(fontSize: 9),
          activeColorPrimary: CupertinoColors.activeOrange,
          inactiveColorPrimary: CupertinoColors.systemBackground,
        ),
        PersistentBottomNavBarItem(
          textStyle: TextStyle(fontSize: 9),
          icon: Icon(CupertinoIcons.cart),
          title: ("Cart"),
          activeColorPrimary: CupertinoColors.activeOrange,
          inactiveColorPrimary: CupertinoColors.systemBackground,
        ),
        PersistentBottomNavBarItem(

          textStyle: TextStyle(fontSize: 7, ),
          icon: Icon(CupertinoIcons.map_pin_ellipse),
          title: ("Track My\n    Order"),
          activeColorPrimary: CupertinoColors.activeOrange,
          inactiveColorPrimary: CupertinoColors.systemBackground,
        ),
        PersistentBottomNavBarItem(
          textStyle: TextStyle(fontSize: 9),
          icon: Icon(CupertinoIcons.gift),
          title: ("Loyalty"),
          activeColorPrimary: CupertinoColors.activeOrange,
          inactiveColorPrimary: CupertinoColors.systemBackground,
        ),
        PersistentBottomNavBarItem(
          textStyle: TextStyle(fontSize: 9),
          // iconSize: 100,
          icon:Icon(CupertinoIcons.person_alt_circle),
          //Icon(CupertinoIcons.person_alt_circle),
          title: ("Profile"),
          activeColorPrimary: CupertinoColors.activeOrange,
          inactiveColorPrimary: CupertinoColors.systemBackground,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.black, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: false,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style8, // Choose the nav bar style with this property.
    );





  }
}
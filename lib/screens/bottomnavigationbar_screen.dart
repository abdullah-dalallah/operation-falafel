import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/parsistent_tabview_provider.dart';
import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:operation_falafel/screens/homepage/of_homepage.dart';
import 'package:operation_falafel/screens/other_screen.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:operation_falafel/screens/track%20orders/track_my_order.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:badges/badges.dart';

class Tabs_Screen extends StatefulWidget{

  const Tabs_Screen({super.key, });

  @override
  State<Tabs_Screen> createState() => _Tabs_ScreenState();
}

class _Tabs_ScreenState extends State<Tabs_Screen> {


  void _changeLanguage (String languageCode) async {
    Locale _temp =await setLocale(languageCode);
    MyApp.setLocale(context,_temp);
  }


  late PersistentTabController _controller;
  void changePage(index){
    print("changing to index ${index}");
    setState(() {
      _controller.index=index;
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);

  }





  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body:
          Consumer<DemoCartProvider>(
                builder: (context, value, child)
                   {
                     return   PersistentTabView(

                context,
                controller: _controller,
                screens: [
                       MainMenu(layOut: "Mobile",(value) => changePage(value),),
                       TabeBarMenu(layOut: "Mobile",(value) => changePage(value),),
                       Cart_Screen(layOut: "Mobile",(value) => changePage(value),),
                       TrackMyOrder(layOut: "Mobile",(value) => changePage(value),),
                       LoggedInUserProfile(layOut: "Mobile",(value) => changePage(value),),
                ],
                items: [
                  PersistentBottomNavBarItem(
                    textStyle: TextStyle(fontSize: 9),
                    icon: Icon(Icons.home, size:30,),
                    // const ImageIcon(
                    //   AssetImage("assets/images/icon_order.png", ),
                    //   size: 28,
                    // ),
                    title: ("home"),

                    activeColorPrimary:Colors.amber,
                    inactiveColorPrimary: CupertinoColors.systemBackground,
                  ),
                  PersistentBottomNavBarItem(
                    icon: const ImageIcon(
                          size: 28,
                          AssetImage("assets/images/icon_order.png"),
                    ),
                    // Image.asset("assets/images/icon_order.png"),
                    // FaIcon(CupertinoIcons.doc_plaintext),
                    // title: ("Order"),
                    // textStyle: TextStyle(fontSize: 9),
                    activeColorPrimary:Colors.amber,
                    inactiveColorPrimary: CupertinoColors.systemBackground,
                  ),
                  PersistentBottomNavBarItem(
                    textStyle: TextStyle(fontSize: 9),
                    icon: Badge(
                          padding:
                          (Localizations.localeOf(context).languageCode=='ar')? EdgeInsets.only(bottom: 9, left: 7, right: 7, top:7):EdgeInsets.only(bottom: 9, left: 7, right: 7, top:5),
                          badgeContent: Text('${value.cartItems.length}', style: TextStyle(color: (value.cartItems.isNotEmpty)?Colors.white:Colors.transparent,
                              fontFamily: getTranslated(context, "fontFamilyBody")),),
                          badgeColor: (value.cartItems.isNotEmpty)?Colors.red:Colors.transparent,
                          child: ImageIcon(
                            size: 40,
                            AssetImage("assets/images/icon_cart.png"),
                          ),
                    ),

                    activeColorPrimary:Colors.amber,
                    inactiveColorPrimary: CupertinoColors.systemBackground,
                  ),
                  PersistentBottomNavBarItem(

                    textStyle: TextStyle(fontSize: 7, ),
                    icon: ImageIcon(
                          size: 28,
                          AssetImage("assets/images/icon_track.png"),
                    ),

                    activeColorPrimary:Colors.amber,
                    inactiveColorPrimary: CupertinoColors.systemBackground,
                  ),
                  PersistentBottomNavBarItem(
                    textStyle: TextStyle(fontSize: 9),
                    // iconSize: 100,
                    icon:ImageIcon(
                          size: 28,
                          AssetImage("assets/images/icon_profile.png"),
                    ),
                    //Icon(CupertinoIcons.person_alt_circle),
                    // title: ("Profile"),
                    activeColorPrimary: CupertinoColors.activeOrange,
                    inactiveColorPrimary: CupertinoColors.systemBackground,
                  ),
                ],
                hideNavigationBar: isKeyboardVisible,
                confineInSafeArea: true,
                backgroundColor: Colors.black, // Default is Colors.white.
                handleAndroidBackButtonPress: true, // Default is true.
                resizeToAvoidBottomInset: false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true, // Default is true.
                hideNavigationBarWhenKeyboardShows: false, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                decoration: NavBarDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  colorBehindNavBar: Colors.black,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                // padding:  NavBarPadding.all(0),
                // hideNavigationBar: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties:const ItemAnimationProperties( // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation:const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                  animateTabTransition: false,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style8, // Choose the nav bar style with this property.

              );

                   }
    ),

    );

  }
}
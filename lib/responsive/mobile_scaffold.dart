import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/BottomNavigationBar/bottom_navigation_bar_page.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/parsistent_tabview_provider.dart';
import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:operation_falafel/screens/homepage/of_homepage.dart';
import 'package:operation_falafel/screens/other_screen.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/enter_of_world.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:operation_falafel/screens/track%20orders/track_my_order.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:badges/badges.dart' as badges;


import '../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../providers/AppTheme/theme_provider.dart';


class MobileScaffold extends StatefulWidget{
  const MobileScaffold({super.key, });
  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {


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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Consumer<DemoCartProvider>(
        builder: (context, cartProvider, child)
    {
      return Consumer<ThemeProvider>(builder: (context, appTheme, child) {
        Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
        BottomNavigationButtonBar ? bottomNavigationBar = appTheme.appTheme.designPerPage?.bottomNavigationBar;


        List<PersistentBottomNavBarItem> tempTabs = [];
        List<Widget> screens =[];
        if (bottomNavigationBar != null) {
          /// - home
          if (bottomNavigationBar?.home.visibility != 'true') {
            tempTabs.add(PersistentBottomNavBarItem(
              textStyle: const TextStyle(fontSize: 9),
              icon: ImageIcon(
                size: double.parse(
                    bottomNavigationBar?.home.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.home.imageIcon}"),
              ),
              activeColorPrimary: Colors.amber,
              inactiveColorPrimary: CupertinoColors.systemBackground,
            ),);
            screens.add(MainMenu((value) => changePage(value), layOut: "Mobile"),);
          }
          /// - Order
          if (bottomNavigationBar?.order.visibility != 'true'){
            tempTabs.add(PersistentBottomNavBarItem(
              textStyle: const TextStyle(fontSize: 9),
              icon: ImageIcon(
                size: double.parse(bottomNavigationBar?.order.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.order.imageIcon}"),
              ),
              activeColorPrimary: Colors.amber,
              inactiveColorPrimary: CupertinoColors.systemBackground,
            ),);
            screens.add(TabeBarMenu(layOut: "Mobile", (value) => changePage(value),));

          }

          /// - Cart
          if (bottomNavigationBar?.cart.visibility != 'true'){
            tempTabs.add(PersistentBottomNavBarItem(
              textStyle: const TextStyle(fontSize: 9),
              icon: badges.Badge(
                showBadge: (cartProvider.cartItems.isNotEmpty) ? true : false,
                badgeStyle: badges.BadgeStyle(
                  badgeColor: (cartProvider.cartItems.isNotEmpty) ? Colors.red : Colors.transparent,
                  elevation: 0,
                ),
                badgeContent: Text('${cartProvider.cartItems.length}',
                  style: TextStyle(
                      color: (cartProvider.cartItems.isNotEmpty) ? Colors
                          .white : Colors.transparent,
                      fontFamily: getTranslated(
                          context, "fontFamilyBody")),),
                child: ImageIcon(
                  size: double.parse(bottomNavigationBar?.cart.mobileSize as String),
                  NetworkImage("${bottomNavigationBar?.cart.imageIcon}"),
                ),
              ),

              activeColorPrimary: Colors.amber,
              inactiveColorPrimary: CupertinoColors.systemBackground,
            ));
            screens.add(Cart_Screen(layOut: "Mobile", (value) => changePage(value),));
          }


          /// - track Order
          if (bottomNavigationBar?.order.visibility == 'true'){
            tempTabs.add(PersistentBottomNavBarItem(
              textStyle: const TextStyle(fontSize: 9),
              icon: ImageIcon(
                size: double.parse(
                    bottomNavigationBar?.trackMyOrder.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.trackMyOrder.imageIcon}"),
              ),
              activeColorPrimary: Colors.amber,
              inactiveColorPrimary: CupertinoColors.systemBackground,
            ),);
            screens.add(TrackMyOrder(layOut: "Mobile", (value) => changePage(value),));
          }


          /// -Profie
          if (bottomNavigationBar?.order.visibility == 'true'){
            tempTabs.add(PersistentBottomNavBarItem(
              textStyle: const TextStyle(fontSize: 9),
              icon: ImageIcon(
                size: double.parse(
                    bottomNavigationBar?.profile.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.profile.imageIcon}"),
              ),
              activeColorPrimary: Colors.amber,
              inactiveColorPrimary: CupertinoColors.systemBackground,
            ),);
            screens.add( EnterOFWorld(layOut: "Mobile", (value) => changePage(value),));
          }

        }
        else{


          tempTabs.add( PersistentBottomNavBarItem(
            textStyle: const TextStyle(fontSize: 9),
            icon: const ImageIcon(size: 28,
                AssetImage("assets/images/Home - inaactive.png")),
            activeColorPrimary: Colors.amber,
            inactiveColorPrimary: CupertinoColors.systemBackground,
          ));
          screens.add(MainMenu((value) => changePage(value), layOut: "Mobile"),);

          tempTabs.add( PersistentBottomNavBarItem(
                icon: const ImageIcon(
                  size: 28, AssetImage("assets/images/icon_order.png"),),
                activeColorPrimary: Colors.amber,
                inactiveColorPrimary: CupertinoColors.systemBackground,
              ));
          screens.add(TabeBarMenu(layOut: "Mobile", (value) => changePage(value),));

          tempTabs.add(PersistentBottomNavBarItem(
                    textStyle: const TextStyle(fontSize: 9),
                    icon: badges.Badge(

                      showBadge: (cartProvider.cartItems.isNotEmpty)
                          ? true
                          : false,
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: (cartProvider.cartItems.isNotEmpty) ? Colors
                            .red : Colors.transparent,
                        elevation: 0,

                      ),
                      badgeContent: Text('${cartProvider.cartItems.length}',
                        style: TextStyle(
                            color: (cartProvider.cartItems.isNotEmpty) ? Colors
                                .white : Colors.transparent,
                            fontFamily: getTranslated(
                                context, "fontFamilyBody")),),
                      // badgeColor: (value.cartItems.isNotEmpty)?Colors.red:Colors.transparent,
                      child: ImageIcon(
                        size: 40,
                        AssetImage("assets/images/icon_cart.png"),
                      ),
                    ),

                    activeColorPrimary: Colors.amber,
                    inactiveColorPrimary: CupertinoColors.systemBackground,
                  ));
          screens.add(Cart_Screen(layOut: "Mobile", (value) => changePage(value),));

          tempTabs.add(PersistentBottomNavBarItem(

                        textStyle: TextStyle(fontSize: 7,),
                        icon: ImageIcon(
                          size: 28,
                          AssetImage("assets/images/icon_track.png"),
                        ),

                        activeColorPrimary: Colors.amber,
                        inactiveColorPrimary: CupertinoColors.systemBackground,
                      ));
          screens.add(TrackMyOrder(layOut: "Mobile", (value) => changePage(value),));

          tempTabs.add(PersistentBottomNavBarItem(
                            textStyle: TextStyle(fontSize: 9),
                            // iconSize: 100,
                            icon: ImageIcon(
                              size: 28,
                              AssetImage("assets/images/icon_profile.png"),
                            ),
                            //Icon(CupertinoIcons.person_alt_circle),
                            // title: ("Profile"),
                            activeColorPrimary: CupertinoColors.activeOrange,
                            inactiveColorPrimary: CupertinoColors.systemBackground,
                          ));
          screens.add( EnterOFWorld(layOut: "Mobile", (value) => changePage(value),));
        }




        return Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              body: PersistentTabView(
                context,
                controller: _controller,
                screens:screens,
                items:
                tempTabs,
                hideNavigationBar: isKeyboardVisible,
                confineInSafeArea: true,
                backgroundColor: Colors.black,
                // Default is Colors.white.
                handleAndroidBackButtonPress: true,
                // Default is true.
                resizeToAvoidBottomInset: false,
                // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true,
                // Default is true.
                hideNavigationBarWhenKeyboardShows: false,
                // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                decoration: NavBarDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  colorBehindNavBar: Colors.black,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                // padding:  NavBarPadding.all(0),
                // hideNavigationBar: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                  animateTabTransition: false,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle
                    .style8, // Choose the nav bar style with this property.

              ));







      });
    });

  }
}
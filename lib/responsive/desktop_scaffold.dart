import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';

import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:operation_falafel/screens/homepage/of_homepage.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/enter_of_world.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:operation_falafel/screens/track%20orders/track_my_order.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:operation_falafel/widgets/warning_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../models/AppThemeModels/DesignPerPage/BottomNavigationBar/bottom_navigation_bar_page.dart';
import '../providers/AppTheme/theme_provider.dart';
import '../screens/profile/logged_in_user_profile.dart';

class DesktopScaffold extends StatefulWidget{
  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {


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
    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      // Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      BottomNavigationButtonBar ? bottomNavigationBar = appTheme.appTheme.designPerPage?.bottomNavigationBar;

      List<PersistentBottomNavBarItem> tempTabs = [];
      List<Widget> screens =[];

      if (bottomNavigationBar != null) {
        /// - home
        if (bottomNavigationBar?.home.visibility == 'true') {
          tempTabs.add(PersistentBottomNavBarItem(
            textStyle: const TextStyle(fontSize: 9),
            icon: ImageIcon(
              size: double.parse(bottomNavigationBar?.home.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.home.imageIcon}"),
            ),
            activeColorPrimary: Color(int.parse(bottomNavigationBar.home.activeColor )),
            inactiveColorPrimary: Color(int.parse(bottomNavigationBar.home.inactiveColor )),
          ),);
          screens.add( Row(
            children: [
              Expanded(

                  child: DrawerWidget(
                    layOut: "Desktop", onChanged: (value) {
                    changePage(value);
                  },)),
              Expanded(flex: 2,
                  child: MainMenu(
                    layOut: "Desktop", (value) => changePage(value),)),
            ],
          ));
        }
        /// - Order
        if (bottomNavigationBar?.order.visibility == 'true'){
          tempTabs.add(PersistentBottomNavBarItem(
            textStyle: const TextStyle(fontSize: 9),
            icon: ImageIcon(
              size: double.parse(bottomNavigationBar?.order.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.order.imageIcon}"),
            ),
            activeColorPrimary: Color(int.parse(bottomNavigationBar.order.activeColor )),
            inactiveColorPrimary: Color(int.parse(bottomNavigationBar.order.inactiveColor )),
          ),);
          screens.add(Row(
            children: [
              Expanded(

                  child: DrawerWidget(
                    layOut: "Desktop", onChanged: (value) {
                    changePage(value);
                  },)),
              Expanded(flex: 2,
                  child: TabeBarMenu(
                    layOut: "Desktop", (value) => changePage(value),)),
            ],
          ));

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
            activeColorPrimary: Color(int.parse(bottomNavigationBar.trackMyOrder.activeColor )),
            inactiveColorPrimary: Color(int.parse(bottomNavigationBar.trackMyOrder.inactiveColor )),
          ),);
          screens.add(Row(
            children: [
              Expanded(

                  child: DrawerWidget(
                    layOut: "Desktop", onChanged: (value) {
                    changePage(value);
                  },)),
              Expanded(flex: 2,
                  child: TrackMyOrder(
                    layOut: "Desktop", (value) => changePage(value),)),
            ],
          ));
        }


        /// -Profile
        if (bottomNavigationBar?.order.visibility == 'true'){
          tempTabs.add(PersistentBottomNavBarItem(
            textStyle: const TextStyle(fontSize: 9),
            icon: ImageIcon(
              size: double.parse(
                  bottomNavigationBar?.profile.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.profile.imageIcon}"),
            ),
            activeColorPrimary: Color(int.parse(bottomNavigationBar.profile.activeColor )),
            inactiveColorPrimary: Color(int.parse(bottomNavigationBar.profile.inactiveColor )),
          ),);
          screens.add(  Row(
            children: [
              Expanded(

                  child: DrawerWidget(
                    layOut: "Desktop", onChanged: (value) {
                    changePage(value);
                  },)),
              Expanded(flex: 2,
                child: EnterOFWorld(
                  layOut: "Desktop", (value) => changePage(value),),),
            ],
          ));
        }

      }
      else{


        tempTabs.add(  PersistentBottomNavBarItem(
          textStyle: const TextStyle(fontSize: 9),
          icon: const ImageIcon(size: 28,
              AssetImage("assets/images/Home - inaactive.png")),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: CupertinoColors.systemBackground,
        ));
        screens.add( Row(
          children: [
            Expanded(

                child: DrawerWidget(
                  layOut: "Desktop", onChanged: (value) {
                  changePage(value);
                },)),
            Expanded(flex: 2,
                child: MainMenu(
                  layOut: "Desktop", (value) => changePage(value),)),
          ],
        ));

        tempTabs.add(  PersistentBottomNavBarItem(
          icon: const ImageIcon(
            size: 28,
            AssetImage("assets/images/icon_order.png"),
          ),
          // Image.asset("assets/images/icon_order.png"),
          // FaIcon(CupertinoIcons.doc_plaintext),
          // title: ("Order"),
          // textStyle: TextStyle(fontSize: 9),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: CupertinoColors.systemBackground,
        ));
        screens.add(Row(
          children: [
            Expanded(

                child: DrawerWidget(
                  layOut: "Desktop", onChanged: (value) {
                  changePage(value);
                },)),
            Expanded(flex: 2,
                child: TabeBarMenu(
                  layOut: "Desktop", (value) => changePage(value),)),
          ],
        ));



        tempTabs.add(PersistentBottomNavBarItem(

          textStyle: TextStyle(fontSize: 7,),
          icon: ImageIcon(
            size: 28,
            AssetImage("assets/images/icon_track.png"),
          ),

          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: CupertinoColors.systemBackground,
        ));
        screens.add(Row(
          children: [
            Expanded(

                child: DrawerWidget(
                  layOut: "Desktop", onChanged: (value) {
                  changePage(value);
                },)),
            Expanded(flex: 2,
                child: TrackMyOrder(
                  layOut: "Desktop", (value) => changePage(value),)),
          ],
        ));

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
        screens.add(  Row(
          children: [
            Expanded(

                child: DrawerWidget(
                  layOut: "Desktop", onChanged: (value) {
                  changePage(value);
                },)),
            Expanded(flex: 2,
              child: EnterOFWorld(
                layOut: "Desktop", (value) => changePage(value),),),
          ],
        ));
      }

      return
        (tempTabs.length>2)?
        Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body:
        Row(
          children: [
            Expanded(
              flex: 4,
              child: PersistentTabView(

                context,
                controller: _controller,
                screens:screens ,
                items: tempTabs,
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

              ),
            ),
            Expanded(flex: 2, child: Cart_Screen(layOut: "Desktop", (value) {
              changePage(value);
            },)),
          ],
        ),

      )
      : WarningPage();
    });
  }
}
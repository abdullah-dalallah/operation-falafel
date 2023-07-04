import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/data/tab_navigator.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/BottomNavigationBar/bottom_navigation_bar_page.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/parsistent_tabview_provider.dart';
import 'package:operation_falafel/providers/tab_index_generator_provider.dart';
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
import '../providers/AuthProvider/auth_provider.dart';
import '../widgets/warning_page.dart';


class MobileScaffold extends StatefulWidget{
  const MobileScaffold({super.key, });
  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {








  /// - old build
  // void _changeLanguage (String languageCode) async {
  //   Locale _temp =await setLocale(languageCode);
  //   MyApp.setLocale(context,_temp);
  // }
  //
  //
  // late PersistentTabController _controller;
  // void changePage(index){
  //   print("changing to index ${index}");
  //   setState(() {
  //     _controller.index=index;
  //   });
  // }
  // @override
  // Widget build(BuildContext context) {
  //   final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //
  //   return Consumer3<DemoCartProvider,ThemeProvider,AuthProvider>(
  //       builder: (context, cartProvider,appTheme,authProvider, child)
  //   {
  //
  //
  //       // Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
  //       BottomNavigationButtonBar ? bottomNavigationBar = appTheme.appTheme.designPerPage?.bottomNavigationBar;
  //
  //
  //       List<PersistentBottomNavBarItem> tempTabs = [];
  //       List<Widget> screens =[];
  //       if (bottomNavigationBar != null) {
  //         /// - home
  //         if (bottomNavigationBar?.home.visibility == 'true') {
  //           tempTabs.add(PersistentBottomNavBarItem(
  //             textStyle: const TextStyle(fontSize: 9),
  //             icon: ImageIcon(
  //               size: double.parse(bottomNavigationBar?.home.mobileSize as String),
  //               NetworkImage("${bottomNavigationBar?.home.imageIcon}"),
  //             ),
  //             activeColorPrimary: Color(int.parse(bottomNavigationBar.home.activeColor )),
  //             inactiveColorPrimary: Color(int.parse(bottomNavigationBar.home.inactiveColor )),
  //           ),);
  //           screens.add(MainMenu((value) => changePage(value), layOut: "Mobile"),);
  //         }
  //         /// - Order
  //         if (bottomNavigationBar?.order.visibility == 'true'){
  //           tempTabs.add(PersistentBottomNavBarItem(
  //             textStyle: const TextStyle(fontSize: 9),
  //             icon: ImageIcon(
  //               size: double.parse(bottomNavigationBar?.order.mobileSize as String),
  //               NetworkImage("${bottomNavigationBar?.order.imageIcon}"),
  //             ),
  //             activeColorPrimary: Color(int.parse(bottomNavigationBar.order.activeColor )),
  //             inactiveColorPrimary: Color(int.parse(bottomNavigationBar.order.inactiveColor )),
  //           ),);
  //           screens.add(TabeBarMenu(layOut: "Mobile", (value) => changePage(value),));
  //
  //         }
  //
  //         /// - Cart
  //         if (bottomNavigationBar?.cart.visibility == 'true'){
  //           tempTabs.add(PersistentBottomNavBarItem(
  //             textStyle: const TextStyle(fontSize: 9),
  //             icon: badges.Badge(
  //               showBadge: (cartProvider.cartItems.isNotEmpty) ? true : false,
  //               badgeStyle: badges.BadgeStyle(
  //                 badgeColor: (cartProvider.cartItems.isNotEmpty) ? Colors.red : Colors.transparent,
  //                 elevation: 0,
  //               ),
  //               badgeContent: Text('${cartProvider.cartItems.length}',
  //                 style: TextStyle(
  //                     color: (cartProvider.cartItems.isNotEmpty) ? Colors
  //                         .white : Colors.transparent,
  //                     fontFamily: getTranslated(
  //                         context, "fontFamilyBody")),),
  //               child: ImageIcon(
  //                 size: double.parse(bottomNavigationBar?.cart.mobileSize as String),
  //                 NetworkImage("${bottomNavigationBar?.cart.imageIcon}"),
  //               ),
  //             ),
  //
  //             activeColorPrimary: Color(int.parse(bottomNavigationBar.cart.activeColor )),
  //             inactiveColorPrimary: Color(int.parse(bottomNavigationBar.cart.inactiveColor )),
  //           ));
  //           screens.add(Cart_Screen(layOut: "Mobile", (value) => changePage(value),));
  //         }
  //
  //
  //         /// - track Order
  //         if (bottomNavigationBar?.trackMyOrder.visibility == 'true'){
  //           tempTabs.add(PersistentBottomNavBarItem(
  //             textStyle: const TextStyle(fontSize: 9),
  //             icon: ImageIcon(
  //               size: double.parse(
  //                   bottomNavigationBar?.trackMyOrder.mobileSize as String),
  //               NetworkImage("${bottomNavigationBar?.trackMyOrder.imageIcon}"),
  //             ),
  //             activeColorPrimary: Color(int.parse(bottomNavigationBar.trackMyOrder.activeColor )),
  //             inactiveColorPrimary: Color(int.parse(bottomNavigationBar.trackMyOrder.inactiveColor )),
  //           ),);
  //           screens.add(TrackMyOrder(layOut: "Mobile", (value) => changePage(value),));
  //         }
  //
  //
  //         /// -Profile
  //         if (bottomNavigationBar?.profile.visibility == 'true'){
  //
  //           tempTabs.add(PersistentBottomNavBarItem(
  //             textStyle: const TextStyle(fontSize: 9),
  //             icon: ImageIcon(
  //               size: double.parse(
  //                   bottomNavigationBar?.profile.mobileSize as String),
  //               NetworkImage("${bottomNavigationBar?.profile.imageIcon}"),
  //             ),
  //             activeColorPrimary: Color(int.parse(bottomNavigationBar.profile.activeColor )),
  //             inactiveColorPrimary: Color(int.parse(bottomNavigationBar.profile.inactiveColor )),
  //           ),);
  //
  //
  //           if(authProvider.loggedInUser?.token != null ){
  //             screens.add(LoggedInUserProfile(layOut: "Mobile", (value) => changePage(value),));
  //           }
  //           else {
  //             screens.add(EnterOFWorld(layOut: "Mobile", (value) => changePage(value),));
  //           }
  //
  //         }
  //
  //       }
  //       else{
  //
  //
  //         tempTabs.add( PersistentBottomNavBarItem(
  //           textStyle: const TextStyle(fontSize: 9),
  //           icon: const ImageIcon(size: 28,
  //               AssetImage("assets/images/Home - inaactive.png")),
  //           activeColorPrimary: Colors.amber,
  //           inactiveColorPrimary: CupertinoColors.systemBackground,
  //         ));
  //
  //         screens.add(MainMenu((value) => changePage(value), layOut: "Mobile"),);
  //
  //         tempTabs.add( PersistentBottomNavBarItem(
  //               icon: const ImageIcon(
  //                 size: 28, AssetImage("assets/images/icon_order.png"),),
  //               activeColorPrimary: Colors.amber,
  //               inactiveColorPrimary: CupertinoColors.systemBackground,
  //             ));
  //         screens.add(TabeBarMenu(layOut: "Mobile", (value) => changePage(value),));
  //
  //         tempTabs.add(PersistentBottomNavBarItem(
  //                   textStyle: const TextStyle(fontSize: 9),
  //                   icon: badges.Badge(
  //
  //                     showBadge: (cartProvider.cartItems.isNotEmpty)
  //                         ? true
  //                         : false,
  //                     badgeStyle: badges.BadgeStyle(
  //                       badgeColor: (cartProvider.cartItems.isNotEmpty) ? Colors
  //                           .red : Colors.transparent,
  //                       elevation: 0,
  //
  //                     ),
  //                     badgeContent: Text('${cartProvider.cartItems.length}',
  //                       style: TextStyle(
  //                           color: (cartProvider.cartItems.isNotEmpty) ? Colors
  //                               .white : Colors.transparent,
  //                           fontFamily: getTranslated(
  //                               context, "fontFamilyBody")),),
  //                     // badgeColor: (value.cartItems.isNotEmpty)?Colors.red:Colors.transparent,
  //                     child: ImageIcon(
  //                       size: 40,
  //                       AssetImage("assets/images/icon_cart.png"),
  //                     ),
  //                   ),
  //
  //                   activeColorPrimary: Colors.amber,
  //                   inactiveColorPrimary: CupertinoColors.systemBackground,
  //                 ));
  //         screens.add(Cart_Screen(layOut: "Mobile", (value) => changePage(value),));
  //
  //         tempTabs.add(PersistentBottomNavBarItem(
  //
  //                       textStyle: TextStyle(fontSize: 7,),
  //                       icon: ImageIcon(
  //                         size: 28,
  //                         AssetImage("assets/images/icon_track.png"),
  //                       ),
  //
  //                       activeColorPrimary: Colors.amber,
  //                       inactiveColorPrimary: CupertinoColors.systemBackground,
  //                     ));
  //         screens.add(TrackMyOrder(layOut: "Mobile", (value) => changePage(value),));
  //
  //         tempTabs.add(PersistentBottomNavBarItem(
  //                           textStyle: TextStyle(fontSize: 9),
  //                           // iconSize: 100,
  //                           icon: ImageIcon(
  //                             size: 28,
  //                             AssetImage("assets/images/icon_profile.png"),
  //                           ),
  //                           //Icon(CupertinoIcons.person_alt_circle),
  //                           // title: ("Profile"),
  //                           activeColorPrimary: CupertinoColors.activeOrange,
  //                           inactiveColorPrimary: CupertinoColors.systemBackground,
  //                         ));
  //
  //         if(authProvider.loggedInUser?.token != null ){
  //           screens.add(LoggedInUserProfile(layOut: "Mobile", (value) => changePage(value),));
  //         }
  //         else {
  //           screens.add(EnterOFWorld(layOut: "Mobile", (value) => changePage(value),));
  //         }
  //       }
  //
  //
  //       return
  //         (tempTabs.length>2)?
  //         Scaffold(
  //             extendBody: true,
  //             extendBodyBehindAppBar: true,
  //             body: PersistentTabView(
  //               context,
  //               controller: _controller,
  //               screens:screens,
  //               items: tempTabs,
  //               hideNavigationBar: isKeyboardVisible,
  //               confineInSafeArea: true,
  //               backgroundColor: Colors.black,
  //               // Default is Colors.white.
  //               handleAndroidBackButtonPress: true,
  //               // Default is true.
  //               resizeToAvoidBottomInset: false,
  //               // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
  //               stateManagement: true,
  //               // Default is true.
  //               hideNavigationBarWhenKeyboardShows: false,
  //               // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
  //               decoration: NavBarDecoration(
  //                 borderRadius: BorderRadius.circular(0.0),
  //                 colorBehindNavBar: Colors.black,
  //               ),
  //               popAllScreensOnTapOfSelectedTab: true,
  //               // padding:  NavBarPadding.all(0),
  //               // hideNavigationBar: true,
  //               popActionScreens: PopActionScreensType.all,
  //               itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
  //                 duration: Duration(milliseconds: 200),
  //                 curve: Curves.ease,
  //               ),
  //               screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
  //                 animateTabTransition: false,
  //                 curve: Curves.ease,
  //                 duration: Duration(milliseconds: 200),
  //               ),
  //               navBarStyle: NavBarStyle.style8, // Choose the nav bar style with this property.
  //
  //             ))
  //             : WarningPage();
  //
  //
  //   });
  //
  // }
  /// - Old build

  @override
  Widget build(BuildContext context) {




    return

      Consumer4<DemoCartProvider,ThemeProvider,AuthProvider, TabIndexGenerator>(
          builder: (context, cartProvider,appTheme,authProvider,tabIndexGenerator, child)
    {

      // _currentIndex =tabIndexGenerator.currentIndex;
      // _currentPage=pageKeys[_currentIndex];

      // Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      BottomNavigationButtonBar ? bottomNavigationBar = appTheme.appTheme.designPerPage?.bottomNavigationBar;
      List<BottomNavigationBarItem> tabsIcon = [];
      List<Widget> screens =[];
        //bottomNavigationBar != null
      if (bottomNavigationBar != null) {

        /// - home
        if (bottomNavigationBar?.home.visibility == 'true') {
          tabsIcon.add(BottomNavigationBarItem(
            activeIcon:ImageIcon(
              // size: double.parse(bottomNavigationBar?.home.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.home.imageIcon}"),
              color: Color(int.parse(bottomNavigationBar?.home.activeColor as String )),
            ),
            icon: ImageIcon(
              // size: double.parse(bottomNavigationBar?.home.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.home.imageIcon}"),
              color: Color(int.parse(bottomNavigationBar?.home.inactiveColor as String)),
            ),
            label: "MainMenu"
          ),);
          screens.add(_buildOffstageNavigator("MainMenu"));
        }
        /// - Order
        if (bottomNavigationBar?.order.visibility == 'true'){
          tabsIcon.add(BottomNavigationBarItem(
            activeIcon:  ImageIcon(
              // size: double.parse(bottomNavigationBar?.order.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.order.imageIcon}"),
              color: Color(int.parse(bottomNavigationBar?.order.activeColor as String )),
            ),
            icon: ImageIcon(
              // size: double.parse(bottomNavigationBar?.order.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.order.imageIcon}"),
              color: Color(int.parse(bottomNavigationBar?.order.inactiveColor as String)),
            ),
              label: "TabeBarMenu"
          ),);
          screens.add(_buildOffstageNavigator("TabeBarMenu"));

        }

        /// - Cart
        if (bottomNavigationBar?.cart.visibility == 'true'){
          tabsIcon.add(BottomNavigationBarItem(
            activeIcon: badges.Badge(
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
                // size: double.parse(bottomNavigationBar?.cart.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.cart.imageIcon}",),
                color: Color(int.parse(bottomNavigationBar?.cart.activeColor as String )),
              ),
            ),
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
                // size: double.parse(bottomNavigationBar?.cart.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.cart.imageIcon}",),
                color: Color(int.parse(bottomNavigationBar?.cart.inactiveColor as String )),
              ),

            ),
              label: "Cart_Screen"

          ));
          screens.add(_buildOffstageNavigator("Cart_Screen"));
        }


        /// - track Order
        if (bottomNavigationBar?.trackMyOrder.visibility == 'true'){
          tabsIcon.add(BottomNavigationBarItem(
            activeIcon: ImageIcon(
              // size: double.parse(
              //     bottomNavigationBar?.trackMyOrder.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.trackMyOrder.imageIcon}"),
              color: Color(int.parse(bottomNavigationBar?.trackMyOrder.activeColor as String)),
            ),
            icon: ImageIcon(
              // size: double.parse(
              //     bottomNavigationBar?.trackMyOrder.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.trackMyOrder.imageIcon}"),
              color: Color(int.parse(bottomNavigationBar?.trackMyOrder.inactiveColor as String)),
            ),
              label: "TrackMyOrder"
          ),);
          screens.add(_buildOffstageNavigator("TrackMyOrder"));
        }


        /// -Profile
        if (bottomNavigationBar?.profile.visibility == 'true'){

          tabsIcon.add(BottomNavigationBarItem(
         activeIcon: ImageIcon(
           // size: double.parse(
           //     bottomNavigationBar?.profile.mobileSize as String),
           NetworkImage("${bottomNavigationBar?.profile.imageIcon}"),
           color:Color(int.parse(bottomNavigationBar?.profile.activeColor as String)),
         ),
            icon: ImageIcon(
              // size: double.parse(
              //     bottomNavigationBar?.profile.mobileSize as String),
              NetworkImage("${bottomNavigationBar?.profile.imageIcon}"),
              color:Color(int.parse(bottomNavigationBar?.profile.inactiveColor as String)),
            ),
              label: "Profile"
          ),);
          screens.add(_buildOffstageNavigator("Profile"));

          // if(authProvider.loggedInUser?.token != null ){
          //   screens.add(_buildOffstageNavigator("LoggedInUserProfile"));
          // }
          // else {
          //   screens.add(_buildOffstageNavigator("TrackMyOrder"));
          // }

        }

      }
      else{


        tabsIcon.add(const BottomNavigationBarItem(
          activeIcon: ImageIcon(
            // size: 30,
            AssetImage("assets/images/Home - inaactive.png"),
            color: Colors.amber,),
          icon: ImageIcon(
            // size: 30,
            AssetImage("assets/images/Home - inaactive.png"),
            color: CupertinoColors.systemBackground,),
          label: 'MainMenu',

        ));
        screens.add(_buildOffstageNavigator("MainMenu"));

        tabsIcon.add( const BottomNavigationBarItem(
            activeIcon: ImageIcon(
              // size: 30,
              AssetImage("assets/images/icon_order.png"),
              color: Colors.amber,),
            icon: ImageIcon(
              // size: 30,
              AssetImage("assets/images/icon_order.png"),
              color: CupertinoColors.systemBackground,),
            label: 'TabeBarMenu'
        ),);
        screens.add(_buildOffstageNavigator("TabeBarMenu"));

        tabsIcon.add(  BottomNavigationBarItem(
            activeIcon: badges.Badge(
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

                // size: 40,
                AssetImage("assets/images/icon_cart.png"),
                color: Colors.amber,
              ),
            ),
            icon:
            badges.Badge(
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
                // size: 40,
                AssetImage("assets/images/icon_cart.png"),
                color: CupertinoColors.systemBackground,
              ),
            ),
            label: "Cart_Screen"
          // label: 'Profile',
        ),);
        screens.add(_buildOffstageNavigator("Cart_Screen"));

        tabsIcon.add(const BottomNavigationBarItem(
          activeIcon:  ImageIcon(
            // size: 28,
            AssetImage("assets/images/icon_track.png"),
            color: Colors.amber,
          ) ,
          icon: ImageIcon(
            // size: 28,
            AssetImage("assets/images/icon_track.png"),
            color: CupertinoColors.systemBackground,
          ),
          label: 'TrackMyOrder',
        ),);
        screens.add(_buildOffstageNavigator("TrackMyOrder"));

        tabsIcon.add( const BottomNavigationBarItem(
          activeIcon: ImageIcon(
            // size: 28,
            AssetImage("assets/images/icon_profile.png"),
            color:Colors.amber,
          ),
          icon: ImageIcon(
            // size: 28,
            AssetImage("assets/images/icon_profile.png"),
            color:CupertinoColors.systemBackground,
          ),
          label: 'Profile',
        ),);

        // if(authProvider.loggedInUser?.token != null ){
        //
        //   screens.add(_buildOffstageNavigator("LoggedInUserProfile"));
        // }
        // else {
        //   screens.add(_buildOffstageNavigator("EnterOFWorld"));
        // }

        screens.add(_buildOffstageNavigator("Profile"));
      }


      return
        (tabsIcon.length>2)?
        WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
          !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
          if (isFirstRouteInCurrentTab) {
            if (_currentPage != "MainMenu") {
              _selectTab("MainMenu", 1);

              return false;
            }
          }

          /// let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        },
        child: Scaffold(
          body: Stack(children:screens,),
          bottomNavigationBar: BottomNavigationBar(

             iconSize: 40,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            currentIndex: _currentIndex,
            onTap: (index) {_selectTab(pageKeys[index], index);},
            items: tabsIcon
          ),

        ),
      )
            : WarningPage();
    });
  }

  int _currentIndex = 0;
  String _currentPage ='MainMenu';
  List<String> pageKeys = ["MainMenu","TabeBarMenu","Cart_Screen","TrackMyOrder","Profile", ];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys ={
    "MainMenu":GlobalKey<NavigatorState>(),
    "TabeBarMenu":GlobalKey<NavigatorState>(),
    "Cart_Screen":GlobalKey<NavigatorState>(),
    "TrackMyOrder":GlobalKey<NavigatorState>(),
    "Profile":GlobalKey<NavigatorState>(),

  };

  void _selectTab(String tabItem, int index){
    if(tabItem == _currentPage){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    }
    else{
      setState(() {
        // _currentPage = tabItem;
        _currentPage = pageKeys[index];
        _currentIndex = index;
        Provider.of<TabIndexGenerator>(context, listen: false).setIndex(index!);
      });
    }

  }

  Widget _buildOffstageNavigator(String tabItem){
   // print(tabItem);
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
        onChanged: (value) => changePage(value),
        layOut: "Mobile",
      ),
    );
  }


  void changePage(index){
    print("changing to index ${index}");
    // setState(() {
    //   _currentIndex=index;
    // });
    _selectTab(pageKeys[index],  index);
  }



  @override
  void initState() {


    // Provider.of<TabIndexGenerator>(context, listen: false).setLayout("Mobile");
    /// - Old
    // _controller = PersistentTabController(initialIndex: 0);
   /// - Old




  }



}

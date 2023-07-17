import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/BottomNavigationBar/bottom_navigation_bar_page.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/tab_index_generator_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class MobileNavigationBar extends StatelessWidget{
  const MobileNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return

      Consumer4<DemoCartProvider,ThemeProvider,AuthProvider, TabIndexGenerator>(
        builder: (context, cartProvider,appTheme,authProvider,tabIndexGenerator, child)
    {
      // _currentIndex = tabIndexGenerator.currentIndex;
      // _currentPage = pageKeys[_currentIndex];

      // Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      BottomNavigationButtonBar ? bottomNavigationBar = appTheme.appTheme
          .designPerPage?.bottomNavigationBar;
      List<BottomNavigationBarItem> tabsIcon = [];
      List<NavigationDestination> destinationIcons = [];
      List<Widget> screens = [];
      //bottomNavigationBar != null
      if (bottomNavigationBar != null) {

        /// - home
        if (bottomNavigationBar?.home.visibility == 'true') {
          destinationIcons.add(NavigationDestination(
              selectedIcon: ImageIcon(
                size: 45,
                // size: double.parse(bottomNavigationBar?.home.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.home.imageIcon}",),
                color: Color(
                    int.parse(bottomNavigationBar?.home.activeColor as String)),
              ),
              icon: ImageIcon(
                size: 45,
                // size: double.parse(bottomNavigationBar?.home.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.home.imageIcon}"),
                color: Color(int.parse(
                    bottomNavigationBar?.home.inactiveColor as String)),
              ),
              label: "MainMenu"
          ),);

        }

        /// - Order
        if (bottomNavigationBar?.order.visibility == 'true') {
          destinationIcons.add(NavigationDestination(
              selectedIcon: ImageIcon(
                size: 45,
                // size: double.parse(bottomNavigationBar?.order.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.order.imageIcon}"),
                color: Color(int.parse(
                    bottomNavigationBar?.order.activeColor as String)),
              ),
              icon: ImageIcon(
                size: 45,
                // size: double.parse(bottomNavigationBar?.order.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.order.imageIcon}"),
                color: Color(int.parse(
                    bottomNavigationBar?.order.inactiveColor as String)),
              ),
              label: "TabeBarMenu"
          ),);

        }

        /// - Cart
        if (bottomNavigationBar?.cart.visibility == 'true') {
          destinationIcons.add(NavigationDestination(
              selectedIcon: badges.Badge(
                showBadge: (cartProvider.cartItems.isNotEmpty) ? true : false,
                badgeStyle: badges.BadgeStyle(
                  badgeColor: (cartProvider.cartItems.isNotEmpty)
                      ? Colors.red
                      : Colors.transparent,
                  elevation: 0,
                ),
                badgeContent: Text('${cartProvider.cartItems.length}',
                  style: TextStyle(
                      color: (cartProvider.cartItems.isNotEmpty) ? Colors
                          .white : Colors.transparent,
                      fontFamily: getTranslated(
                          context, "fontFamilyBody")),),
                child: ImageIcon(
                  size: 45,
                  // size: double.parse(bottomNavigationBar?.cart.mobileSize as String),
                  NetworkImage("${bottomNavigationBar?.cart.imageIcon}",),
                  color: Color(int.parse(
                      bottomNavigationBar?.cart.activeColor as String)),
                ),
              ),
              icon: badges.Badge(
                showBadge: (cartProvider.cartItems.isNotEmpty) ? true : false,
                badgeStyle: badges.BadgeStyle(
                  badgeColor: (cartProvider.cartItems.isNotEmpty)
                      ? Colors.red
                      : Colors.transparent,
                  elevation: 0,
                ),
                badgeContent: Text('${cartProvider.cartItems.length}',
                  style: TextStyle(
                      color: (cartProvider.cartItems.isNotEmpty) ? Colors
                          .white : Colors.transparent,
                      fontFamily: getTranslated(
                          context, "fontFamilyBody")),),
                child: ImageIcon(
                  size: 45,
                  // size: double.parse(bottomNavigationBar?.cart.mobileSize as String),
                  NetworkImage("${bottomNavigationBar?.cart.imageIcon}",),
                  color: Color(int.parse(
                      bottomNavigationBar?.cart.inactiveColor as String)),
                ),

              ),
              label: "Cart_Screen"

          ));

        }


        /// - track Order
        if (bottomNavigationBar?.trackMyOrder.visibility == 'true') {
          destinationIcons.add(NavigationDestination(
              selectedIcon: ImageIcon(
                size: 45,
                // size: double.parse(
                //     bottomNavigationBar?.trackMyOrder.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.trackMyOrder.imageIcon}"),
                color: Color(int.parse(
                    bottomNavigationBar?.trackMyOrder.activeColor as String)),
              ),
              icon: ImageIcon(
                size: 45,
                // size: double.parse(
                //     bottomNavigationBar?.trackMyOrder.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.trackMyOrder.imageIcon}"),
                color: Color(int.parse(
                    bottomNavigationBar?.trackMyOrder.inactiveColor as String)),
              ),
              label: "TrackMyOrder"
          ),);

        }


        /// -Profile
        if (bottomNavigationBar?.profile.visibility == 'true') {
          destinationIcons.add(NavigationDestination(
              selectedIcon: ImageIcon(
                size: 45,
                // size: double.parse(
                //     bottomNavigationBar?.profile.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.profile.imageIcon}"),
                color: Color(int.parse(
                    bottomNavigationBar?.profile.activeColor as String)),
              ),
              icon: ImageIcon(
                size: 45,
                // size: double.parse(
                //     bottomNavigationBar?.profile.mobileSize as String),
                NetworkImage("${bottomNavigationBar?.profile.imageIcon}"),
                color: Color(int.parse(
                    bottomNavigationBar?.profile.inactiveColor as String)),
              ),
              label: "Profile"
          ),);


        }
      }
      else {
        destinationIcons.add(const NavigationDestination(
          selectedIcon: ImageIcon(
            size: 45,
            AssetImage("assets/images/Home - inaactive.png"),
            color: Colors.amber,),
          icon: ImageIcon(
            size: 45,
            // size: 30,
            AssetImage("assets/images/Home - inaactive.png"),
            color: CupertinoColors.systemBackground,),
          label: 'MainMenu',

        ));


        destinationIcons.add(const NavigationDestination(
            selectedIcon: ImageIcon(
              size: 45,
              // size: 30,
              AssetImage("assets/images/icon_order.png"),
              color: Colors.amber,),
            icon: ImageIcon(
              size: 45,
              // size: 30,
              AssetImage("assets/images/icon_order.png"),
              color: CupertinoColors.systemBackground,),
            label: 'TabeBarMenu'
        ),);


        destinationIcons.add(NavigationDestination(
            selectedIcon: badges.Badge(
              showBadge: (cartProvider.cartItems.isNotEmpty) ? true : false,
              badgeStyle: badges.BadgeStyle(
                badgeColor: (cartProvider.cartItems.isNotEmpty)
                    ? Colors.red
                    : Colors.transparent,
                elevation: 0,
              ),
              badgeContent: Text('${cartProvider.cartItems.length}', style: TextStyle(
                    color: (cartProvider.cartItems.isNotEmpty) ? Colors
                        .white : Colors.transparent,
                    fontFamily: getTranslated(context, "fontFamilyBody")),),
              child: const ImageIcon(
                size: 45,
                // size: 40,
                AssetImage("assets/images/icon_cart.png"),
                color: Colors.amber,
              ),
            ),
            icon:
            badges.Badge(
              showBadge: (cartProvider.cartItems.isNotEmpty) ? true : false,
              badgeStyle: badges.BadgeStyle(
                badgeColor: (cartProvider.cartItems.isNotEmpty)
                    ? Colors.red
                    : Colors.transparent,
                elevation: 0,
              ),
              badgeContent: Text('${cartProvider.cartItems.length}',
                style: TextStyle(
                    color: (cartProvider.cartItems.isNotEmpty) ? Colors
                        .white : Colors.transparent,
                    fontFamily: getTranslated(
                        context, "fontFamilyBody")),),
              child: ImageIcon(
                size: 45,
                // size: 40,
                AssetImage("assets/images/icon_cart.png"),
                color: CupertinoColors.systemBackground,
              ),
            ),
            label: "Cart_Screen"
          // label: 'Profile',
        ),);


        destinationIcons.add(const NavigationDestination(
          selectedIcon: ImageIcon(
            size: 45,
            // size: 28,
            AssetImage("assets/images/icon_track.png"),
            color: Colors.amber,
          ),
          icon: ImageIcon(
            size: 45,
            // size: 28,
            AssetImage("assets/images/icon_track.png"),
            color: CupertinoColors.systemBackground,
          ),
          label: 'TrackMyOrder',
        ),);


        destinationIcons.add(const NavigationDestination(
          selectedIcon: ImageIcon(
            size: 45,
            // size: 28,
            AssetImage("assets/images/icon_profile.png"),
            color: Colors.amber,
          ),
          icon: ImageIcon(
            size: 45,
            // size: 28,
            AssetImage("assets/images/icon_profile.png"),
            color: CupertinoColors.systemBackground,
          ),
          label: 'Profile',
        ),);



      }


        return  Scaffold(
        body: body,
        bottomNavigationBar: NavigationBar(
          // height: 50,
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Colors.black,
          selectedIndex: selectedIndex,
          destinations: destinationIcons,
          onDestinationSelected: onDestinationSelected,
        ),
      );
    });
  }
}
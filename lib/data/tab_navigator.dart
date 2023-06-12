import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:operation_falafel/screens/homepage/of_homepage.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/enter_of_world.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:operation_falafel/screens/track%20orders/track_my_order.dart';

class TabNavigator extends StatelessWidget{
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  final ValueChanged onChanged;
  final String layOut ;

  const TabNavigator({ Key? key,required this.onChanged,required this.layOut, required this.navigatorKey, required this.tabItem}):super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if(tabItem == "MainMenu")
      child = MainMenu((value) => onChanged(value), layOut: layOut);
    else if(tabItem == "TabeBarMenu")
      child = TabeBarMenu(layOut: "Mobile", (value) => onChanged(value),);
    else if (tabItem == "Cart_Screen")
      child = Cart_Screen(layOut: "Mobile", (value) => onChanged(value),);
    else if (tabItem == "TrackMyOrder")
      child = TrackMyOrder(layOut: "Mobile", (value) => onChanged(value),);
    else if (tabItem == "LoggedInUserProfile")
      child = LoggedInUserProfile(layOut: "Mobile", (value) => onChanged(value),);
    // else if (tabItem == "EnterOFWorld")
    //   child = EnterOFWorld(layOut: "Mobile", (value) => onChanged(value),);




    return Navigator(
      key:  navigatorKey,
      onGenerateRoute: (routeSettings){
        return MaterialPageRoute(builder: (context)=> child!);
      },
    );
  }

}
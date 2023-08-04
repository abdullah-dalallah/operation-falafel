// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:operation_falafel/responsive/go_route/mobile_navigation_bar.dart';
import 'package:operation_falafel/responsive/go_route/tablet_navigation_bar.dart';
import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:operation_falafel/screens/drawer_pages/contact_us.dart';
import 'package:operation_falafel/screens/drawer_pages/feedback.dart';
import 'package:operation_falafel/screens/drawer_pages/locations.dart';
import 'package:operation_falafel/screens/drawer_pages/notifications.dart';
import 'package:operation_falafel/screens/drawer_pages/partners.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_friend.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/screens/profile/profile_pages/add_new_card.dart';
import 'package:operation_falafel/screens/profile/profile_pages/help_page.dart';
import 'package:operation_falafel/screens/profile/profile_pages/order_details.dart';
import 'package:operation_falafel/screens/profile/profile_pages/order_history.dart';
import 'package:operation_falafel/screens/profile/profile_pages/saved_address.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/enter_of_world.dart';
import 'package:operation_falafel/screens/track%20orders/track_my_order.dart';

import '../../providers/AppTheme/theme_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/providers/home_page_provider/home_page_provider.dart';
import 'package:operation_falafel/providers/settings_provider/setting_provider.dart';
import 'package:operation_falafel/providers/tab_index_generator_provider.dart';
import 'package:provider/provider.dart';


import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';

import '../../providers/gifts_provider/models/gift.dart';
import '../../screens/my rewards page/my_rewards.dart';
import '../../screens/my rewards page/rewards_pages/buy_gift.dart';
import '../../screens/my rewards page/rewards_pages/credit_calculator.dart';
import '../../screens/my rewards page/rewards_pages/gift_details.dart';
import '../../screens/my rewards page/rewards_pages/how_it_works.dart';
import '../../screens/my rewards page/rewards_pages/my_gifts.dart';
import '../../screens/my rewards page/rewards_pages/my_gifts_list.dart';
import '../../screens/my rewards page/rewards_pages/rewards_histoy.dart';
import '../../screens/my rewards page/rewards_pages/transfer_credits.dart';
import '../../screens/profile/profile_pages/add_new_address.dart';
import '../../screens/profile/profile_pages/saved_cards.dart';
import '../../screens/profile/profile_pages/update_address.dart';
import '../../widgets/Map/map_page.dart';
import 'desktop_navigation_bar.dart';



class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
      key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNavigation> createState() => _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState extends State<ScaffoldWithNestedNavigation> {

   List<StatefulShellBranch> tempBranches=<StatefulShellBranch>[];
  late StatefulNavigationShell tempStatefulNavigationShell;
  void _goBranch(int index ) {

    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,

    );
  }

  void removeDestination(index) {

      tempBranches.clear();
      tempBranches.addAll(widget.navigationShell.route.branches);
      if(widget.navigationShell.route.branches.length==5)
        {
          // widget.navigationShell.;
          widget.navigationShell.route.branches.removeAt(index);
          // print(widget.navigationShell.route.branches.length);
          widget.navigationShell.route.branches.forEach((element) {
            print(element.navigatorKey);
          });
          // print(widget.navigationShell.route.parentNavigatorKey);
        }


  }

  void addDestination(index) {


    // print(widget.navigationShell.route.branches.length);
    // print(tempBranches.length);
    if(widget.navigationShell.route.branches.length==4){

       widget.navigationShell.route.branches.replaceRange(0, 4, tempBranches.getRange(0, 4));
       widget.navigationShell.route.branches.add(tempBranches.last);


   }
    widget.navigationShell.route.branches.forEach((element) {
      print(element.navigatorKey);
    });


  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth<500) {
        return MobileNavigationBar(
          body: widget.navigationShell,
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      }
      else if(constraints.maxWidth <1100)
      {

        print(widget.navigationShell.currentIndex);
        return TabletNavigationBar(
          body: widget.navigationShell,
          selectedIndex:

          widget.navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
           onTabletLayOutSelected: addDestination,

        );
      }
      else
      {

     print("land scape selected index: ${widget.navigationShell.currentIndex-1}");
        return DesktopNavigationBar(
          body: widget.navigationShell,
          selectedIndex:
          widget.navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
          onDesktopLayOutSelected: removeDestination,
        );
      }
    });
  }


  @override
  void initState() {
    super.initState();

    startApp();
  }


  void _changeLanguage (String languageCode) async {
    Locale _temp =await setLocale(languageCode);

    MyApp.setLocale(context,_temp);

  }


  void startApp()async{

    Future.wait([
      // Provider.of<ThemeProvider>(context,listen: false).readJson().then((value) {FlutterNativeSplash.remove();})
      Provider.of<ThemeProvider>(context,listen: false).getAppTheme("appTitle", "operation falafel", "12", "1", "uae", "en").then((response) {
        if(response.statusCode==200 && response.data[Keys.bodyKey]!=null){
          // print(response.data[Keys.bodyKey][0][Keys.languageKey]);

          if(response.data[Keys.bodyKey][Keys.languageKey]!=null){
            _changeLanguage(Provider.of<ThemeProvider>(context,listen: false).appTheme.language!);

          }

        }
        else{
          print("Online Theme not found!");
          Provider.of<ThemeProvider>(context,listen: false).getSavedAppThemeLocally().then((appTheme) {
            // print(appTheme);

            if(appTheme.id!=null){
              if(appTheme.language!=null){
                _changeLanguage(Provider.of<ThemeProvider>(context,listen: false).appTheme.language!);

              }
            }
            else{
              print("Shared Preferences Theme not Found!");
              Provider.of<ThemeProvider>(context,listen: false).readJson().then((appTheme) {
                if(appTheme.language!=null){
                  _changeLanguage(Provider.of<ThemeProvider>(context,listen: false).appTheme.language!);
                }
                FlutterNativeSplash.remove();
              });
            }
          });
        }
        FlutterNativeSplash.remove();
      }),
      Provider.of<HomePageProvider>(context, listen: false).getSocialMediaItems(),
      Provider.of<SettingProvider>(context, listen: false).getLanguages(),
      Provider.of<AuthProvider>(context, listen: false).getSavedUserDetailsLocally().then((loggedInUser) {
        if(loggedInUser !=null){

          String userToken =  loggedInUser.token!;

          print(loggedInUser.token!);
          if(compareTimestampWithCurrentDate(loggedInUser.expiredAt!)=="Expired"){
            print("start refreshing token");
            Provider.of<AuthProvider>(context, listen: false).refreshUserToken(userToken: userToken).then((res)  {
              String email =  Provider.of<AuthProvider>(context, listen: false).email!;
              String password =  Provider.of<AuthProvider>(context, listen: false).password!;
              String userToken =  Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
              Provider.of<ProfileProvider>(context,listen: false).getUserInfo(userToken,);
              Provider.of<ProfileProvider>(context,listen: false).getUserSavedAddress(userToken);
            });
          }
          else{
            String email =  Provider.of<AuthProvider>(context, listen: false).email!;
            String password =  Provider.of<AuthProvider>(context, listen: false).password!;
            Provider.of<ProfileProvider>(context,listen: false).getUserInfo(loggedInUser.token!, );

            Provider.of<ProfileProvider>(context,listen: false).getUserSavedAddress(loggedInUser.token!);
          }

        }
        else{
          print("no users found!");
        }
      }),

    ]).then((results) {




    });
  }

  String timestampToDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  String compareTimestampWithCurrentDate(int timestamp) {
    var convertedDate = timestampToDate(timestamp);
    var currentDate = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    var formattedCurrentDate = formatter.format(currentDate);

    if (convertedDate == formattedCurrentDate) {
      print('Timestamp is equal to the current date');
      return "Valid";
    } else if (convertedDate.compareTo(formattedCurrentDate) < 0) {
      print('Timestamp is before the current date');
      return "Expired";
    } else {
      print('Timestamp is after the current date');
      return "Valid";
    }
  }


}
import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/localization/demo_localization.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/AddNewCardPage/add_new_card_page.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/providers/contact_provider.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/models/gift.dart';
import 'package:operation_falafel/providers/home_page_provider/home_page_provider.dart';
import 'package:operation_falafel/providers/parsistent_tabview_provider.dart';
import 'package:operation_falafel/providers/settings_provider/setting_provider.dart';
import 'package:operation_falafel/providers/slider_provider.dart';
import 'package:operation_falafel/providers/tab_index_generator_provider.dart';
import 'package:operation_falafel/responsive/desktop_scaffold.dart';
import 'package:operation_falafel/responsive/go_route/scaffold_with_nested_navigation.dart';
import 'package:operation_falafel/responsive/mobile_scaffold.dart';
import 'package:operation_falafel/responsive/responsive_layout.dart';
import 'package:operation_falafel/responsive/tablet_scaffold.dart';
import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:operation_falafel/screens/drawer_pages/contact_us.dart';
import 'package:operation_falafel/screens/drawer_pages/feedback.dart';
import 'package:operation_falafel/screens/drawer_pages/locations.dart';
import 'package:operation_falafel/screens/drawer_pages/partners.dart';
import 'package:operation_falafel/screens/homepage/of_homepage.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/my_rewards.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/buy_gift.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/credit_calculator.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_details.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_friend.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/how_it_works.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/my_gifts.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/my_gifts_list.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/rewards_histoy.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/transfer_credits.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/screens/profile/profile_pages/add_new_address.dart';
import 'package:operation_falafel/screens/profile/profile_pages/add_new_card.dart';
import 'package:operation_falafel/screens/profile/profile_pages/help_page.dart';
import 'package:operation_falafel/screens/profile/profile_pages/order_details.dart';
import 'package:operation_falafel/screens/profile/profile_pages/order_history.dart';
import 'package:operation_falafel/screens/profile/profile_pages/saved_address.dart';
import 'package:operation_falafel/screens/profile/profile_pages/update_address.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/enter_of_world.dart';
import 'package:operation_falafel/screens/rest%20password/forget_your_password.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:operation_falafel/screens/track%20orders/track_my_order.dart';
import 'package:operation_falafel/widgets/Map/map_page.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:operation_falafel/widgets/network_error_page.dart';
import 'package:operation_falafel/widgets/warning_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:window_manager/window_manager.dart';

import 'screens/drawer_pages/notifications.dart';
import 'screens/profile/profile_pages/saved_cards.dart';
import 'widgets/deep_link_handler.dart';


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellE');
final _shellNavigatorFKey = GlobalKey<NavigatorState>(debugLabel: 'shellF');

 GoRouter goRouter = GoRouter(

  initialLocation: '/homePage',
  // * Passing a navigatorKey causes an issue on hot reload:
  // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
  // * However it's still necessary otherwise the navigator pops back to
  // * root on hot reload
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    // Stateful navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {

        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        /// - Home
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: "${MainMenu.routeName}",
              builder: (context, state) {

              return  MainMenu(
                    layOut: "",(value) {}
                );
              },

              routes: [
                /// - Drawer
                /// - Locations
                GoRoute(
                  path: '${Locations.routeName}',
                  builder: (context, state) =>  Locations(),

                ),
                /// - Notification
                GoRoute(
                  path: '${Notifications.routeName}',
                  builder: (context, state) =>  Notifications(),
                ),
                /// - Partner
                GoRoute(
                  path: '${Partners.routeName}',
                  builder: (context, state) =>  Partners(),
                ),
                /// - FeedBack
                GoRoute(
                  path: '${FeedbackPage.routeName}',
                  builder: (context, state) =>  FeedbackPage(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Contact us
                GoRoute(
                  path: '${ContactUs.routeName}',
                  builder: (context, state) =>  ContactUs(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Drawer

                /// - Dash Bord -> Transfer credit
                GoRoute(
                  path: '${TransferCredit.routeName}',
                  builder: (context, state) =>  TransferCredit(),

                ),


              ],
            ),
          ],
        ),
        /// - Menu
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [

            GoRoute(
              path: '${TabeBarMenu.routeName}',
              builder:(context, state) =>  TabeBarMenu(layOut: "",(value) {}),

              routes: [

                /// - Drawer
                /// - Locations
                GoRoute(
                  path: '${Locations.routeName}',
                  builder: (context, state) =>  Locations(),

                ),
                /// - Notification
                GoRoute(
                  path: '${Notifications.routeName}',
                  builder: (context, state) =>  Notifications(),
                ),
                /// - Partner
                GoRoute(
                  path: '${Partners.routeName}',
                  builder: (context, state) =>  Partners(),
                ),
                /// - FeedBack
                GoRoute(
                  path: '${FeedbackPage.routeName}',
                  builder: (context, state) =>  FeedbackPage(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Contact us
                GoRoute(
                  path: '${ContactUs.routeName}',
                  builder: (context, state) =>  ContactUs(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Drawer

              ],
            ),



          ],
        ),
        /// -Cart
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [

            GoRoute(
              path: '/CartScreen',
              builder:(context, state) =>  Cart_Screen(layOut: "",(value) {

              }),

              routes: [
                /// - Drawer
                /// - Locations
                GoRoute(
                  path: '${Locations.routeName}',
                  builder: (context, state) =>  Locations(),

                ),
                /// - Notification
                GoRoute(
                  path: '${Notifications.routeName}',
                  builder: (context, state) =>  Notifications(),
                ),
                /// - Partner
                GoRoute(
                  path: '${Partners.routeName}',
                  builder: (context, state) =>  Partners(),
                ),
                /// - FeedBack
                GoRoute(
                  path: '${FeedbackPage.routeName}',
                  builder: (context, state) =>  FeedbackPage(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Contact us
                GoRoute(
                  path: '${ContactUs.routeName}',
                  builder: (context, state) =>  ContactUs(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Drawer
              ],
            ),
          ],
        ),
        /// - Track order
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [

            GoRoute(
              path: '/TrackMyOrder',
              builder:(context, state) =>  TrackMyOrder(layOut: "",(value) {

              }),

              routes: [
                /// - Drawer
                /// - Locations
                GoRoute(
                  path: '${Locations.routeName}',
                  builder: (context, state) =>  Locations(),

                ),
                /// - Notification
                GoRoute(
                  path: '${Notifications.routeName}',
                  builder: (context, state) =>  Notifications(),
                ),
                /// - Partner
                GoRoute(
                  path: '${Partners.routeName}',
                  builder: (context, state) =>  Partners(),
                ),
                /// - FeedBack
                GoRoute(
                  path: '${FeedbackPage.routeName}',
                  builder: (context, state) =>  FeedbackPage(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Contact us
                GoRoute(
                  path: '${ContactUs.routeName}',
                  builder: (context, state) =>  ContactUs(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Drawer
              ],
            ),
          ],
        ),
        /// - Profile
        StatefulShellBranch(
          navigatorKey: _shellNavigatorEKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/Profile',
              builder:(context, state) {
                return
                  Consumer<AuthProvider>(
                      builder: (context, authProvider, child)
                      {

                        if(authProvider.loggedInUser != null ){
                          return KeyboardVisibilityProvider(child: LoggedInUserProfile(layOut: "", (value) => {},));
                        }else{
                          return EnterOFWorld(layOut: "", (value) => {},);
                        }



                      });


              }  ,

              routes: [
                /// - Drawer
                /// - Locations
                GoRoute(
                  path: '${Locations.routeName}',
                  builder: (context, state) =>  Locations(),

                ),
                /// - Notification
                GoRoute(
                  path: '${Notifications.routeName}',
                  builder: (context, state) =>  Notifications(),
                ),
                /// - Partner
                GoRoute(
                  path: '${Partners.routeName}',
                  builder: (context, state) =>  Partners(),
                ),
                /// - FeedBack
                GoRoute(
                  path: '${FeedbackPage.routeName}',
                  builder: (context, state) =>  FeedbackPage(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Contact us
                GoRoute(
                  path: '${ContactUs.routeName}',
                  builder: (context, state) =>  ContactUs(
                    layOut: "",(value) => {},
                  ),
                ),
                /// - Drawer

                /// - My Rewards
                GoRoute(
                    path: MyRewards.routeName,
                    builder: (context, state) =>  const KeyboardVisibilityProvider(
                      child: MyRewards(
                        layOut: "",
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: '${TransferCredit.routeName}',
                        builder: (context, state) =>  TransferCredit(),

                      ),
                      GoRoute(
                        path: '${HowItWorks.routeName}',
                        builder: (context, state) =>  HowItWorks(),

                      ),
                      GoRoute(
                        path: '${CreditCalculator.routeName}',
                        builder: (context, state) =>  CreditCalculator(),

                      ),
                      GoRoute(
                        path: '${RewardsHistory.routeName}',
                        builder: (context, state) =>  RewardsHistory(),

                      ),
                      GoRoute(
                          path: '${MyGifts.routeName}',
                          builder: (context, state) =>  MyGifts(),
                          routes: [
                            GoRoute(
                                path: '${MyGiftsList.routeName}',
                                builder: (context, state) =>  MyGiftsList(),
                                routes: [
                                  GoRoute(
                                      name: '${GiftDetails.routeName}',
                                      path: '${GiftDetails.routeName}',
                                      builder: (context, state) {
                                        // final Gift? myObject = state.extra as Gift?;
                                        final Gift? myObject =Gift.fromJson(state.extra as Map<String, dynamic>)  ;
                                        return  GiftDetails(giftDetails: myObject);
                                      },
                                      routes: [
                                        GoRoute(
                                          path: '${GiftFriend.routeName}',
                                          builder: (context, state) =>  GiftFriend(),

                                        ),
                                      ]

                                  ),
                                ]
                            ),
                            GoRoute(
                              path: '${BuyGift.routeName}',
                              builder: (context, state) =>  BuyGift(),

                            ),


                          ]
                      ),


                    ]
                ),


                /// - Saved Address
                GoRoute(
                  path: '${SavedAddress.routeName}',
                  builder: (context, state) =>  SavedAddress(),
                  routes: [
                    GoRoute(
                      path: '${AddNewAddress.routeName}',
                      builder: (context, state) =>  AddNewAddress(),
                      routes: [
                        GoRoute(
                          path: '${MapPage.routeName}',
                          builder: (context, state) =>  MapPage(
                              onAddressSelected: (value) {},
                              onLocationSelected: (value) {},
                          ),
                        ),
                      ]
                    ),
                    GoRoute(
                      path: '${UpdateAddress.routeName}',
                      builder: (context, state) =>  UpdateAddress(),
                    ),
                  ]
                ),
                ///  - Order History
                GoRoute(
                  path: '${OrderHistory.routeName}',
                  builder: (context, state) =>  OrderHistory(),
                  routes: [
                    GoRoute(
                      path: '${OrderDetails.routeName}',
                      builder: (context, state) =>  OrderDetails(),
                    ),
                  ]
                ),
                ///  - Saved Cards
                GoRoute(
                  path: '${SavedCards.routeName}',
                  builder: (context, state) =>  SavedCards(),
                  routes: [
                    GoRoute(
                      path: '${AddNewCard.routeName}',
                      builder: (context, state) =>  AddNewCard(),
                    ),
                  ]
                ),
                ///  - Help
                GoRoute(
                  path: '${HelpPage.routeName}',
                  builder: (context, state) =>  HelpPage(),
                ),


              ],
            ),
          ],
        )




      ],
    ),
  ],
);





Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
///
  // // Must add this line.
  // await windowManager.ensureInitialized();
  //
  // WindowOptions windowOptions = WindowOptions(
  //   minimumSize: Size(400, 600),
  //
  //   center: true,
  //   backgroundColor: Colors.transparent,
  //   // skipTaskbar: false,
  //   skipTaskbar: true,
  //   titleBarStyle: TitleBarStyle.normal,
  // );
  // windowManager.waitUntilReadyToShow(windowOptions, () async {
  //   await windowManager.show();
  //   await windowManager.focus();
  // });

// turn off the # in the URLs on the web




  usePathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale locale){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);



  }


  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  Locale? _locale;
  void setLocale(Locale locale){
    print(" language changed ${locale}");
    setState(() {
      _locale = locale;
    });
    print(_locale);
  }


  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale= locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    if (_locale==null ){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    else{
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PersistentTabviewProvider()),
          ChangeNotifierProvider(create: (context) => DemoCartProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => ProfileProvider()),
          ChangeNotifierProvider(create: (context) => ContactProvider()),
          ChangeNotifierProvider(create: (context) => HomePageProvider()),
          ChangeNotifierProvider(create: (context) => SettingProvider()),
          ChangeNotifierProvider(create: (context) => LoyaltyProvider()),
          ChangeNotifierProvider(create: (context) => TabIndexGenerator()),
          ChangeNotifierProvider(create: (context) => SliderProvider()),


        ],
        child: MaterialApp(
         // routes: {
         //   ResetYourPassword.routeName: (ctx) =>  ResetYourPassword(),
         //
         //   // '/': (context) =>  KeyboardVisibilityProvider(child: ResponsiveLayout(DesktopScaffold: DesktopScaffold(),MobileScaffold: MobileScaffold(),TabletScaffold: TabletScaffold(), ),),
         // },
          debugShowCheckedModeBanner: false,
          locale:  _locale,
          supportedLocales: const [
            Locale('ar','SA'),
            Locale('en','US'),

          ],
          localizationsDelegates: const [
            DemoLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,

          ],
          localeResolutionCallback: (deviceLocale, supportedLocales){
            for(var locale in supportedLocales){
              if(locale.languageCode == deviceLocale!.languageCode && locale.languageCode == deviceLocale!.countryCode){
                return deviceLocale;
              }
            }
            return deviceLocale;
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.transparent, // Set the background color to transparent
            ),
            primarySwatch: Colors.blue,
          ),
          // routerConfig: goRouter,
          // routerConfig: _appRoute,

          home:
          (_connectionStatus.name=="none")?
          NetworkErrorPage()
          : KeyboardVisibilityProvider(child: ResponsiveLayout(DesktopScaffold: DesktopScaffold(),MobileScaffold: MobileScaffold(),TabletScaffold: TabletScaffold(), ),),
          ),
      );
    }

  }

  @override
  void initState() {

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

  }

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  Future<void> _updateConnectionStatus(ConnectivityResult result,) async {

    setState(() {
      _connectionStatus = ConnectivityResult.none;
    });
    if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {

    } else {
      print("no net");
      SnackbarGenerator(context).snackBarGeneratorToast("Please check your internet connectivity!");
    }
    print("NetWork Check...${result}");
    setState(() {
      _connectionStatus = result;

    });
  }


}













class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  void _changeLanguage (String languageCode) async {
    Locale _temp =await setLocale(languageCode);

    MyApp.setLocale(context,_temp);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(getTranslated(context, "Main_Text")!,),
            // Text(getTranslated(context, "Main_Text")!, style: Theme.of(context).textTheme.headline4,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
            _changeLanguage("ar");

            },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

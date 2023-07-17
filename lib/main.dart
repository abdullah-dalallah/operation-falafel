import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/localization/demo_localization.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/providers/contact_provider.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/providers/home_page_provider/home_page_provider.dart';
import 'package:operation_falafel/providers/parsistent_tabview_provider.dart';
import 'package:operation_falafel/providers/settings_provider/setting_provider.dart';
import 'package:operation_falafel/providers/tab_index_generator_provider.dart';
import 'package:operation_falafel/responsive/desktop_scaffold.dart';
import 'package:operation_falafel/responsive/go_route/scaffold_with_nested_navigation.dart';
import 'package:operation_falafel/responsive/mobile_scaffold.dart';
import 'package:operation_falafel/responsive/responsive_layout.dart';
import 'package:operation_falafel/responsive/tablet_scaffold.dart';
import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:operation_falafel/screens/drawer_pages/locations.dart';
import 'package:operation_falafel/screens/homepage/of_homepage.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/enter_of_world.dart';
import 'package:operation_falafel/screens/rest%20password/forget_your_password.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:operation_falafel/screens/track%20orders/track_my_order.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:ui' as ui;
import 'package:window_manager/window_manager.dart';

import 'widgets/deep_link_handler.dart';


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final goRouter = GoRouter(
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
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: MainMenu.routeName,
              builder: (context, state) =>  MainMenu(
                  layOut: '',(value) {}
              ),

              routes: [
                GoRoute(
                  path: 'locations',
                  builder: (context, state) =>  Locations(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/TabeBarMenu',
              builder:(context, state) =>  TabeBarMenu(layOut: "",(value) {

                }),

              routes: [
                GoRoute(
                  path: 'locations',
                  builder: (context, state) =>  Locations(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/CartScreen',
              builder:(context, state) =>  Cart_Screen(layOut: "",(value) {

              }),

              routes: [
                GoRoute(
                  path: 'locations',
                  builder: (context, state) =>  Locations(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/TrackMyOrder',
              builder:(context, state) =>  TrackMyOrder(layOut: "",(value) {

              }),

              routes: [
                GoRoute(
                  path: 'locations',
                  builder: (context, state) =>  Locations(),
                ),
              ],
            ),
          ],
        ),


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
                GoRoute(
                  path: 'locations',
                  builder: (context, state) =>  Locations(),
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


        ],
        child: MaterialApp.router(
         // routes: {
         //   ResetYourPassword.routeName: (ctx) =>  ResetYourPassword(),
         //   "/details":(ctx)=> Locations(),
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
          routerConfig: goRouter,
          // routerConfig: _appRoute,

          // home:
          //DeepLinkHandlerWidget(),

            // KeyboardVisibilityProvider(child: ResponsiveLayout(DesktopScaffold: DesktopScaffold(),MobileScaffold: MobileScaffold(),TabletScaffold: TabletScaffold(), ),

            // const Tabs_Screen()
            // ),
          ),
      );
    }

  }



 final GoRouter _appRoute = GoRouter(

   routes: <RouteBase>[
     GoRoute(

         path: '/',
         builder: (BuildContext context, GoRouterState state){
           return KeyboardVisibilityProvider(child: ResponsiveLayout(DesktopScaffold: DesktopScaffold(),MobileScaffold: MobileScaffold(),TabletScaffold: TabletScaffold(), ),);
         }
     ),
     GoRoute(

         path: '/MainMenu',
         builder: (BuildContext context, GoRouterState state){
           return MainMenu(layOut: 'Mobile',(value) {

           },);
         }
     ),
     GoRoute(
         path: '/locations',
         builder: (BuildContext context, GoRouterState state){
           return Locations();
         }
     ),

   ]
 );

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

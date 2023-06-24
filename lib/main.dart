import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:operation_falafel/localization/demo_localization.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/providers/contact_provider.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/home_page_provider/home_page_provider.dart';
import 'package:operation_falafel/providers/parsistent_tabview_provider.dart';
import 'package:operation_falafel/providers/settings_provider/setting_provider.dart';
import 'package:operation_falafel/responsive/desktop_scaffold.dart';
import 'package:operation_falafel/responsive/mobile_scaffold.dart';
import 'package:operation_falafel/responsive/responsive_layout.dart';
import 'package:operation_falafel/responsive/tablet_scaffold.dart';
import 'package:operation_falafel/screens/rest%20password/forget_your_password.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:ui' as ui;
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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


        ],
        child: MaterialApp(
         routes: {
           ResetYourPassword.routeName: (ctx) =>  ResetYourPassword(),
         },
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
            home: KeyboardVisibilityProvider(child: ResponsiveLayout(DesktopScaffold: DesktopScaffold(),MobileScaffold: MobileScaffold(),TabletScaffold: TabletScaffold(), ),

            // const Tabs_Screen()


            ),
          ),
      );
    }

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

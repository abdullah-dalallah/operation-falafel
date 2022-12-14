import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:operation_falafel/localization/demo_localization.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/parsistent_tabview_provider.dart';
import 'package:operation_falafel/responsive/desktop_scaffold.dart';
import 'package:operation_falafel/responsive/mobile_scaffold.dart';
import 'package:operation_falafel/responsive/responsive_layout.dart';
import 'package:operation_falafel/responsive/tablet_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void main() {
  runApp(const MyApp());
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


        ],
        child: MaterialApp(
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

              primarySwatch: Colors.blue,
            ),
            home: KeyboardVisibilityProvider(child:
            ResponsiveLayout(DesktopScaffold: DesktopScaffold(),MobileScaffold: MobileScaffold(),TabletScaffold: TabletScaffold(), ),

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

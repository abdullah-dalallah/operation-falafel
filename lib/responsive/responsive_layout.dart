import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../localization/localization_constants.dart';
import '../main.dart';
import '../providers/AppTheme/theme_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class ResponsiveLayout extends StatefulWidget{
  final Widget MobileScaffold;
  final Widget DesktopScaffold;
  final Widget TabletScaffold;
  ResponsiveLayout({required this.DesktopScaffold, required this.MobileScaffold,required this.TabletScaffold});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
  return LayoutBuilder(builder: (context,constraints){
    if(constraints.maxWidth<500){
      return widget.MobileScaffold;
    }else if(constraints.maxWidth <1100){
      return widget.TabletScaffold;
    }
    else{
      return widget.DesktopScaffold;
    }
    }
    );
  }

  @override
  void initState() {
    super.initState();

    Provider.of<ThemeProvider>(context,listen: false).readJson().then((value) {
      if(value.language!=null){
        _changeLanguage(Provider.of<ThemeProvider>(context,listen: false).appTheme.language!);

      }
      FlutterNativeSplash.remove();
    });

  }

  void _changeLanguage (String languageCode) async {
    Locale _temp =await setLocale(languageCode);

    MyApp.setLocale(context,_temp);

  }
}
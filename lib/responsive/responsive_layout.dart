import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget{
  final Widget MobileScaffold;
  final Widget DesktopScaffold;
  final Widget TabletScaffold;
  ResponsiveLayout({required this.DesktopScaffold, required this.MobileScaffold,required this.TabletScaffold});

  @override
  Widget build(BuildContext context) {
  return LayoutBuilder(builder: (context,constraints){
    if(constraints.maxWidth<500){
      return MobileScaffold;
    }else if(constraints.maxWidth <1100){
      return TabletScaffold;
    }
    else{
      return DesktopScaffold;
    }
    }
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:operation_falafel/screens/drawer_pages/contact_us.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../models/AppThemeModels/DesignPerPage/Drawer/drawer.dart';
import '../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../providers/AppTheme/theme_provider.dart';
import '../screens/drawer_pages/locations.dart';
import '../screens/drawer_pages/notifications.dart';
import '../screens/drawer_pages/feedback.dart';
import '../screens/drawer_pages/partners.dart';
import 'loading_drawer.dart';
import 'loading_page.dart';

class DrawerWidget extends StatefulWidget{
  final String layOut ;
   ValueChanged onChanged;
   DrawerWidget({required this.onChanged,super.key, required this.layOut});
  @override
  State<DrawerWidget> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerWidget> {

  void _changeLanguage (String languageCode) async {
    Locale _temp =await setLocale(languageCode);

    MyApp.setLocale(context,_temp);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, appTheme, child) {

          Language? lng= (Localizations.localeOf(context).languageCode=='ar')? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
          DrawerPage? drawerPage = appTheme.appTheme.designPerPage?.drawer;
          bool loadingDesign= drawerPage!=null;



        return Drawer(
                backgroundColor: Colors.black,
                child: SafeArea(
                  child:
                  (loadingDesign)?



                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 15, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// - Name
                        Row(children: [

                          Expanded(
                            child: IconButton(onPressed: () {
                              if (widget.layOut != "Desktop" &&
                                  widget.layOut != "Tablet") {
                                Navigator.pop(context);
                              }
                            }, icon:  ImageIcon(
                                NetworkImage("${drawerPage?.drawerIcon.imageIcon}"),
                              // AssetImage("assets/images/icon_menu.png",),
                              size: double.parse(drawerPage?.drawerIcon.mobileSize as String),
                               // 35,
                              color: Colors.white,
                            ),),
                          ),
                          const SizedBox(width: 15,),
                          Expanded(
                            flex: 5,
                            child: Text("HI ABDULLH", style: TextStyle(
                                fontFamily: getTranslated(context, "fontFamilyBody")!,
                                  color: Color(int.parse(drawerPage.name.color)),
                                  // color: Colors.amber,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20),),
                          ),

                        ],),

                        const SizedBox(height: 20,),

                        Expanded(
                          flex: 8,
                          child: SizedBox(
                            width: 150,
                            child: ListView(

                              children: [
                                /// - Home
                                Visibility(
                                  visible: drawerPage.home.visibility=='true',
                                  child: Column(
                                    crossAxisAlignment :CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          widget.onChanged(0);
                                          // Navigator.pop(context);
                                        },
                                        title: Text(
                                          drawerPage.home.data,
                                          // getTranslated(context, "home")!,
                                          style: TextStyle(
                                              fontFamily: "${lng?.header3.textFamily}",
                                              // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                              color: Color(int.parse(drawerPage.home.color)),
                                              fontSize: lng?.header3.size.toDouble(),
                                              // fontSize: 15,
                                              fontWeight: FontWeight.w300),),

                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8),
                                        child: SizedBox(
                                            width: 120,
                                            height: 0,
                                            child: Divider(color: Colors.white,)),
                                      ),
                                    ],
                                  ),
                                ),


                                /// - Notification
                                Visibility(
                                  visible: drawerPage.notification.visibility=='true',
                                  child: Column(
                                    crossAxisAlignment :CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          // Navigator.pop(context);
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: Notifications(),
                                            withNavBar: true,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
                                          );
                                        },
                                        title: Text(
                                          drawerPage.notification.data,
                                          // getTranslated(context, "home")!,
                                          style: TextStyle(
                                              fontFamily: "${lng?.header3.textFamily}",
                                              // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                              color: Color(int.parse(drawerPage.home.color)),
                                              fontSize: lng?.header3.size.toDouble(),
                                              // fontSize: 15,
                                              fontWeight: FontWeight.w300),),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8),
                                        child: SizedBox(
                                            width: 120,
                                            height: 0,
                                            child: Divider(color: Colors.white,)),
                                      ),
                                    ],
                                  ),
                                ),


                                /// - Partners
                                Visibility(
                                  visible: drawerPage.partners.visibility=='true',
                                  child: Column(
                                    crossAxisAlignment :CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: Partners(),
                                            withNavBar: true,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
                                          );
                                        },

                                        title: Text(
                                          drawerPage.partners.data,
                                          // getTranslated(context, "home")!,
                                          style: TextStyle(
                                              fontFamily: "${lng?.header3.textFamily}",
                                              // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                              color: Color(int.parse(drawerPage.partners.color)),
                                              fontSize: lng?.header3.size.toDouble(),
                                              // fontSize: 15,
                                              fontWeight: FontWeight.w300),),
                                        // title: Text(
                                        //   getTranslated(context, "partners")!,
                                        //   style: TextStyle(
                                        //       fontFamily: "${getTranslated(
                                        //           context, "fontFamilyBody")!}",
                                        //       color: Colors.white,
                                        //       fontSize: 15,
                                        //       fontWeight: FontWeight.w300),),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8),
                                        child: SizedBox(
                                            width: 120,
                                            height: 0,
                                            child: Divider(color: Colors.white,)),
                                      ),
                                    ],
                                  ),
                                ),


                                /// - Location
                                Visibility(
                                  visible: drawerPage.locations.visibility=='true',
                                  child: Column(
                                    crossAxisAlignment :CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: Locations(),
                                            withNavBar: true,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
                                          );
                                        },
                                        title: Text(
                                          drawerPage.locations.data,
                                          // getTranslated(context, "home")!,
                                          style: TextStyle(
                                              fontFamily: "${lng?.header3.textFamily}",
                                              // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                              color: Color(int.parse(drawerPage.locations.color)),
                                              fontSize: lng?.header3.size.toDouble(),
                                              // fontSize: 15,
                                              fontWeight: FontWeight.w300),),
                                        // title: Text(
                                        //   getTranslated(context, "locations")!,
                                        //   style: TextStyle(
                                        //       fontFamily: "${getTranslated(
                                        //           context, "fontFamilyBody")!}",
                                        //       color: Colors.white,
                                        //       fontSize: 15,
                                        //       fontWeight: FontWeight.w300),),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8),
                                        child: SizedBox(
                                            width: 120,
                                            height: 0,
                                            child: Divider(color: Colors.white,)),
                                      ),
                                    ],
                                  ),
                                ),


                                /// - Feedback
                                Visibility(
                                  visible: drawerPage.feedback.visibility=='true',
                                  child: Column(
                                    crossAxisAlignment :CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: FeedbackPage(),
                                            withNavBar: true,
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
                                          );
                                        },
                                        title: Text(
                                          drawerPage.feedback.data,
                                          // getTranslated(context, "home")!,
                                          style: TextStyle(
                                              fontFamily: "${lng?.header3.textFamily}",
                                              // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                              color: Color(int.parse(drawerPage.feedback.color)),
                                              fontSize: lng?.header3.size.toDouble(),
                                              // fontSize: 15,
                                              fontWeight: FontWeight.w300),),
                                        // title: Text(
                                        //   getTranslated(context, "feedback")!,
                                        //   style: TextStyle(
                                        //       fontFamily: "${getTranslated(
                                        //           context, "fontFamilyBody")!}",
                                        //       color: Colors.white,
                                        //       fontSize: 15,
                                        //       fontWeight: FontWeight.w300),),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0, right: 8),
                                        child: SizedBox(
                                            width: 120,
                                            height: 0,
                                            child: Divider(color: Colors.white,)),
                                      ),
                                    ],
                                  ),
                                ),


                                /// - Contact us
                                Visibility(
                                  visible: drawerPage.contactUs.visibility=='true',
                                  child: ListTile(
                                    onTap: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: ContactUs(),
                                        withNavBar: true,
                                        pageTransitionAnimation: PageTransitionAnimation
                                            .cupertino,
                                      );
                                    },
                                    title: Text(
                                      drawerPage.contactUs.data,
                                      // getTranslated(context, "home")!,
                                      style: TextStyle(
                                          fontFamily: "${lng?.header3.textFamily}",
                                          // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                          color: Color(int.parse(drawerPage.contactUs.color)),
                                          fontSize: lng?.header3.size.toDouble(),
                                          // fontSize: 15,
                                          fontWeight: FontWeight.w300),),
                                    // title: Text(
                                    //   getTranslated(context, "contact us")!,
                                    //   style: TextStyle(
                                    //       fontFamily: "${getTranslated(
                                    //           context, "fontFamilyBody")!}",
                                    //       color: Colors.white,
                                    //       fontSize: 15,
                                    //       fontWeight: FontWeight.w300),),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox(height: 10,)),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getTranslated(context, "language")!,
                              style: TextStyle(fontFamily: getTranslated(
                                  context, "fontFamilyButtons"), color: Colors
                                  .amber, fontSize: double.parse(getTranslated(
                                  context, "fontFamilyButtonsSize")!)),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomLeft: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                        ),
                                        // border: Border.all(
                                        //   width: 0.5,
                                        //   color: Colors.white,
                                        //   style: BorderStyle.solid,
                                        // ),
                                      ),
                                      child: Image.asset(
                                        "assets/images/uae.png", height: 30,
                                        width: 35,),
                                    ),

                                    new Positioned.fill(
                                        child: new Material(
                                          color: Colors.transparent,
                                          child: new InkWell(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            splashColor: Colors.black,
                                            overlayColor: MaterialStateProperty
                                                .all<Color>(Colors.black54),

                                            onTap: () {
                                              _changeLanguage("ar");
                                            },
                                          ),

                                        )
                                    ),

                                  ],
                                ),
                                SizedBox(width: 15,),
                                Stack(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomLeft: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                        ),
                                        // border: Border.all(
                                        //   width: 0.5,
                                        //   color: Colors.white,
                                        //   style: BorderStyle.solid,
                                        // ),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(100),
                                            topRight: Radius.circular(100),
                                            bottomLeft: Radius.circular(100),
                                            bottomRight: Radius.circular(100),

                                          ),
                                          child: Image.asset(
                                            "assets/images/uk.png", height: 30,
                                            width: 35,
                                            fit: BoxFit.cover,)),
                                    ),

                                    new Positioned.fill(
                                        child: new Material(
                                          color: Colors.transparent,
                                          child: new InkWell(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            splashColor: Colors.black,
                                            overlayColor: MaterialStateProperty
                                                .all<Color>(Colors.black54),

                                            onTap: () {
                                              _changeLanguage("en");
                                            },
                                          ),

                                        )
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              drawerPage.followUs.data,
                              style: TextStyle(
                                  fontFamily: "${lng?.titleHeader1.textFamily}",
                                  color: Colors.amber,
                                  fontSize: lng?.titleHeader1.size.toDouble()
                              )
                              ,),
                            // Text(getTranslated(context, "follow us")!,
                            //   style: TextStyle(fontFamily: getTranslated(
                            //       context, "fontFamilyButtons"), color: Colors
                            //       .amber, fontSize: double.parse(getTranslated(
                            //       context, "fontFamilyButtonsSize")!)),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomLeft: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                        ),
                                        // border: Border.all(
                                        //   width: 0.5,
                                        //   color: Colors.white,
                                        //   style: BorderStyle.solid,
                                        // ),
                                      ),
                                      child: Image.asset(
                                        "assets/images/facebook.png",
                                        height: 30, width: 35,),
                                    ),

                                    new Positioned.fill(
                                        child: new Material(
                                          color: Colors.transparent,
                                          child: new InkWell(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            splashColor: Colors.black,
                                            overlayColor: MaterialStateProperty
                                                .all<Color>(Colors.black54),

                                            onTap: () {

                                            },
                                          ),

                                        )
                                    ),

                                  ],
                                ),
                                SizedBox(width: 15,),
                                Stack(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomLeft: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight: Radius.circular(40),
                                        ),
                                        // border: Border.all(
                                        //   width: 0.5,
                                        //   color: Colors.white,
                                        //   style: BorderStyle.solid,
                                        // ),
                                      ),
                                      child: Image.asset(
                                        "assets/images/insta_icon.png",
                                        height: 30, width: 35,),
                                    ),

                                    new Positioned.fill(
                                        child: new Material(
                                          color: Colors.transparent,
                                          child: new InkWell(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            splashColor: Colors.black,
                                            overlayColor: MaterialStateProperty
                                                .all<Color>(Colors.black54),

                                            onTap: () {

                                            },
                                          ),

                                        )
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,)

                      ],
                    ),

                  )





                      : LoadingDrawer()
                )
            );


        });
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:operation_falafel/screens/drawer_pages/contact_us.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/drawer_pages/locations.dart';
import '../screens/drawer_pages/notifications.dart';
import '../screens/drawer_pages/feedback.dart';
import '../screens/drawer_pages/partners.dart';

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
    return Drawer(
      backgroundColor: Colors.black,
      child:SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:10.0, top: 15, right: 10),
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// - Name
                Row(children: [

                  IconButton(onPressed: (){
                   if(widget.layOut!="Desktop" && widget.layOut!="Tablet") {
                     Navigator.pop(context);
                   }
                  }, icon: const ImageIcon(
                    AssetImage("assets/images/icon_menu.png",),
                    size: 35,
                    color: Colors.white,
                  ),),

                  // FaIcon(FontAwesomeIcons.bars, color: Colors.white,size: 30,),
                  const  SizedBox(width: 15,),
                  Text("HI ABDULLH",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontWeight: FontWeight.w300,fontSize: 20 ),),

                ],),
                const SizedBox(height: 20,),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: 150,
                    child: ListView(

                      children: [

                        /// - Home
                        ListTile(
                          onTap: (){
                            widget.onChanged(0);
                            // Navigator.pop(context);
                          },
                          title: Text(getTranslated(context, "home")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),

                        ),
                        const Padding(
                          padding:  EdgeInsets.only(left: 8.0, right: 8),
                          child:  SizedBox(
                              width: 120,
                              height: 0,
                              child: Divider(color: Colors.white,)),
                        ),
                        /// - Notification
                        ListTile(
                          onTap: (){
                            // Navigator.pop(context);
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: Notifications(),
                              withNavBar: true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                          title: Text(getTranslated(context, "notification")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(left: 8.0, right: 8),
                          child:  SizedBox(
                              width: 120,
                              height: 0,
                              child: Divider(color: Colors.white,)),
                        ),
                        /// - Partners
                        ListTile(
                          onTap:(){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: Partners(),
                              withNavBar: true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                          title: Text(getTranslated(context, "partners")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(left: 8.0, right: 8),
                          child:  SizedBox(
                              width: 120,
                              height: 0,
                              child: Divider(color: Colors.white,)),
                        ),
                        /// - Location
                        ListTile(
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: Locations(),
                              withNavBar: true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                          title: Text(getTranslated(context, "locations")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(left: 8.0, right: 8),
                          child:  SizedBox(
                              width: 120,
                              height: 0,
                              child: Divider(color: Colors.white,)),
                        ),
                        /// - Feedback
                        ListTile(
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: FeedbackPage(),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                          title: Text(getTranslated(context, "feedback")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(left: 8.0, right: 8),
                          child:  SizedBox(
                              width: 120,
                              height: 0,
                              child: Divider(color: Colors.white,)),
                        ),
                        /// - Contact us
                        ListTile(
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ContactUs(),
                              withNavBar: true,
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                          title: Text(getTranslated(context, "contact us")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                        ),
                      ],
                    ),
                  ),
                ),
                const  Expanded(child: SizedBox(height: 10,)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getTranslated(context, "language")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons"),color: Colors.amber,fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
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
                                borderRadius:const BorderRadius.only(
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
                              child: Image.asset("assets/images/uae.png",height: 30,width: 35,),
                            ),

                            new Positioned.fill(
                                child: new Material(
                                  color: Colors.transparent,
                                  child:  new InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    splashColor: Colors.black,
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                    onTap: (){
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
                                borderRadius:const BorderRadius.only(
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
                                  child: Image.asset("assets/images/uk.png",height: 30,width: 35,fit: BoxFit.cover,)),
                            ),

                            new Positioned.fill(
                                child: new Material(
                                  color: Colors.transparent,
                                  child:  new InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    splashColor: Colors.black,
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                    onTap: (){
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
                         Text(getTranslated(context, "follow us")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons"),color: Colors.amber,fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
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
                                    borderRadius:const BorderRadius.only(
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
                                  child: Image.asset("assets/images/facebook.png",height: 30,width: 35,),
                                ),

                                new Positioned.fill(
                                    child: new Material(
                                      color: Colors.transparent,
                                      child:  new InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        splashColor: Colors.black,
                                        overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                        onTap: (){

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
                                    borderRadius:const BorderRadius.only(
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
                                  child: Image.asset("assets/images/insta_icon.png",height: 30,width: 35,),
                                ),

                                new Positioned.fill(
                                    child: new Material(
                                      color: Colors.transparent,
                                      child:  new InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        splashColor: Colors.black,
                                        overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                        onTap: (){

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

        ),
      )
    );
  }
}
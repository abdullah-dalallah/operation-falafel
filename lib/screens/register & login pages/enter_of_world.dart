import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/register.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../profile/logged_in_user_profile.dart';
import 'login.dart';

class EnterOFWorld extends StatelessWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const EnterOFWorld(this.onChanged,{super.key,required this.layOut});
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration:  BoxDecoration(
       image: DecorationImage(image:AssetImage( "assets/images/background.png",),
         fit: BoxFit.cover,
       )
     ),
     child: Scaffold(
       backgroundColor: Colors.transparent,
      body:  Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 450, ),
          child: Column(

                  children: [
                    const SizedBox(height: 50,),
                    Expanded(
                      child: ListView(
                        children: [
                           Center(
                             child: Stack(

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      "assets/images/of_logo.png",
                                      height: 280,
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(left: 1,top: 1,
                                    child:  RotationTransition(
                                      turns: const AlwaysStoppedAnimation(-15 / 150 ),
                                      child:  Image.asset(
                                        "assets/images/arrow_down.png",
                                        height: 60,
                                        color: Colors.white,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),),
                                  Positioned(
                                    right: 1,bottom: 1,
                                    child:  RotationTransition(
                                      turns: const AlwaysStoppedAnimation(-15 / 600 ),
                                      child:  Image.asset(
                                        "assets/images/page7_right_icon.png",
                                        height: 60,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),),
                                ],
                              ),
                           ),

                          Text(getTranslated(context, "enterOFWorld")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons"),color: Colors.amber,fontSize: double.parse(getTranslated(context, "enterOfTitleSize")!),height: double.parse(getTranslated(context, "enterOfTitleheight")!)),textAlign: TextAlign.center,),

                        ],
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 80),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        side: BorderSide(color: Colors.transparent,width: 1)
                                    )
                                ),
                                overlayColor: MaterialStateProperty.all(Colors.white30),
                                elevation:MaterialStateProperty.all(0),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                                backgroundColor: MaterialStateProperty.all(Colors.black),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.apple, color: Colors.white,),
                                SizedBox(width: 10,),
                                Text( getTranslated(context, "signInWithApple")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20),textAlign: TextAlign.center,),
                              ],
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 80),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: Register(layOut: layOut,(value) {onChanged(value);}),
                                withNavBar: true, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                              );
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        side: BorderSide(color: Colors.transparent,width: 1)
                                    )
                                ),
                                overlayColor: MaterialStateProperty.all(Colors.white30),
                                elevation:MaterialStateProperty.all(0),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                                backgroundColor: MaterialStateProperty.all(Colors.amber),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(getTranslated(context, "register")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20),textAlign: TextAlign.center,),
                              ],
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: (){
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: Login(layOut: layOut,(value) {onChanged(value);}),
                                  withNavBar: true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Text(getTranslated(context, "login")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color: Colors.amber, fontWeight: FontWeight.normal, fontSize: 15),textAlign: TextAlign.center,)),
                          GestureDetector(
                              onTap: (){
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: LoggedInUserProfile(layOut: layOut,(value) {onChanged(value);}),
                                  withNavBar: true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Text(getTranslated(context, "regesterLater")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color: Colors.amber, fontWeight: FontWeight.normal, fontSize: 15),textAlign: TextAlign.center,)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),




                  ],
                ),
        ),
      ),



     ),
   );
  }

}
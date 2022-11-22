import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/reset_your_password.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../localization/localization_constants.dart';
import '../profile/logged_in_user_profile.dart';

class Login extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const Login(this.onChanged,{super.key,required this.layOut});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        appBar:AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:
            (Localizations.localeOf(context).languageCode=='en')?
            const ImageIcon(
              AssetImage("assets/images/back_new.png",),
              size: 35,
            ):
            const ImageIcon(
              AssetImage("assets/images/back_arabic.png",),
              size: 35,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // centerTitle: true,
          // title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
          // actions: [],
        ),
        body:  Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 450, ),
            child: Column(

              children: [
                // const SizedBox(height: 50,),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Image.asset(
                          "assets/images/page4_image_new.png",
                          height: 280,
                          // fit: BoxFit.cover,
                        ),
                      ),
                      Text(getTranslated(context, "welcomeBack")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons"),color: Colors.amber,fontSize: double.parse(getTranslated(context, "welcomeBackTitle")!),height: 1),textAlign: TextAlign.center,),
                      const SizedBox(height: 30,),
                      /// - email address
                      Padding(
                        padding: const EdgeInsets.only(left:18.0, right: 18),
                        child: Container(
                          padding: const EdgeInsets.only(left:0, right: 0),
                          decoration:const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            // border: Border.all(
                            //   width: 0,
                            //   color: Colors.transparent,
                            //   style: BorderStyle.solid,
                            // ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 8.0, right: 8,bottom: 5),
                               child: Text("${getTranslated(context, "emailAddress")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),),
                             ),
                             SizedBox(

                                  child:   TextField(

                                    autofocus: false,
                                    style:  TextStyle(color: Colors.white),
                                    decoration:  InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      contentPadding: EdgeInsets.only(left:10, right: 10),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:  BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:  BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                      ),
                                      hintText: '',

                                      // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                    ),

                                  ),
                                ),

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      /// - Password
                      Padding(
                        padding: const EdgeInsets.only(left:18.0, right: 18),
                        child: Container(
                          padding: const EdgeInsets.only(left:0, right: 0),
                          decoration:const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            // border: Border.all(
                            //   width: 0,
                            //   color: Colors.transparent,
                            //   style: BorderStyle.solid,
                            // ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left:8.0, right: 8 , bottom: 5),
                                child: Text("${getTranslated(context, "password")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),),
                              ),
                              const SizedBox(
                                  child:   TextField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    autofocus: false,
                                    style:  TextStyle(color: Colors.white),
                                    decoration:  InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      contentPadding: EdgeInsets.only(left:10, right: 10),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:  BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:  BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                      ),

                                      hintText: '',
                                      // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                    ),

                                  ),
                                ),

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right:18.0, left: 18),
                            child: RichText(
                              text: TextSpan(
                                text: "",
                                style: TextStyle(color: Colors.amber, fontSize: 15,fontWeight: FontWeight.w300, fontFamily: getTranslated(context, "fontFamilyBody")),
                                children: <TextSpan>[TextSpan(
                                      text: getTranslated(context, "forgetPassword"),
                                      style:const TextStyle(decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: ResetYourPassword(layOut: widget.layOut,(value) {widget.onChanged(value);}),
                                            withNavBar: true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                          );
                                        }

                                ),],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      /// - Submit button
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration:const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
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
                              child:const Icon(Icons.check, color:Colors.white,),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration:const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
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
                              // child:Icon(Icons.check, color:Colors.white,),
                            ),
                            Positioned(
                              bottom:8,
                              right:9,

                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:const BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child:const Icon(Icons.check, color:Colors.white,size: 30,),
                              ),
                            ),

                            Positioned.fill(
                                child:  Material(
                                  color: Colors.transparent,
                                  child:   InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    splashColor: Colors.black45,
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                    onTap: (){
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: LoggedInUserProfile(layOut: widget.layOut,(value) {widget.onChanged(value);}),
                                        withNavBar: true, // OPTIONAL VALUE. True by default.
                                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                      );
                                    },
                                  ),

                                )
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
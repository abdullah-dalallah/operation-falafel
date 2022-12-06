import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/credit_calculator.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/how_it_works.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/my_gifts.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/rewards_histoy.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'dart:math' as math;
import 'package:share_plus/share_plus.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'rewards_pages/transfer_credits.dart';

class MyRewards extends StatefulWidget{
  final String layOut ;
  const MyRewards({super.key,required this.layOut});


  @override
  State<MyRewards> createState() => _MyRewardsState();
}

class _MyRewardsState extends State<MyRewards> {


  int currentPos = 0;
  final List<String> imgList = [

    "assets/images/page_4_logo.png",
    "assets/images/tut_4_image.png",
    "assets/images/loyality_banner.png",
    "assets/images/page_4_logo.png",
  ];


  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,

          child: Image.asset(
            "assets/images/page9_background_effect.png",
            height: MediaQuery.of(context).size.height-140,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            bottom: 150,
            child: Transform.rotate(
              angle: -math.pi / 40,
              child: Image.asset(
                "assets/images/page2_top_line.png",
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
            ),
          ),

        Scaffold(
          backgroundColor: Colors.transparent,
          key: _drawerKey,
          appBar:AppBar(
            leading:

            IconButton(
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
            centerTitle: true,
            title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            // Image.asset("assets/images/of_logo_top.png", width: 220,),
            // Text("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)
            actions: [
              // CupertinoSwitch(
              //   value: _switchValue,
              //   onChanged: (value) {
              //     setState(() {
              //       _switchValue = value;
              //     });
              //   },
              // ),
            ],
          ),
          body: Column(
            children: [

              Text(getTranslated(context, "ofLoyalty")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
              (widget.layOut=="Mobile")?SizedBox(height: 0,):(widget.layOut=="Tablet")?SizedBox(height: 60,):SizedBox(height: 100,),

              Expanded(

                child: ListView(
                  children: [
                    /// - Slider - Done Design
                    ClipRRect(
                      borderRadius: const BorderRadius.only(),
                      child: CarouselSlider(

                          options: CarouselOptions(
                            // height: MediaQuery. of(context). size. height-470,
                              aspectRatio: (widget.layOut=="Mobile")?1.2:(widget.layOut=="Tablet")?1.5:1.7,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              // enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentPos = index;
                                });
                              }

                          ),
                          items: imgList.map((item) => Image.asset(item, fit: BoxFit.contain,
                          ),
                          )
                              .toList()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((url) {
                        int index = imgList.indexOf(url);
                        return Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30 ,top: 5,bottom: 5),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPos == index
                                  ?const Color.fromRGBO(255, 174, 0, 0.9019607843137255)
                                  : const Color.fromRGBO(211, 211, 211, 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),



                  ],
                ),
              ),

              /// - Your balance
              Container(
                padding: const EdgeInsets.only(left:28, right: 28, top: 7,bottom:10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    width: 0,
                    color: Colors.transparent,
                    style: BorderStyle.solid,
                  ),
                ),
                child: RichText(

                  text:  TextSpan(text: getTranslated(context, "dashBoardTitle-youHave")!,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300,fontFamily:getTranslated(context, "fontFamilyBody")!,), children: [
                    TextSpan(
                      text: '0 AED ',
                      style: TextStyle(color: Colors.amber),
                      recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                    ),
                    TextSpan(
                      text: '${getTranslated(context, "dashBoardTitle-valid")!}',
                      style: TextStyle(color: Colors.white),
                      recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                    )
                  ]),
                ),

              ),
               const SizedBox(height: 15,),

              /// - Buttons
              Visibility(
                visible: !isKeyboardVisible,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 450, ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 60,
                                  // width: 130,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: HowItWorks(),
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
                                        overlayColor: MaterialStateProperty.all(Colors.white12),
                                        elevation:MaterialStateProperty.all(0),
                                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                                        backgroundColor: MaterialStateProperty.all(Colors.black),
                                        foregroundColor: MaterialStateProperty.all(Colors.black),
                                        padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                    child:  Text(getTranslated(context, "howItworks")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 60,
                                  // width: 130,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: MyGifts(),
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
                                        overlayColor: MaterialStateProperty.all(Colors.white12),
                                        elevation:MaterialStateProperty.all(0),
                                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                                        backgroundColor: MaterialStateProperty.all(Colors.black),
                                        foregroundColor: MaterialStateProperty.all(Colors.black),
                                        padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                    child:  Text(getTranslated(context, "myRewards")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 60,
                                  // width: 130,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      final RenderBox renderBox = context.findRenderObject() as RenderBox;
                                      Share.share(
                                        "You have been invited by Abdullh to join the O:F Family! Click below to install our app. Onelink.to/dhdbm3. Once you join, you will receive a 25% discount on your first order & 5Dhs credit when you use code 248921 in your registration page"
                                        ,subject: "check out The website"
                                        ,sharePositionOrigin: renderBox.localToGlobal(Offset.zero)&renderBox.size,
                                      );

                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                side: BorderSide(color: Colors.transparent,width: 1)
                                            )
                                        ),
                                        overlayColor: MaterialStateProperty.all(Colors.white12),
                                        elevation:MaterialStateProperty.all(0),
                                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                                        backgroundColor: MaterialStateProperty.all(Colors.black),
                                        foregroundColor: MaterialStateProperty.all(Colors.black),
                                        // padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                    child:  Text(getTranslated(context, "referFriend")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 60,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: TransferCredit(),
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
                                        overlayColor: MaterialStateProperty.all(Colors.white12),
                                        elevation:MaterialStateProperty.all(0),
                                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                                        backgroundColor: MaterialStateProperty.all(Colors.black),
                                        foregroundColor: MaterialStateProperty.all(Colors.black),
                                        padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10)),
                                        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                    child:  Text(getTranslated(context, "transferCredits")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 60,

                                  child: ElevatedButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: CreditCalculator(),
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
                                        overlayColor: MaterialStateProperty.all(Colors.white12),
                                        elevation:MaterialStateProperty.all(0),
                                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                                        backgroundColor: MaterialStateProperty.all(Colors.black),
                                        foregroundColor: MaterialStateProperty.all(Colors.black),
                                        padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                    child:  Text(getTranslated(context, "creditsCalculator")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  height: 60,

                                  child: ElevatedButton(
                                    onPressed: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: RewardsHistory(),
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
                                        overlayColor: MaterialStateProperty.all(Colors.black12),
                                        elevation:MaterialStateProperty.all(0),
                                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                                        backgroundColor: MaterialStateProperty.all(Colors.black),
                                        foregroundColor: MaterialStateProperty.all(Colors.black),
                                        padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                    child:  Text(getTranslated(context, "history")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300, ),textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            ),



                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),

        ),
      ],
    );

  }
}
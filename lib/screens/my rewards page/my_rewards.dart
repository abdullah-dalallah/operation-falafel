import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/providers/home_page_provider/models/slider_model.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/credit_calculator.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/how_it_works.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/my_gifts.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/rewards_histoy.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/cached_image_with_placeholder.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:share_plus/share_plus.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../models/AppThemeModels/DesignPerPage/Loyalty-MyRewardsPage/loyalty_my_rewards_page.dart';
import '../../models/AppThemeModels/DesignPerPage/LoyaltyPage/loyalty_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../providers/tab_index_generator_provider.dart';
import '../homepage/of_homepage.dart';
import 'rewards_pages/transfer_credits.dart';

class MyRewards extends StatefulWidget{
  final String layOut ;
  static const routeName = 'MyRewards';
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

    return Consumer3<ThemeProvider,LoyaltyProvider,AuthProvider>(builder: (context, appTheme,loyaltyProvider,authProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyPage? loyaltyPage = appTheme.appTheme.designPerPage?.loyaltyPage;
      bool loadingDesign = loyaltyPage != null;
      List<String>? headerTitleParts = [];
      if(headerTitleParts!=null){
        if(loyaltyPage?.body.creditBalance.creditTitle!=null){
          headerTitleParts= loyaltyPage?.body.creditBalance.creditTitle.data.split('*');
        }
      }

      return
        (loadingDesign)?
        Stack(
        children: [
          Background(),
          // Image.asset(
          //   "assets/images/background.png",
          //   height: MediaQuery
          //       .of(context)
          //       .size
          //       .height,
          //   width: MediaQuery
          //       .of(context)
          //       .size
          //       .width,
          //   fit: BoxFit.cover,
          // ),
          Align(
            alignment: Alignment.topCenter,

            child: Image.asset(
              "assets/images/page9_background_effect.png",
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 140,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            key: _drawerKey,
            appBar: AppBar(
              leading:
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(loyaltyPage.appBar.backIcon.imageIcon),
                  // size: double.parse(loyaltyMyRewardsPage?.appBar.backIcon.size as String),
                ) :
                ImageIcon(
                  NetworkImage(loyaltyPage.appBar.backIcon.imageIcon),
                  // size: double.parse(loyaltyMyRewardsPage?.appBar.backIcon.size as String),
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon:
              //   (Localizations
              //       .localeOf(context)
              //       .languageCode == 'en') ?
              //   const ImageIcon(
              //     AssetImage("assets/images/back_new.png",),
              //     size: 35,
              //   ) :
              //   const ImageIcon(
              //     AssetImage("assets/images/back_arabic.png",),
              //     size: 35,
              //   ),
              // ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title:
              MyText(
                loyaltyPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              // MyText(getTranslated(context, "operationFalafelLogo")!,
              //   style: TextStyle(
              //       fontFamily: "${getTranslated(context, "fontFamilyTitle")!}",
              //       fontWeight: FontWeight.bold),),
              // Image.asset("assets/images/of_logo_top.png", width: 220,),
              // MyText("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)
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
                MyText(
                  loyaltyPage.body.pageTitle.data,
                  style: TextStyle(
                      fontFamily: lng?.titleHeader2.textFamily,
                      color: Color(int.parse(loyaltyPage.body.pageTitle.color)),
                      fontSize: lng?.titleHeader2.size.toDouble()

                  ),),
                // MyText(getTranslated(context, "ofLoyalty")!, style: TextStyle(
                //     fontFamily: "${getTranslated(
                //         context, "fontFamilyButtons")!}",
                //     color: Colors.amber,
                //     fontSize: double.parse(
                //         getTranslated(context, "fontFamilyTitleُSize")!)),),



                (widget.layOut == "Mobile") ? SizedBox(height: 0,) : (widget.layOut == "Tablet") ? SizedBox(height: 60,) : SizedBox(
                  height: 100,),

                Expanded(

                  child: ListView(
                    children: [

                      /// - Slider - Done Design
                      ClipRRect(
                        borderRadius: const BorderRadius.only(),
                        child: CarouselSlider(

                            options: CarouselOptions(
                              // height: MediaQuery. of(context). size. height-470,
                                aspectRatio: (widget.layOut == "Mobile")
                                    ? 1.2
                                    : (widget.layOut == "Tablet") ? 1.5 : 1.7,
                                viewportFraction: 1,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(
                                    milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                // enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentPos = index;
                                  });
                                }

                            ),
                            items:

                            (sliderWidets!=null)?sliderWidets:

                            [
                              const Center(
                                  child:   SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.amber,
                                      strokeWidth: 2,
                                    ),
                                  )
                                // child: CircularProgressIndicator(strokeWidth: 2.1,)
                              ),
                            ],
                            // imgList.map((item) =>
                            //     Image.asset(item, fit: BoxFit.contain,
                            //     ),
                            // ).toList()

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30, top: 5, bottom: 5),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentPos == index
                                    ? const Color.fromRGBO(
                                    255, 174, 0, 0.9019607843137255)
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
                  padding: const EdgeInsets.only(
                      left: 28, right: 28, top: 7, bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(int.parse(loyaltyPage.body.creditBalance.backGroundColor)),
                    // color: Colors.black,
                    borderRadius: const BorderRadius.only(
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

                    text:  TextSpan(
                        text:
                        // "Test",
                        headerTitleParts![0],
                        // text: getTranslated(context, "dashBoardTitle-youHave")!,
                        style: TextStyle(
                          color: Color(int.parse(loyaltyPage.body.creditBalance.creditTitle.color)),
                          fontSize: lng?.header3.size.toDouble(),
                          // fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily:lng?.header3.textFamily,
                          // fontFamily:getTranslated(context, "fontFamilyBody")!,
                        ),
                        children: [
                          TextSpan(
                            text: "${(loyaltyProvider!.loyaltyPoint!=null)?(authProvider.loggedInUser !=null)?loyaltyProvider!.loyaltyPoint!.body!.amount!.toDouble():0.0:0.0}${getTranslated(context, "dashBoardTitle-credit")!}",
                            style: TextStyle(color:
                            Color(int.parse(loyaltyPage.body.creditBalance.balance.color))
                              // Colors.amber
                            ),
                            recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                          ),
                          TextSpan(
                            text: '${headerTitleParts![1]} 00/00/0000',
                            // text: '${getTranslated(context, "dashBoardTitle-valid")!} 00/00/0000',
                            style: TextStyle(color:  Color(int.parse(loyaltyPage.body.creditBalance.creditTitle.color)),),
                            recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                          )
                        ]),
                  ),

                  // RichMyText(
                  //
                  //   text: TextSpan(
                  //       text: getTranslated(context, "dashBoardTitle-youHave")!,
                  //       style: TextStyle(fontSize: 17,
                  //         fontWeight: FontWeight.w300,
                  //         fontFamily: getTranslated(
                  //             context, "fontFamilyBody")!,),
                  //       children: [
                  //         TextSpan(
                  //           text: '0 AED ',
                  //           style: TextStyle(color: Colors.amber),
                  //           recognizer: new TapGestureRecognizer()
                  //             ..onTap = () => print('Tap Here onTap'),
                  //         ),
                  //         TextSpan(
                  //           text: '${getTranslated(
                  //               context, "dashBoardTitle-valid")!}',
                  //           style: TextStyle(color: Colors.white),
                  //           recognizer: new TapGestureRecognizer()
                  //             ..onTap = () => print('Tap Here onTap'),
                  //         )
                  //       ]),
                  // ),

                ),
                const SizedBox(height: 15,),

                /// - Buttons
                Visibility(
                  visible: !isKeyboardVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 450,),
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
                                        // context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${HowItWorks.routeName}");
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: HowItWorks(),
                                          withNavBar: true,
                                          // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation
                                              .cupertino,
                                        );
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  side: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1)
                                              )
                                          ),
                                          overlayColor: MaterialStateProperty.all(Colors.white12),
                                          elevation: MaterialStateProperty.all(0),
                                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Color(int.parse(loyaltyPage.body.buttons.howItWorks.backGroundColor))),
                                          foregroundColor: MaterialStateProperty.all(Colors.black),
                                          padding: MaterialStateProperty.all(const EdgeInsets.only(top: 10, bottom: 10,)),
                                          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                      child:
                                      MyText(
                                        loyaltyPage.body.buttons.howItWorks.data,
                                        style: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(loyaltyPage.body.buttons.howItWorks.color)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                      // MyText(
                                      //   getTranslated(context, "howItworks")!,
                                      //   style: TextStyle(
                                      //       fontFamily: getTranslated(
                                      //           context, "fontFamilyBody")!,
                                      //       color: Colors.white,
                                      //       fontSize: 17,
                                      //       fontWeight: FontWeight.w300),),
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
                                        // context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${MyGifts.routeName}");

                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: MyGifts(),
                                          withNavBar: true,
                                          // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation
                                              .cupertino,
                                        );
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  side: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1)
                                              )
                                          ),
                                          overlayColor: MaterialStateProperty
                                              .all(Colors.white12),
                                          elevation: MaterialStateProperty.all(
                                              0),
                                          shadowColor: MaterialStateProperty
                                              .all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Color(int.parse(loyaltyPage.body.buttons.myRewards.backGroundColor))),

                                          foregroundColor: MaterialStateProperty
                                              .all(Colors.black),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.only(
                                                top: 10, bottom: 10,)),
                                          textStyle: MaterialStateProperty.all(
                                              const TextStyle(fontSize: 30))),
                                      child: MyText(
                                        loyaltyPage.body.buttons.myRewards.data,
                                        style: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(loyaltyPage.body.buttons.myRewards.color)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
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

                                        if(Provider.of<AuthProvider>(context, listen: false).loggedInUser!=null) {
                                          String userToken =  Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
                                          Provider.of<LoyaltyProvider>(
                                              context, listen: false).getReferToFriendMessage(userToken: userToken).then((res) {
                                            print("Message: ${res.data[Keys.bodyKey]}");
                                            final RenderBox renderBox = context.findRenderObject() as RenderBox;
                                            Share.share(
                                              "${res.data[Keys.bodyKey]}"
                                              ,subject: "check out The website"
                                              ,sharePositionOrigin: renderBox.localToGlobal(Offset.zero)&renderBox.size,
                                            );
                                          });

                                        }else{
                                          Provider.of<TabIndexGenerator>(context, listen: false).setIndex(4);
                                        }
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  side: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1)
                                              )
                                          ),
                                          overlayColor: MaterialStateProperty
                                              .all(Colors.white12),
                                          elevation: MaterialStateProperty.all(
                                              0),
                                          shadowColor: MaterialStateProperty
                                              .all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Color(int.parse(loyaltyPage.body.buttons.referFriend.backGroundColor))),

                                          foregroundColor: MaterialStateProperty
                                              .all(Colors.black),
                                          // padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                          textStyle: MaterialStateProperty.all(
                                              const TextStyle(fontSize: 30))),
                                      child:  MyText(
                                        loyaltyPage.body.buttons.referFriend.data,
                                        style: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(loyaltyPage.body.buttons.referFriend.color)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
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
                                        // context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${TransferCredit.routeName}");
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: TransferCredit(),
                                          withNavBar: true,
                                          // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation
                                              .cupertino,
                                        );
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  side: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1)
                                              )
                                          ),
                                          overlayColor: MaterialStateProperty
                                              .all(Colors.white12),
                                          elevation: MaterialStateProperty.all(
                                              0),
                                          shadowColor: MaterialStateProperty
                                              .all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Color(int.parse(loyaltyPage.body.buttons.transferCredits.backGroundColor))),

                                          foregroundColor: MaterialStateProperty
                                              .all(Colors.black),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.only(
                                                  top: 10, bottom: 10)),
                                          textStyle: MaterialStateProperty.all(
                                              const TextStyle(fontSize: 30))),
                                      child:
                                      MyText(
                                        loyaltyPage.body.buttons.transferCredits.data,
                                        style: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(loyaltyPage.body.buttons.transferCredits.color)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300),textAlign: TextAlign.center,),

                                      // MyText(getTranslated(
                                      //     context, "transferCredits")!,
                                      //   style: TextStyle(
                                      //       fontFamily: getTranslated(
                                      //           context, "fontFamilyBody")!,
                                      //       color: Colors.white,
                                      //       fontSize: 17,
                                      //       fontWeight: FontWeight.w300),
                                      //   textAlign: TextAlign.center,),
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
                                        // context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${CreditCalculator.routeName}");
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: CreditCalculator(),
                                          withNavBar: true,
                                          // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation
                                              .cupertino,
                                        );
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  side: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1)
                                              )
                                          ),
                                          overlayColor: MaterialStateProperty
                                              .all(Colors.white12),
                                          elevation: MaterialStateProperty.all(
                                              0),
                                          shadowColor: MaterialStateProperty
                                              .all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Color(int.parse(loyaltyPage.body.buttons.creditCalculator.backGroundColor))),

                                          foregroundColor: MaterialStateProperty
                                              .all(Colors.black),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.only(
                                                top: 10, bottom: 10,)),
                                          textStyle: MaterialStateProperty.all(
                                              const TextStyle(fontSize: 30))),
                                      child: MyText(
                                        loyaltyPage.body.buttons.creditCalculator.data,
                                        style: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(loyaltyPage.body.buttons.creditCalculator.color)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
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

                                        // print( GoRouter.of(context).routerDelegate.currentConfiguration.fullPath);
                                        // context.push('${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${RewardsHistory.routeName}');
                                        // context.go("${MainMenu.routeName}/${MyRewards.routeName}/${CreditCalculator.routeName}");
                                        if(Provider.of<AuthProvider>(context, listen: false).loggedInUser ==null){
                                          Provider.of<TabIndexGenerator>(context, listen: false).setIndex(4);
                                        }
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: RewardsHistory(),
                                          withNavBar: true,
                                          // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                        );




                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(10)),
                                                  side: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1)
                                              )
                                          ),
                                          overlayColor: MaterialStateProperty
                                              .all(Colors.black12),
                                          elevation: MaterialStateProperty.all(
                                              0),
                                          shadowColor: MaterialStateProperty
                                              .all(Colors.transparent),
                                          backgroundColor: MaterialStateProperty.all(Color(int.parse(loyaltyPage.body.buttons.history.backGroundColor))),

                                          foregroundColor: MaterialStateProperty
                                              .all(Colors.black),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.only(
                                                top: 10, bottom: 10,)),
                                          textStyle: MaterialStateProperty.all(
                                              const TextStyle(fontSize: 30))),
                                      child: MyText(
                                        loyaltyPage.body.buttons.history.data,
                                        style: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(loyaltyPage.body.buttons.history.color)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
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
      )
      :const LoadingPage()

      ;
    });
  }



  List<Widget>? sliderWidets ;

  @override
  void initState() {
    start();
  }
  List<Widget>  buildSliders(List<SliderItem>? sliders){
    List<Widget> slidersWidgets =[
      CachedImageWithPlaceholder("", BoxFit.cover),
      CachedImageWithPlaceholder("", BoxFit.cover)
    ];
    if(sliders !=null)
      slidersWidgets = sliders!.map((e) => InkWell(
          onTap: (){
            print("url");
            // GoRouter.of(context).push(Uri(path: '/locations').toString());

            // context.push("/locations");
            // GoRouter.of(context).go('/locations');
          },
          child: CachedImageWithPlaceholder(e.imageUrl!, BoxFit.cover))).toList();
    return slidersWidgets;
  }



  void start()async{
    Future.wait([
     Provider.of<LoyaltyProvider>(context, listen: false).getLoyaltySliders().then((res) {
      if(res.statusCode ==200){
        sliderWidets = buildSliders((res.data as List).map((i) => SliderItem.fromJson(i)).toList());
      }
    }),

    ]).then((value) {
      if(Provider.of<AuthProvider>(context, listen: false).loggedInUser !=null) {
        String? userToken =Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
        Provider.of<LoyaltyProvider>(context, listen: false).getLoyaltyTotalPoint(userToken: userToken).then((value) {});
      }
    });
  }
}
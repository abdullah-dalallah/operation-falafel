import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/providers/tab_index_generator_provider.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/buy_gift.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/my_gifts_list.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/Loyalty-MyRewardsPage/loyalty_my_rewards_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';
import '../../../widgets/loading_page.dart';

class MyGifts extends StatefulWidget{
  static const routeName = 'MyGifts';
  @override
  State<MyGifts> createState() => _MyGiftsState();
}

class _MyGiftsState extends State<MyGifts> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyMyRewardsPage? loyaltyMyRewardsPage = appTheme.appTheme.designPerPage?.loyaltyMyRewardsPage;
      bool loadingDesign = loyaltyMyRewardsPage != null;

      return
        (loadingDesign)?
        Stack(
        children: [
          Background(),
          Scaffold(
            key: _drawerKey,
            backgroundColor: Colors.transparent,
            appBar:AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(loyaltyMyRewardsPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyMyRewardsPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(loyaltyMyRewardsPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyMyRewardsPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: MyText(
                loyaltyMyRewardsPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 450,),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [

                          /// - Title
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [
                                Expanded(flex: 1,
                                  child:
                                  Image.network(loyaltyMyRewardsPage.body.pageImage, height: 170, width: 170,),
                                  // Image.asset("assets/images/gift_pack.png", height: 170, width: 170,),
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  // flex: 2,
                                    child:
                                    MyText(
                                      loyaltyMyRewardsPage.body.pageTitle.data,
                                      style: TextStyle(
                                          fontFamily: lng?.titleHeader2.textFamily,
                                          color: Color(int.parse(loyaltyMyRewardsPage.body.pageTitle.color)),
                                          fontSize: lng?.titleHeader2.size.toDouble()

                                      ),),
                                    // MyText(
                                    //   getTranslated(context, "myRewardsTitle")!,
                                    //   style: TextStyle(
                                    //       fontFamily: "${getTranslated(
                                    //           context, "fontFamilyButtons")!}",
                                    //       color: Colors.amber,
                                    //       fontSize: double.parse(getTranslated(
                                    //           context,
                                    //           "fontFamilyTitleُSize")!)),)
                                ),

                              ],
                            ),
                          ),

                          /// - My gifts
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ElevatedButton(
                              onPressed: () {



                                if(Provider.of<AuthProvider>(context, listen: false).loggedInUser !=null){
                                  // context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${MyGiftsList.routeName}");

                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: MyGiftsList(),
                                    withNavBar: true,
                                    // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation: PageTransitionAnimation
                                        .cupertino,
                                  );
                                }
                                else{

                                   Provider.of<TabIndexGenerator>(context, listen: false).setIndex(4);
                                   // context.go("/Profile");


                                  Fluttertoast.showToast(
                                      msg: "${getTranslated(context, "loginFirst")}",

                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.amber.withOpacity(0.8),
                                      textColor: Colors.white,

                                      fontSize: 16.0
                                  );
                                }

                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          side: BorderSide(
                                              color: Colors.transparent,
                                              width: 1)
                                      )
                                  ),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.white12),
                                  elevation: MaterialStateProperty.all(0),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(Color(int.parse(loyaltyMyRewardsPage.body.buyGiftButton.backGroundColor))),
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.black),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(
                                        top: 10, bottom: 10,)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(fontSize: 30))),
                              child:  MyText(
                                loyaltyMyRewardsPage.body.myGiftsButton.data,
                                style: TextStyle(
                                  fontFamily: lng?.header3.textFamily,
                                  color: Color(int.parse( loyaltyMyRewardsPage.body.myGiftsButton.color)),
                                  fontSize: lng?.header3.size.toDouble(),
                                  fontWeight: FontWeight.w300,),
                                textAlign: TextAlign.center,),
                            ),
                          ),

                          /// - Buy gifts
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${BuyGift.routeName}");
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: BuyGift(),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          side: BorderSide(
                                              color: Colors.transparent,
                                              width: 1)
                                      )
                                  ),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.white12),
                                  elevation: MaterialStateProperty.all(0),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(Color(int.parse(loyaltyMyRewardsPage.body.buyGiftButton.backGroundColor))),

                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.black),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.only(
                                        top: 10, bottom: 10,)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(fontSize: 30))),
                              child:
                              MyText(
                                loyaltyMyRewardsPage.body.buyGiftButton.data,
                                style: TextStyle(
                                  fontFamily: lng?.header3.textFamily,
                                  color: Color(int.parse( loyaltyMyRewardsPage.body.buyGiftButton.color)),
                                  fontSize: lng?.header3.size.toDouble(),
                                  fontWeight: FontWeight.w300,),
                                textAlign: TextAlign.center,),
                              // MyText(
                              //   getTranslated(context, "buyGifts")!,
                              //   style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,
                              //     color: Colors.amber,
                              //     fontSize: 17,
                              //     fontWeight: FontWeight.w300,),
                              //     textAlign: TextAlign.center,),
                            ),
                          ),


                        ],
                      ),
                    ),

                    /// - my Code
                    Visibility(
                      visible: loyaltyMyRewardsPage.body.myCode.visibility=='true',
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon:

                                ImageIcon(
                                  NetworkImage(loyaltyMyRewardsPage.body.myCode.imageIcon),
                                  size: double.parse(loyaltyMyRewardsPage.body.myCode.mobileSize  as String),
                                  color: Colors.amber,
                                )
                              ),

                              // Image.network("${loyaltyMyRewardsPage.body.myCode.imageIcon}", height: 60, width: 60,),
                              // Image.asset("assets/images/my_rewards_gencode.png", height: 60, width: 60,),
                              MyText(
                                loyaltyMyRewardsPage.body.myCode.data ,
                                style: TextStyle(
                                  color: Color(int.parse(loyaltyMyRewardsPage.body.myCode.color)),
                                  fontSize: lng?.header5.size.toDouble(),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: lng?.header5.textFamily,),
                                textAlign: TextAlign.center,)

                              // MyText(
                              //   getTranslated(context, "dashBoardTitle-myCode")!,
                              //   style: TextStyle(color: Colors.white,
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.w300,
                              //     fontFamily: getTranslated(context, "fontFamilyBody")!,),
                              //   textAlign: TextAlign.center,)
                            ],
                          ),
                           Positioned.fill(
                              child:  Material(
                                color: Colors.transparent,
                                child:  InkWell(
                                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                                  splashColor: Colors.black,
                                  overlayColor: MaterialStateProperty.all<Color>(
                                      Colors.black54),

                                  onTap: () {

                                  },
                                ),

                              )
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,)

                  ],
                ),
              ),
            ),
          ),
        ],
      )

      :LoadingPage();
    });

  }


}
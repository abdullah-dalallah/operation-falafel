import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_friend.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/Loyalty-GiftDetailsPage/loyalty_gift_detail_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class GiftDetails extends StatefulWidget{
  @override
  State<GiftDetails> createState() => _GiftDetailsState();
}

class _GiftDetailsState extends State<GiftDetails> {



  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyGiftDetailsPage? loyaltyGiftDetailsPage = appTheme.appTheme.designPerPage?.loyaltyGiftDetailsPage;
      bool loadingDesign = loyaltyGiftDetailsPage != null;

      return
        (loadingDesign)?
        Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            key: _drawerKey,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(loyaltyGiftDetailsPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyGiftDetailsPage?.appBar.backIcon.size as String),
                ) :
                ImageIcon(
                  NetworkImage(loyaltyGiftDetailsPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyGiftDetailsPage?.appBar.backIcon.size as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                loyaltyGiftDetailsPage.appBar.title.data,
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
                    Image.network(loyaltyGiftDetailsPage.body.pageImage, height: 150, width: 150,),
                    // Image.asset(
                    //   "assets/images/gift.png", height: 150, width: 150,),

                    const SizedBox(height: 15,),
                    Text(
                      loyaltyGiftDetailsPage.body.pageTitle.data,
                      style: TextStyle(
                          fontFamily: lng?.header5.textFamily,
                          color: Color(int.parse(loyaltyGiftDetailsPage.body.pageTitle.color)),
                          fontSize: lng?.header5.size.toDouble()
                      ),),

                    // Text(
                    //   getTranslated(context, "welcomeToOFFamily")!,
                    //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                    //       color: Colors.amber,
                    //       fontSize: 25
                    //   ),),
                    Text(
                      getTranslated(context, "registrationGift")!,
                      style:  TextStyle(
                          fontFamily: lng?.header5.textFamily,
                          color: Color(int.parse(loyaltyGiftDetailsPage.body.giftTitle.color)),
                          fontSize: lng?.header5.size.toDouble()
                      ),),
                    const SizedBox(height: 25,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: ListView(
                          children: [

                            Row(
                              children: [
                                Text(
                                  "${loyaltyGiftDetailsPage.body.voucher.title.data}:",
                                  style: TextStyle(
                                      fontFamily: lng?.header5.textFamily,
                                      color: Color(int.parse(loyaltyGiftDetailsPage.body.voucher.title.color)),
                                      fontSize: lng?.header5.size.toDouble(),
                                      fontWeight: FontWeight.bold),),
                                // Text(
                                //   "${getTranslated(context, "voucherTitle")!}:",
                                //   style: TextStyle(
                                //       fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                //       color: Colors.white,
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.bold),),
                              ],
                            ),

                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${getTranslated(context, "voucherBody")!}:",
                                  style: TextStyle(
                                      fontFamily: lng?.header3.textFamily,
                                      color: Color(int.parse(loyaltyGiftDetailsPage.body.voucher.subTitle.color)),
                                      fontSize: lng?.header3.size.toDouble(),
                                      fontWeight: FontWeight.bold),)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 330,
                        height: 38,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(loyaltyGiftDetailsPage.body.redeemButton.backGroundColor))),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Colors.transparent, width: 1.5)
                                )
                            ),


                          ),
                          child:
                          Text(
                           loyaltyGiftDetailsPage.body.redeemButton.data,
                            style: TextStyle(
                                fontFamily:lng?.header5.textFamily,
                                color: Color(int.parse(loyaltyGiftDetailsPage.body.redeemButton.color)),
                                fontSize: lng?.header5.size.toDouble()
                            ),),
                          // Text(
                          //   getTranslated(context, "redeem")!,
                          //   style: TextStyle(
                          //       fontFamily: getTranslated(context, "fontFamilyBody")!,
                          //       color: Colors.white, fontSize: 20
                          //   ),),

                        )
                    ),
                    SizedBox(

                      child: DecoratedBox(

                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: GiftFriend(),
                              withNavBar: true,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation
                                  .cupertino,
                            );
                          },
                          child:
                          Text(
                            loyaltyGiftDetailsPage.body.sendAsGiftButton.data,
                            style: TextStyle(
                              fontSize: lng?.header3.size.toDouble(),
                              fontWeight: FontWeight.w400,
                              fontFamily: lng?.header3.textFamily,),
                            textAlign: TextAlign.center,
                          ),
                          // Text(
                          //   getTranslated(context, "sendAsGift")!,
                          //   style: TextStyle(fontSize: 15,
                          //     fontWeight: FontWeight.w400,
                          //     fontFamily: getTranslated(
                          //         context, "fontFamilyBody")!,),
                          //   textAlign: TextAlign.center,),

                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),

          )
        ],
      )
      :LoadingPage()
      ;
    });

  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/gifts_provider/models/gift.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_friend.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../models/AppThemeModels/DesignPerPage/Loyalty-GiftDetailsPage/loyalty_gift_detail_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GiftDetails extends StatefulWidget{
  final Gift? giftDetails ;
  const GiftDetails({super.key,required this.giftDetails});
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
                  size: double.parse(loyaltyGiftDetailsPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(loyaltyGiftDetailsPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyGiftDetailsPage?.appBar.backIcon.mobileSize as String),
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
                    // Text(
                    //   loyaltyGiftDetailsPage.body.pageTitle.data,
                    //   style: TextStyle(
                    //       fontFamily: lng?.header5.textFamily,
                    //       color: Color(int.parse(loyaltyGiftDetailsPage.body.pageTitle.color)),
                    //       fontSize: lng?.header5.size.toDouble()
                    //   ),),

                    // Text(
                    //   getTranslated(context, "welcomeToOFFamily")!,
                    //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                    //       color: Colors.amber,
                    //       fontSize: 25
                    //   ),),
                    Text(
                      "${widget.giftDetails!.name!}",
                      // getTranslated(context, "registrationGift")!,
                      style:  TextStyle(
                          fontFamily: lng?.header5.textFamily,
                          color: Color(int.parse(loyaltyGiftDetailsPage.body.giftTitle.color)),
                          fontSize: lng?.header5.size.toDouble()
                      ),),
                    const SizedBox(height: 25,),
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(28.0),
                    //     child: ListView(
                    //       children: [
                    //
                    //         Row(
                    //           children: [
                    //             Text(
                    //               "${loyaltyGiftDetailsPage.body.voucher.title.data}:",
                    //               style: TextStyle(
                    //                   fontFamily: lng?.header5.textFamily,
                    //                   color: Color(int.parse(loyaltyGiftDetailsPage.body.voucher.title.color)),
                    //                   fontSize: lng?.header5.size.toDouble(),
                    //                   fontWeight: FontWeight.bold),),
                    //             // Text(
                    //             //   "${getTranslated(context, "voucherTitle")!}:",
                    //             //   style: TextStyle(
                    //             //       fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                    //             //       color: Colors.white,
                    //             //       fontSize: 20,
                    //             //       fontWeight: FontWeight.bold),),
                    //           ],
                    //         ),
                    //
                    //         Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Text(
                    //               "${getTranslated(context, "voucherBody")!}:",
                    //               style: TextStyle(
                    //                   fontFamily: lng?.header3.textFamily,
                    //                   color: Color(int.parse(loyaltyGiftDetailsPage.body.voucher.subTitle.color)),
                    //                   fontSize: lng?.header3.size.toDouble(),
                    //                   fontWeight: FontWeight.bold),)),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, right: 28),
                      child: Row(
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
                    ),

                    /// -list of conditions
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 28.0, right: 28),
                        child:
                        ( widget.giftDetails!.giftCategory!.giftConditions!.length!=0)?ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                            //1,
                            widget.giftDetails!.giftCategory!.giftConditions!.length,
                            itemBuilder: (context, index1) =>
                                 ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget.giftDetails!.giftCategory!.giftConditions![index1].giftConditionTranslates!.length,
                                    //widget.giftDetails!.giftCategory!.giftConditions!.length,
                                    itemBuilder: (context, index2) {
                                      String titleOfCondition = widget.giftDetails!.giftCategory!.giftConditions![index1].giftConditionTranslates![index2].title!;
                                      return  Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "- ${titleOfCondition}",
                                            // "${getTranslated(context, "voucherBody")!}",
                                            style: TextStyle(
                                                fontFamily: lng?.header3.textFamily,
                                                color: Color(int.parse(loyaltyGiftDetailsPage.body.voucher.subTitle.color)),
                                                fontSize: lng?.header3.size.toDouble(),
                                                fontWeight: FontWeight.bold),));
                                    }

                                  ),



                        ):
                        Column(
                          children: [
                            Icon(Icons.not_interested_outlined, color: Colors.white60,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                getTranslated(context, "emptyGiftConditions")!,
                                style: TextStyle(
                                    fontFamily: lng?.header3.textFamily,
                                    color: Color(int.parse(loyaltyGiftDetailsPage.body.voucher.subTitle.color)),
                                    fontSize: lng?.header3.size.toDouble(),
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),



                    SizedBox(
                        width: 330,
                        height: 38,
                        child: ElevatedButton(
                          onPressed: (){
                            showRedeemDialog( context, loyaltyGiftDetailsPage!, lng!);
                          },
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
                    const SizedBox(height: 20,),
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


  void showRedeemDialog(BuildContext context,LoyaltyGiftDetailsPage? loyaltyGiftDetailsPage,Language? lng   ) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (dialogContext, __, ___) {
        return Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 350,
                    constraints:const BoxConstraints(maxWidth: 450, ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding:const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(40)),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,

                      body:Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                           /// -  Title fixed
                            Align(child:Text( loyaltyGiftDetailsPage!.body.redeemDialog.dialogTitle!.data,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Color(int.parse(loyaltyGiftDetailsPage!.body.redeemDialog.dialogTitle!.color!)), fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),),
                            const SizedBox(height: 10,),
                           /// - gift name
                            Align(child:Text( widget.giftDetails!.name!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Color(int.parse(loyaltyGiftDetailsPage.body.giftTitle.color)), fontSize: double.parse(getTranslated(context, "cartpageHeader3")!)),),),
                            const SizedBox(height: 10,),
                            /// - Code & QR
                            QrImageView(
                              data: '${widget.giftDetails!.code!}',
                              version: QrVersions.auto,
                              backgroundColor: Colors.white,
                              size: 150.0,
                            ),


                            Expanded(
                              child: Align(child:Text(
                                widget.giftDetails!.code!,
                                  style: TextStyle(
                                      fontFamily:lng?.header3.textFamily,
                                      color: Color(int.parse(loyaltyGiftDetailsPage.body.redeemDialog.codeTitle!.color)),
                                      fontSize: lng?.header5.size.toDouble()
                                  ),
                                ),),
                            ),


                            /// - button
                            SizedBox(
                                width: 200,
                                height: 38,
                                child: ElevatedButton(
                                  onPressed: ()  async {


                                    await Clipboard.setData( ClipboardData(text: "${widget.giftDetails!.code}")).then((value) {
                                      Fluttertoast.showToast(
                                          msg: "${getTranslated(context, "promoCodeCopiedSuccessfully")}",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.amber.withOpacity(0.8),
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );

                                    });
                                   // copied successfully
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(loyaltyGiftDetailsPage!.body.redeemButton.backGroundColor))),
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
                                   loyaltyGiftDetailsPage.body.redeemDialog.copyPromoCodButton!.data,
                                    // loyaltyGiftDetailsPage!.body.redeemButton.data,
                                    style: TextStyle(
                                        fontFamily:lng?.header3.textFamily,
                                        color: Color(int.parse(loyaltyGiftDetailsPage.body.redeemDialog.copyPromoCodButton!.color)),
                                        fontSize: lng?.header3.size.toDouble()
                                    ),),
                                  // Text(
                                  //   getTranslated(context, "redeem")!,
                                  //   style: TextStyle(
                                  //       fontFamily: getTranslated(context, "fontFamilyBody")!,
                                  //       color: Colors.white, fontSize: 20
                                  //   ),),

                                )
                            ),

                            const SizedBox(height: 10,),
                            Text(
                              loyaltyGiftDetailsPage.body.redeemDialog.dineInTitle!.data,
                              // loyaltyGiftDetailsPage!.body.redeemButton.data,
                              style: TextStyle(
                                  fontFamily:lng?.header1.textFamily,
                                  color: Color(int.parse(loyaltyGiftDetailsPage.body.redeemDialog.dineInTitle!.color)),
                                  fontSize: lng?.header1.size.toDouble()
                              ),),

                            // Expanded(child: ListView(
                            //   padding: EdgeInsets.all(18),
                            //   children: [
                            //     Text("${getTranslated(context, "terms")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white),),
                            //   ],
                            // )),
                          ],

                        ),
                      ),
                    )
                ),
              ),



              Positioned(
                top: 1,
                right: 20,
                child:  SizedBox(
                  width:40,
                  height:40,

                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
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
                      child: const Icon(Icons.close, color: Colors.white,)
                  ),
                ),),
            ],
          ),

        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        }
        else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }


}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-GiftDetailsPage/loyalty_gift_detail_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/models/gift_for_sale.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_friend.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/buy_gift_payment_sheet.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';



class GiftForSaleDetailsPage extends StatefulWidget{
   static const routeName = 'GiftForSaleDetails';
   final GiftForSale giftForSale ;
   GiftForSaleDetailsPage({super.key, required this.giftForSale});

  @override
  State<GiftForSaleDetailsPage> createState() => _GiftForSaleDetailsPageState();
}

class _GiftForSaleDetailsPageState extends State<GiftForSaleDetailsPage> {
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
               Background(),
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
                   title: MyText(
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
                         // MyText(
                         //   loyaltyGiftDetailsPage.body.pageTitle.data,
                         //   style: TextStyle(
                         //       fontFamily: lng?.header5.textFamily,
                         //       color: Color(int.parse(loyaltyGiftDetailsPage.body.pageTitle.color)),
                         //       fontSize: lng?.header5.size.toDouble()
                         //   ),),

                         // MyText(
                         //   getTranslated(context, "welcomeToOFFamily")!,
                         //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                         //       color: Colors.amber,
                         //       fontSize: 25
                         //   ),),
                         MyText(
                           "${widget.giftForSale!.name!}",
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
                         //             MyText(
                         //               "${loyaltyGiftDetailsPage.body.voucher.title.data}:",
                         //               style: TextStyle(
                         //                   fontFamily: lng?.header5.textFamily,
                         //                   color: Color(int.parse(loyaltyGiftDetailsPage.body.voucher.title.color)),
                         //                   fontSize: lng?.header5.size.toDouble(),
                         //                   fontWeight: FontWeight.bold),),
                         //             // MyText(
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
                         //             child: MyText(
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
                               MyText(
                                 "${loyaltyGiftDetailsPage.body.voucher.title.data}:",
                                 style: TextStyle(
                                     fontFamily: lng?.header5.textFamily,
                                     color: Color(int.parse(loyaltyGiftDetailsPage.body.voucher.title.color)),
                                     fontSize: lng?.header5.size.toDouble(),
                                     fontWeight: FontWeight.bold),),
                               // MyText(
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
                             ( widget.giftForSale!.giftConditions!.length!=0)?ListView.builder(
                               shrinkWrap: true,
                               itemCount:
                               //1,
                               widget.giftForSale!.giftConditions!.length,
                               itemBuilder: (context, index1) =>
                                   ListView.builder(
                                       physics: ClampingScrollPhysics(),
                                       shrinkWrap: true,
                                       itemCount: widget.giftForSale!.giftConditions![index1].giftConditionTranslates!.length,
                                       //widget.giftDetails!.giftCategory!.giftConditions!.length,
                                       itemBuilder: (context, index2) {
                                         String titleOfCondition = widget.giftForSale!.giftConditions![index1].giftConditionTranslates![index2].title!;
                                         return  Align(
                                             alignment: Alignment.centerLeft,
                                             child: MyText(
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
                                   child: MyText(
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
                                 showModalBottomSheet(
                                   // expand: false,
                                     context: context,
                                     backgroundColor: Colors
                                         .transparent,
                                     builder: (context) =>
                                         DraggableScrollableSheet(
                                             initialChildSize: 0.5,
                                             minChildSize: 0.3,
                                             maxChildSize: 0.6,
                                             expand: true,
                                             builder: (context,
                                                 scrollController) {
                                               return BuyGiftPaymentSheet(
                                                   scrollController: scrollController);
                                             }

                                         )
                                 );
                                 // showRedeemDialog( context, loyaltyGiftDetailsPage!, lng!);
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
                               MyText("Buy Now",
                                 // loyaltyGiftDetailsPage.body.redeemButton.data,
                                 style: TextStyle(
                                     fontFamily:lng?.header5.textFamily,
                                     color: Color(int.parse(loyaltyGiftDetailsPage.body.redeemButton.color)),
                                     fontSize: lng?.header5.size.toDouble()
                                 ),),
                               // MyText(
                               //   getTranslated(context, "redeem")!,
                               //   style: TextStyle(
                               //       fontFamily: getTranslated(context, "fontFamilyBody")!,
                               //       color: Colors.white, fontSize: 20
                               //   ),),

                             )
                         ),
                         // SizedBox(
                         //
                         //   child: DecoratedBox(
                         //
                         //     decoration: const BoxDecoration(
                         //       border: Border(
                         //         bottom: BorderSide(color: Colors.white),
                         //       ),
                         //     ),
                         //     child: TextButton(
                         //       style: TextButton.styleFrom(
                         //         foregroundColor: Colors.white,
                         //       ),
                         //       onPressed: () {
                         //         // print("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${GiftFriend.routeName}");
                         //         // context.push("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${GiftFriend.routeName}" );
                         //
                         //         PersistentNavBarNavigator.pushNewScreen(
                         //           context,
                         //           screen: GiftFriend(),
                         //           withNavBar: true,
                         //           // OPTIONAL VALUE. True by default.
                         //           pageTransitionAnimation: PageTransitionAnimation
                         //               .cupertino,
                         //         );
                         //       },
                         //       child:
                         //       MyText(
                         //         loyaltyGiftDetailsPage.body.sendAsGiftButton.data,
                         //         style: TextStyle(
                         //           fontSize: lng?.header3.size.toDouble(),
                         //           fontWeight: FontWeight.w400,
                         //           fontFamily: lng?.header3.textFamily,),
                         //         textAlign: TextAlign.center,
                         //       ),
                         //       // MyText(
                         //       //   getTranslated(context, "sendAsGift")!,
                         //       //   style: TextStyle(fontSize: 15,
                         //       //     fontWeight: FontWeight.w400,
                         //       //     fontFamily: getTranslated(
                         //       //         context, "fontFamilyBody")!,),
                         //       //   textAlign: TextAlign.center,),
                         //
                         //     ),
                         //   ),
                         // ),
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
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/network_constants.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/NetworkPaymentProvider/network_two_stage_payment_provider.dart';
import 'package:operation_falafel/screens/network%20payment%20web%20page/authentication_screen.dart';
import 'package:operation_falafel/widgets/Slider/placing_loyalty_order_model.dart';
import 'package:operation_falafel/widgets/loading_widget.dart';
import 'package:operation_falafel/widgets/payment_checkboxlist.dart';
import 'package:operation_falafel/widgets/placing_order_model.dart';
import 'package:provider/provider.dart';

import '../models/AppThemeModels/DesignPerPage/Loyalty-PaymentSheet/loyalty_payment_sheet.dart';
import '../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../providers/AppTheme/theme_provider.dart';
import '../providers/palcing_order_model_provider.dart';
import '../providers/tab_index_generator_provider.dart';
import 'loading_page.dart';

class BuyGiftPaymentSheet extends StatefulWidget{
  ScrollController? scrollController;
  BuyGiftPaymentSheet({super.key,this.scrollController});

  @override
  State<BuyGiftPaymentSheet> createState() => _BuyGiftPaymentSheetState();
}

class _BuyGiftPaymentSheetState extends State<BuyGiftPaymentSheet> {

  bool checkboxBool = false;
  ValueChanged _valueChangedHandler() {
    return (value) => setState(() {
      print(value);

      checkboxBool = !checkboxBool;


    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider,AuthProvider>(builder: (context, appTheme,authProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyPaymentSheet? loyaltyPaymentSheet = appTheme.appTheme.designPerPage?.loyaltyPaymentSheet;
      bool loadingDesign = loyaltyPaymentSheet != null;

      return
        (loadingDesign)?
        Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)
                )
            ),
            padding: const EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                          loyaltyPaymentSheet.sheetTile.data,
                          style: TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              fontSize: lng?.header3.size.toDouble(),
                              fontWeight: FontWeight.w400,
                              color: Color(int.parse(loyaltyPaymentSheet.sheetTile.color))
                          )),
                      // MyText(
                      //     getTranslated(context, "payment")!,
                      //     style: TextStyle(
                      //         fontFamily: getTranslated(
                      //             context, "fontFamilyBody")!,
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.w400,
                      //         color: Colors.amber
                      //     )),

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: ImageIcon(
                          NetworkImage(loyaltyPaymentSheet.sheetCloseIcon.imageIcon),
                          size: double.parse(loyaltyPaymentSheet?.sheetCloseIcon.mobileSize as String),
                          color: Colors.white,
                        )
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //     icon: Icon(Icons.close, color: Colors.white,)),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey,),
                ListTile(
                  title:
                  MyText(
                    loyaltyPaymentSheet.selectPaymentTitle.data,
                    style: TextStyle(
                        fontSize: lng?.header3.size.toDouble(),
                        fontFamily: lng?.header3.textFamily,
                        color: Color(int.parse(loyaltyPaymentSheet.selectPaymentTitle.color)),
                        fontWeight: FontWeight.bold
                    ),),
                  // MyText(
                  //   getTranslated(context, "pleaseSelectPaymentType")!,
                  //   style: TextStyle(
                  //       fontSize: 15,
                  //       fontFamily: getTranslated(context, "fontFamilyBody")!,
                  //       color: Colors.amber,
                  //       fontWeight: FontWeight.bold
                  //   ),),
                  // subtitle:MyText("perfect for shharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),

                ),
                // const Expanded(child:  SizedBox(height: 10,)),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                          controller: widget.scrollController,
                          padding: const EdgeInsets.only(top: 0),
                          children: [
                            PaymentCheckboxList(
                              paymentImage1: "assets/images/master_card.png",
                              paymentImage2: "assets/images/visa_card.png",
                              value: checkboxBool,
                              onChanged: _valueChangedHandler(),
                              label: '1',
                              text: 'Credit/Debit',
                              colorOfBox: Colors.white,
                              colorOfText: Color(int.parse(loyaltyPaymentSheet.checkBox.title.color)),

                            )

                          ]),
                    ))

              ],
            ),

          ),
        ),
          bottomSheet:  Visibility(
            visible: checkboxBool,
            child: SizedBox(
              width:   MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(

                onPressed: () {
                  /// - Network payment process
                  if(authProvider.loggedInUser!=null){
                    /// - Show creating order sheet model
                   print("show sheet");
                    showModalBottomSheet(
                      // expand: false,
                        isDismissible: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (modelContext) => PlacingLoyaltyOrderModel(context, )).then((value) {

                        // if (Provider.of<PlacingOrderModelProvider>(context, listen: false).makeOrderProgress == 1){
                      //   /// - show loading
                      //   _showMakingOrderDialog(context);
                      //
                      //   print('requesting to access token...');
                      //   Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestAccessToken(NetworkConstants.networkAuthorizationApiKey).then((value) {
                      //     String? accessToken = Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestTokenResponse.accessToken;
                      //     print('creating order...');
                      //     Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrder(accessToken!,NetworkConstants.outletReference).then((value) {
                      //       //  print(paymentUrl!);
                      //       // _launchURL(paymentUrl!);
                      //
                      //       String?  orderReference= Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrderResponse.embedded!.payment![0].orderReference;
                      //       String?  paymentReference= Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrderResponse.embedded!.payment![0].id;
                      //       String? paymentUrl = Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrderResponse.embedded!.payment![0].links!.paymentCard!.href;
                      //       String? directPaymentUrl = Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrderResponse.links!.payment!.href;
                      //
                      //       print(paymentUrl);
                      //       print("Submit payment card information...");
                      //       Navigator.of(context, rootNavigator: true).pop();
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => AuthenticationScreen(
                      //             // authenticationUrl: '${href}',
                      //             // acsPaReq: '${acsPaReq}',
                      //             // acsMd: '${acsMd}',
                      //             // acsUrl: '${acsurl}',
                      //             // accessToken: accessToken,
                      //             directPaymentLink: directPaymentUrl!,
                      //           ),
                      //         ),
                      //       );
                      //
                      //       // Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformation(paymentUrl!,accessToken).then((value) {
                      //       //
                      //       //   String? acsurl =  Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformationResponse.the3Ds!.acsUrl;
                      //       //   String? acsPaReq =  Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformationResponse.the3Ds!.acsPaReq;
                      //       //   String? acsMd =  Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformationResponse.the3Ds!.acsMd;
                      //       //   String? href =  Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformationResponse.links!.cnp3Ds!.href;
                      //       //
                      //       //
                      //       //   print(acsurl);
                      //       //   print(acsPaReq);
                      //       //   print(acsMd);
                      //       //
                      //       //   Navigator.push(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //       builder: (context) => AuthenticationScreen(
                      //       //         authenticationUrl: '${href}',
                      //       //         acsPaReq: '${acsPaReq}',
                      //       //         acsMd: '${acsMd}',
                      //       //         acsUrl: '${acsurl}',
                      //       //         accessToken: accessToken,
                      //       //       ),
                      //       //     ),
                      //       //   );
                      //       //
                      //       // });
                      //
                      //
                      //     });
                      //
                      //   });
                      //
                      //
                      //
                      // }




                    });
                  }
                  else{
                    Provider.of<TabIndexGenerator>(context, listen: false).setIndex(4);
                  }

                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            side: BorderSide(
                                color: Colors.transparent,
                                width: 0)
                        )
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.white12),
                    elevation: MaterialStateProperty.all(0),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    // MaterialStateProperty.all(Color(int.parse(loyaltyPage.body.buttons.myRewards.backGroundColor))),

                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(const EdgeInsets.only(top: 10, bottom: 10,)),
                    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                child: MyText("Proceed to checkout",
                  style: TextStyle(
                      fontFamily: lng?.header5.textFamily,
                      color:Colors.white,
                      // Color(int.parse(loyaltyPage.body.buttons.myRewards.color)),
                      fontSize: lng?.header5.size.toDouble(),
                      fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
              ),
            ),
          ),

      )
            :LoadingPage();
    });
  }


  void _showMakingOrderDialog(BuildContext context, [bool mounted = true]) async {
    // show the loading dialog
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            // The background color
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                height: 150,
                width: 100,
                // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:  [

                    LoadingWidget(),
                    // The loading indicator
                    // CircularProgressIndicator(
                    //   color: Colors.amber,
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // // Some text
                    // Text(
                    //   'Loading...',
                    //   style: TextStyle(color: Colors.black),
                    // )
                  ],
                ),
              ),
            ),
          );
        });

    // // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
    // await Future.delayed(const Duration(seconds: 3));
    //
    // // Close the dialog programmatically
    // // We use "mounted" variable to get rid of the "Do not use BuildContexts across async gaps" warning
    // if (!mounted) return;
    // Navigator.of(context).pop();
  }

}
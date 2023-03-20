import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/payment_checkboxlist.dart';
import 'package:provider/provider.dart';

import '../models/AppThemeModels/DesignPerPage/Loyalty-PaymentSheet/loyalty_payment_sheet.dart';
import '../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../providers/AppTheme/theme_provider.dart';
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

      checkboxBool = true;


    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
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
                      Text(
                          loyaltyPaymentSheet.sheetTile.data,
                          style: TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              fontSize: lng?.header3.size.toDouble(),
                              fontWeight: FontWeight.w400,
                              color: Color(int.parse(loyaltyPaymentSheet.sheetTile.color))
                          )),
                      // Text(
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
                  Text(
                    loyaltyPaymentSheet.selectPaymentTitle.data,
                    style: TextStyle(
                        fontSize: lng?.header3.size.toDouble(),
                        fontFamily: lng?.header3.textFamily,
                        color: Color(int.parse(loyaltyPaymentSheet.selectPaymentTitle.color)),
                        fontWeight: FontWeight.bold
                    ),),
                  // Text(
                  //   getTranslated(context, "pleaseSelectPaymentType")!,
                  //   style: TextStyle(
                  //       fontSize: 15,
                  //       fontFamily: getTranslated(context, "fontFamilyBody")!,
                  //       color: Colors.amber,
                  //       fontWeight: FontWeight.bold
                  //   ),),
                  // subtitle:Text("perfect for shharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),

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

      )
            :LoadingPage();
    });
  }
}
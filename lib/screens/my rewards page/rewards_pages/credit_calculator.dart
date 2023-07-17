import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/Loyalty-CreditCalculationPage/loyalty_credit_calculation_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class CreditCalculator extends StatefulWidget{
  @override
  State<CreditCalculator> createState() => _CreditCalculatorState();
}

class _CreditCalculatorState extends State<CreditCalculator> {

  TextEditingController amountController =new TextEditingController();
  TextEditingController earnedCreditsController =new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyCreditCalculationPage? loyaltyCreditCalculationPage = appTheme.appTheme.designPerPage?.loyaltyCreditCalculationPage;
      bool loadingDesign = loyaltyCreditCalculationPage != null;


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

            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(loyaltyCreditCalculationPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyCreditCalculationPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(loyaltyCreditCalculationPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyCreditCalculationPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: MyText(
                loyaltyCreditCalculationPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 450,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          SizedBox(height: 25,),

                          /// - Title
                          MyText(
                            loyaltyCreditCalculationPage.body.pageTitle.data,
                            style: TextStyle(
                                fontFamily: lng?.titleHeader2.textFamily,
                                color: Color(int.parse(loyaltyCreditCalculationPage.body.pageTitle.color)),
                                fontSize: lng?.titleHeader2.size.toDouble()),
                              textAlign: TextAlign.center,
                          ),

                          // MyText(
                          //   getTranslated(context, "creditCalculator")!,
                          //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                          //       color: Colors.amber,
                          //       fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),
                          //   textAlign: TextAlign.center,
                          // ),
                          SizedBox(height: 25,),

                          /// - enterAmount
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,
                                right: 18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    // width: 295,
                                    height: 50,
                                    child: TextField(
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                      autofocus: false,
                                      style: const TextStyle(
                                          color: Colors.white70),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),


                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0),
                                        ),
                                        hintText: loyaltyCreditCalculationPage.body.form.enterAmount.data,
                                        hintStyle: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(loyaltyCreditCalculationPage.body.form.enterAmount.color))
                                        ),

                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          earnedCreditsController.text =
                                              (double.parse(value) * 0.15)
                                                  .toString();
                                        } else {
                                          earnedCreditsController.text = "";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Image.asset(
                            "assets/images/arrow_down.png", height: 100,),
                          const SizedBox(height: 25,),

                          /// - earned credits
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,
                                right: 18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    // width: 295,
                                    height: 50,
                                    child: TextField(
                                      controller: earnedCreditsController,
                                      enabled: false,
                                      keyboardType: TextInputType.number,
                                      autofocus: false,
                                      style: const TextStyle(
                                          color: Colors.white70),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black,
                                        contentPadding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        border: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),


                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),


                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0),
                                        ),
                                        hintText: loyaltyCreditCalculationPage.body.form.earnedCredit.data,
                                        hintStyle: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(loyaltyCreditCalculationPage.body.form.earnedCredit.color))
                                        ),

                                      ),

                                    ),
                                  ),
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
        ],
      )
      : const LoadingPage();
    });

  }
}
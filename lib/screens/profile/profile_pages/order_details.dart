import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/OrderDetailsPage/order_details_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class OrderDetails extends StatefulWidget{
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      OrderDetailsPage? orderDetailsPage = appTheme.appTheme.designPerPage?.orderDetailsPage;
      bool loadingDesign = orderDetailsPage != null;

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
                  NetworkImage(orderDetailsPage.appBar.backIcon.imageIcon),
                  size: double.parse(orderDetailsPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(orderDetailsPage.appBar.backIcon.imageIcon),
                  size: double.parse(orderDetailsPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: MyText(
                orderDetailsPage.appBar.title.data,
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
                    MyText(
                      orderDetailsPage.body.pageTitle.data,
                      style: TextStyle(
                        fontFamily: lng?.titleHeader2.textFamily,
                          color: Color(int.parse(orderDetailsPage.body.pageTitle.color)),
                          fontSize: lng?.titleHeader2.size.toDouble()
                      ),),

                    // MyText(getTranslated(context, "orderDetails")!,
                    //   style: TextStyle(fontFamily: "${getTranslated(
                    //       context, "fontFamilyButtons")!}",
                    //       color: Colors.amber,
                    //       fontSize: double.parse(getTranslated(
                    //           context, "fontFamilyTitleُSize")!)),),

                    /// - New Order
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                getTranslated(context, "newOrder")!,
                                style: TextStyle(
                                    fontFamily: lng?.header3.textFamily,
                                    color: Color(int.parse(orderDetailsPage.body.orderTile.orderTitle.color)),
                                    fontSize: lng?.header3.size.toDouble()
                                ),
                              ),
                              // MyText(
                              //   getTranslated(context, "newOrder")!,
                              //   style: TextStyle(
                              //       fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                              //       color: Colors.green,
                              //       fontSize: 15
                              //   ),
                              // ),

                              MyText(
                                "2022-10-19 20:22:17",
                                style: TextStyle(
                                    fontFamily: lng?.header3.textFamily,
                                    color: Color(int.parse(orderDetailsPage.body.orderTile.orderSubTitle.color)),
                                    fontSize: lng?.header3.size.toDouble()
                                ),
                              ),

                            ],),

                          const Expanded(child: SizedBox(width: 15,)),
                          Column(
                            children: [

                              SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: null,
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Color(int.parse(orderDetailsPage.body.orderTile.reorder.backGroundColor))),
                                      foregroundColor: MaterialStateProperty
                                          .all<Color>(Colors.black),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(5.0),
                                              side: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.5)
                                          )
                                      ),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.only(left: 10, right: 10)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        ImageIcon(
                                          NetworkImage(orderDetailsPage.body.orderTile.reorder.icon.imageIcon),
                                          size: double.parse(orderDetailsPage.body.orderTile.reorder.icon.mobileSize as String),
                                          color: Colors.white54,
                                        ),
                                        SizedBox(width: 5,),
                                        MyText(
                                            orderDetailsPage.body.orderTile.reorder.data,
                                            style: TextStyle(
                                                fontFamily: lng?.header1.textFamily,
                                                color: Color(int.parse(orderDetailsPage.body.orderTile.reorder.color)),
                                                fontSize: lng?.header1.size.toDouble())),
                                        // MyText(
                                        //     getTranslated(context, "reOrder")!,
                                        //     style: TextStyle(
                                        //         fontFamily: getTranslated(context, "fontFamilyBody")!,
                                        //         color: Colors.white,
                                        //         fontSize: 10)),

                                      ],
                                    ),)

                              )

                            ],
                          ),

                        ],
                      ),
                    ),

                    /// - Order ID
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Row(
                        children: [
                          MyText(
                            "${orderDetailsPage.body.orderId.data}: 999748117",
                            style: TextStyle(
                                fontFamily: lng?.header3.textFamily,
                                color: Color(int.parse(orderDetailsPage.body.orderId.color)),
                                fontSize: lng?.header3.size.toDouble()),),
                          // MyText("${getTranslated(context, "orderId")!}: 999748117",
                          //   style: TextStyle(fontFamily: "${getTranslated(
                          //       context, "fontFamilyBody")!}",
                          //       color: Colors.white70,
                          //       fontSize: 15),),
                        ],
                      ),
                    ),

                    /// - Address
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Row(
                        children: [
                          Expanded(
                              child:
                              MyText(
                                    "${orderDetailsPage.body.addressHeader.data}: Jumeirah Lakes Tower | Flat/Building:mazaya business avenue 2903 | Area:Dubai - Jumeirah Lake Tower - mazaya business avenue BB1 -2903 - mazaya business avenue",
                                     style: TextStyle(
                                    fontFamily: lng?.header3.textFamily,
                                    color: Color(int.parse(orderDetailsPage.body.addressHeader.color)),
                                    fontSize: lng?.header3.size.toDouble()
                                ),
                                  )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Divider(color: Colors.white70,),
                    ),

                    /// - Order summary
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Row(
                        children: [
                          MyText("${orderDetailsPage.body.orderSummaryHeader.data}",
                            style: TextStyle(
                                fontFamily: lng?.header3.textFamily,
                                color: Color(int.parse(orderDetailsPage.body.orderSummaryHeader.color)),
                                fontSize: lng?.header3.size.toDouble()
                            ),
                          ),
                          // MyText("${getTranslated(context, "orderSummary")!}",
                          //   style: TextStyle(fontFamily: "${getTranslated(
                          //       context, "fontFamilyBody")!}",
                          //       color: Colors.white70,
                          //       fontSize: 17),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 8),
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,
                                right: 18,
                                bottom: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                              children: [
                                MyText("X1 Chicken Shawerma Pita",
                                  style: TextStyle(
                                      fontFamily: lng?.header3.textFamily,
                                      color: Color(int.parse(orderDetailsPage.body.orderOptions.optionTitle.color)),
                                      fontSize: lng?.header3.size.toDouble()
                                  ),),
                                MyText("AED 17",  style: TextStyle(
                                    fontFamily: lng?.header3.textFamily,
                                    color: Color(int.parse(orderDetailsPage.body.orderOptions.optionPrice.color)),
                                    fontSize: lng?.header3.size.toDouble()
                                ),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,
                                right: 18,
                                bottom: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                              children: [
                                MyText("X1 Fries Filling", style: TextStyle(
                                    fontFamily: "${getTranslated(
                                        context, "fontFamilyBody")!}",
                                    color: Colors.amber,
                                    fontSize: 15),),
                                MyText("AED 17", style: TextStyle(
                                    fontFamily: "${getTranslated(
                                        context, "fontFamilyBody")!}",
                                    color: Colors.white70,
                                    fontSize: 15),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Divider(color: Colors.white70,),
                    ),

                    /// - Payment Methods
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                orderDetailsPage.body.paymentMethodHeader.data,
                                style: TextStyle(
                                    fontFamily: lng?.header3.textFamily,
                                    color: Color(int.parse(orderDetailsPage.body.paymentMethodHeader.color)),
                                    fontSize: lng?.header3.size.toDouble()),),
                              // MyText(
                              //   getTranslated(context, "paymentMethod")!,
                              //   style: TextStyle(
                              //       fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                              //       color: Colors.amber,
                              //       fontSize: 17),),
                              MyText("Credit/Debit Card",
                                style:TextStyle(
                                    fontFamily: lng?.header3.textFamily,
                                    color: Color(int.parse(orderDetailsPage.body.paymentMethod.color)),
                                    fontSize: lng?.header3.size.toDouble()),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Divider(color: Colors.white70,),
                    ),

                    /// - Order totals

                    /// - sub total
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            orderDetailsPage.body.subTotalHeader.data,
                            style: TextStyle(
                                fontFamily: lng?.header3.textFamily,
                                color: Color(int.parse(orderDetailsPage.body.subTotalHeader.color)),
                                fontSize: lng?.header3.size.toDouble()),),
                          // MyText(
                          //   getTranslated(context, "subTotalDetails")!,
                          //   style: TextStyle(
                          //       fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                          //       color: Colors.white70,
                          //       fontSize: 17),),
                          MyText("AED 17.00", style: TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              color: Color(int.parse(orderDetailsPage.body.subTotalHeader.color)),
                              fontSize: lng?.header3.size.toDouble()),),

                        ],
                      ),
                    ),
                    /// - Loyality
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          MyText(
                            orderDetailsPage.body.oFLoyaltyHeader.data,
                            style:  TextStyle(
                                fontFamily: lng?.header3.textFamily,
                                color: Color(int.parse(orderDetailsPage.body.oFLoyaltyHeader.color)),
                                fontSize: lng?.header3.size.toDouble())),
                          MyText("AED 4.25", style: TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              color: Color(int.parse(orderDetailsPage.body.oFLoyaltyHeader.color)),
                              fontSize: lng?.header3.size.toDouble()),),

                        ],
                      ),
                    ),
                    /// - service charges
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          MyText(orderDetailsPage.body.serviceChargeHeader.data,
                            style:  TextStyle(
                                fontFamily: lng?.header3.textFamily,
                                color: Color(int.parse(orderDetailsPage.body.serviceChargeHeader.color)),
                                fontSize: lng?.header3.size.toDouble())),
                          MyText("AED 4.25", style:  TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              color: Color(int.parse(orderDetailsPage.body.serviceChargeHeader.color)),
                              fontSize: lng?.header3.size.toDouble())),

                        ],
                      ),
                    ),
                    /// - Total
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          MyText(orderDetailsPage.body.totalHeader.data,
                            style: TextStyle(
                                fontFamily: lng?.header3.textFamily,
                                color: Color(int.parse(orderDetailsPage.body.totalHeader.color)),
                                fontSize: lng?.header3.size.toDouble())),
                          MyText("AED 19.75", style:TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              color: Color(int.parse(orderDetailsPage.body.totalHeader.color)),
                              fontSize: lng?.header3.size.toDouble())),

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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/OrderHistoryPage/order_history_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';
import 'add_new_address.dart';
import 'order_details.dart';

class OrderHistory extends StatelessWidget{
  static const routeName = 'OrderHistory';
  @override
  Widget build(BuildContext context) {

  return  Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      OrderHistoryPage? orderHistoryPage= appTheme.appTheme.designPerPage?.orderHistoryPage;
      ///- Change after design


      bool loadingDesign = orderHistoryPage != null;

             return
               (loadingDesign)?
               Stack(
                  children: [
                    Background(),
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar:  AppBar(
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                          (Localizations.localeOf(context).languageCode == 'en') ?
                          ImageIcon(
                            NetworkImage(orderHistoryPage.appBar.backIcon.imageIcon),
                            size: double.parse(orderHistoryPage?.appBar.backIcon.mobileSize as String),
                          ) :
                          ImageIcon(
                            NetworkImage(orderHistoryPage.appBar.backIcon.imageIcon),
                            size: double.parse(orderHistoryPage?.appBar.backIcon.mobileSize as String),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        centerTitle: true,
                        title: MyText(
                          orderHistoryPage.appBar.title.data,
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
                              MyText(
                                orderHistoryPage.body.pageTitle.data,
                                style: TextStyle(
                                    fontFamily:lng?.titleHeader2.textFamily,
                                    color: Color(int.parse(orderHistoryPage.body.pageTitle.color)),
                                    fontSize:lng?.titleHeader2.size.toDouble()
                                ),),

                              // MyText(getTranslated(context, "orderHistory")!,
                              //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                              //       color: Colors.amber,
                              //       fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),




                              const SizedBox(height: 15,),
                              Expanded(
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          /// - Image
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                  height: 25,
                                                  child: VerticalDivider(
                                                    color: Colors.white, thickness: 4,)),

                                              Image.network(orderHistoryPage.body.orderList.orderIcon.imageIcon, height: 40, fit: BoxFit.cover,),
                                              // Image.asset('assets/images/page2orders_icon.png', height: 40, fit: BoxFit.cover,),

                                              const SizedBox(
                                                  height: 25,
                                                  child: VerticalDivider(
                                                    color: Colors.white, thickness: 4,)),
                                            ],
                                          ),


                                          /// - Text
                                          const SizedBox(width: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText(getTranslated(context, "newOrder")!,
                                                style: TextStyle(
                                                    fontFamily: lng?.header3.textFamily,
                                                    color: Color(int.parse(orderHistoryPage.body.orderList.orderTitle.color)),
                                                    fontSize: lng?.header3.size.toDouble()
                                                ),
                                                // style: TextStyle(
                                                //     fontFamily: "${getTranslated(
                                                //         context, "fontFamilyBody")!}",
                                                //     color: Colors.green,
                                                //     fontSize: 15),
                                              ),
                                              MyText("2022-10-19 20:22:17",

                                                style: TextStyle(
                                                    fontFamily: lng?.header3.textFamily,
                                                    color: Color(int.parse(orderHistoryPage.body.orderList.orderSubTitle.color)),
                                                    fontSize: lng?.header3.size.toDouble()
                                                ),


                                                // style: TextStyle(
                                                    // fontFamily: "${getTranslated(
                                                    //     context, "fontFamilyBody")!}",
                                                    // color: Colors.white54,
                                                    // fontSize: 15),
                                              ),

                                            ],),

                                          /// - buttons
                                          const Expanded(child: SizedBox(width: 15,)),
                                          Column(
                                            children: [
                                              SizedBox(
                                                  height: 30,
                                                  width: 110,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${OrderDetails.routeName}");

                                                      // PersistentNavBarNavigator.pushNewScreen(
                                                      //   context,
                                                      //   screen: OrderDetails(),
                                                      //   withNavBar: true,
                                                      //   // OPTIONAL VALUE. True by default.
                                                      //   pageTransitionAnimation: PageTransitionAnimation
                                                      //       .cupertino,
                                                      // );
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(orderHistoryPage.body.orderList.viewReceipt.backGroundColor))),
                                                      // backgroundColor: MaterialStateProperty.all<Color>(Colors.black45),
                                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(5.0),
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.5)
                                                          )
                                                      ),
                                                      padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ImageIcon(
                                                          NetworkImage(orderHistoryPage.body.orderList.viewReceipt.icon.imageIcon),
                                                          size: double.parse(orderHistoryPage.body.orderList.viewReceipt.icon.mobileSize as String),
                                                          color: Colors.white54,
                                                        ),
                                                        // Icon(
                                                        //   Icons.document_scanner_outlined,
                                                        //   color: Colors.white54,
                                                        //   size: 14,),
                                                        SizedBox(width: 5,),
                                                        MyText( orderHistoryPage.body.orderList.viewReceipt.data,
                                                            style: TextStyle(
                                                                fontFamily: lng?.header1.textFamily,
                                                                color: Color(int.parse(orderHistoryPage.body.orderList.viewReceipt.color)),
                                                                fontSize: lng?.header1.size.toDouble())
                                                        ),
                                                        // MyText(getTranslated(context, "viewReceipt")!,
                                                        //     style: TextStyle(
                                                        //         fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                        //         color: Colors.white,
                                                        //         fontSize: 10)
                                                        // ),

                                                      ],
                                                    ),)

                                              ),
                                              const SizedBox(height: 5,),
                                              SizedBox(
                                                  height: 30,
                                                  width: 110,
                                                  child: ElevatedButton(
                                                    onPressed: null,
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty
                                                          .all<Color>(Color(int.parse(orderHistoryPage.body.orderList.reorder.backGroundColor))),
                                                      foregroundColor: MaterialStateProperty
                                                          .all<Color>(Colors.black),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),
                                                              side: const BorderSide(
                                                                  color: Colors.transparent,
                                                                  width: 1.5)
                                                          )
                                                      ),
                                                      padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        ImageIcon(
                                                          NetworkImage(orderHistoryPage.body.orderList.reorder.icon.imageIcon),
                                                          size: double.parse(orderHistoryPage.body.orderList.reorder.icon.mobileSize as String),
                                                          color: Colors.white54,
                                                        ),
                                                        SizedBox(width: 5,),
                                                        MyText(
                                                            orderHistoryPage.body.orderList.reorder.data,
                                                            style: TextStyle(
                                                                fontFamily: lng?.header1.textFamily,
                                                                color: Color(int.parse(orderHistoryPage.body.orderList.reorder.color)),
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          /// - Image
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                  height: 25,
                                                  child: VerticalDivider(
                                                    color: Colors.white, thickness: 4,)),
                                              Image.asset(
                                                'assets/images/page2orders_icon.png',
                                                height: 40, fit: BoxFit.cover,),
                                              const SizedBox(
                                                  height: 25,
                                                  child: VerticalDivider(
                                                    color: Colors.white, thickness: 4,)),
                                            ],
                                          ),


                                          /// - Text
                                          const SizedBox(width: 15,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              MyText(getTranslated(context, "newOrder")!,
                                                style: TextStyle(
                                                    fontFamily: lng?.header3.textFamily,
                                                    color: Color(int.parse(orderHistoryPage.body.orderList.orderTitle.color)),
                                                    fontSize: lng?.header3.size.toDouble()
                                                ),
                                                // style: TextStyle(
                                                //     fontFamily: "${getTranslated(
                                                //         context, "fontFamilyBody")!}",
                                                //     color: Colors.green,
                                                //     fontSize: 15),
                                              ),
                                              MyText("2022-10-19 20:22:17",

                                                style: TextStyle(
                                                    fontFamily: lng?.header3.textFamily,
                                                    color: Color(int.parse(orderHistoryPage.body.orderList.orderSubTitle.color)),
                                                    fontSize: lng?.header3.size.toDouble()
                                                ),


                                                // style: TextStyle(
                                                // fontFamily: "${getTranslated(
                                                //     context, "fontFamilyBody")!}",
                                                // color: Colors.white54,
                                                // fontSize: 15),
                                              ),

                                            ],),

                                          /// - buttons
                                          const Expanded(child: SizedBox(width: 15,)),
                                          Column(
                                            children: [
                                              SizedBox(
                                                  height: 30,
                                                  width: 110,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      PersistentNavBarNavigator.pushNewScreen(
                                                        context,
                                                        screen: OrderDetails(),
                                                        withNavBar: true,
                                                        // OPTIONAL VALUE. True by default.
                                                        pageTransitionAnimation: PageTransitionAnimation
                                                            .cupertino,
                                                      );
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(orderHistoryPage.body.orderList.viewReceipt.backGroundColor))),
                                                      // backgroundColor: MaterialStateProperty.all<Color>(Colors.black45),
                                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(5.0),
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.5)
                                                          )
                                                      ),
                                                      padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ImageIcon(
                                                          NetworkImage(orderHistoryPage.body.orderList.viewReceipt.icon.imageIcon),
                                                          size: double.parse(orderHistoryPage.body.orderList.viewReceipt.icon.mobileSize as String),
                                                          color: Colors.white54,
                                                        ),
                                                        // Icon(
                                                        //   Icons.document_scanner_outlined,
                                                        //   color: Colors.white54,
                                                        //   size: 14,),
                                                        SizedBox(width: 5,),
                                                        MyText( orderHistoryPage.body.orderList.viewReceipt.data,
                                                            style: TextStyle(
                                                                fontFamily: lng?.header1.textFamily,
                                                                color: Color(int.parse(orderHistoryPage.body.orderList.viewReceipt.color)),
                                                                fontSize: lng?.header1.size.toDouble())
                                                        ),
                                                        // MyText(getTranslated(context, "viewReceipt")!,
                                                        //     style: TextStyle(
                                                        //         fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                        //         color: Colors.white,
                                                        //         fontSize: 10)
                                                        // ),

                                                      ],
                                                    ),)

                                              ),
                                              const SizedBox(height: 5,),
                                              SizedBox(
                                                  height: 30,
                                                  width: 110,
                                                  child: ElevatedButton(
                                                    onPressed: null,
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty
                                                          .all<Color>(Color(int.parse(orderHistoryPage.body.orderList.reorder.backGroundColor))),
                                                      foregroundColor: MaterialStateProperty
                                                          .all<Color>(Colors.black),
                                                      shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),
                                                              side: const BorderSide(
                                                                  color: Colors.transparent,
                                                                  width: 1.5)
                                                          )
                                                      ),
                                                      padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        ImageIcon(
                                                          NetworkImage(orderHistoryPage.body.orderList.reorder.icon.imageIcon),
                                                          size: double.parse(orderHistoryPage.body.orderList.reorder.icon.mobileSize as String),
                                                          color: Colors.white54,
                                                        ),
                                                        SizedBox(width: 5,),
                                                        MyText(
                                                            orderHistoryPage.body.orderList.reorder.data,
                                                            style: TextStyle(
                                                                fontFamily: lng?.header1.textFamily,
                                                                color: Color(int.parse(orderHistoryPage.body.orderList.reorder.color)),
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
                :const LoadingPage();
    });



  }
  
}
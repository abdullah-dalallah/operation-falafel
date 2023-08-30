import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-MyGiftsPage/loyalty_my_gifts_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:provider/provider.dart';

import '../models/AppThemeModels/DesignPerPage/CartPage/cart_page.dart';
import 'cart_gifts_sheet.dart';

class CartGiftsWidget extends StatefulWidget{
  final CartPage? cartPage;
  final Language? lng;
  const CartGiftsWidget({required this.lng, required this.cartPage, super.key});

  @override
  State<CartGiftsWidget> createState() => _CartGiftsWidgetState();
}

class _CartGiftsWidgetState extends State<CartGiftsWidget> {

  @override
  Widget build(BuildContext context) {
    return

      Consumer2<ThemeProvider, LoyaltyProvider>(
        builder: (context, appTheme,loyaltyProvider, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      LoyaltyMyGiftsPage? loyaltyMyGiftsPage = appTheme.appTheme.designPerPage
          ?.loyaltyMyGiftsPage;
      bool loadingDesign = loyaltyMyGiftsPage != null;
      bool giftsListEmpty = loyaltyProvider.gifts == null;
     return Padding(
        padding: const EdgeInsets.all(12.0),
        child: InputDecorator(

          decoration: InputDecoration(
            // labelText: 'XP',
            label: SizedBox(
              width: 112,
              child: Row(
                children: [
                  Image.asset("assets/images/how2.png", height: 35,),

                  /// <---  Add Icon after deploy from server
                  SizedBox(width: 10,),
                  // Icon(Icons.add,color: Colors.white54,),
                  MyText(
                    widget.cartPage!.body.paymentMethods.oFGifts!.borderLabel!
                        .labelTitle!.data!,
                    style: TextStyle(color: Color(int.parse(widget.cartPage!
                        .body.paymentMethods.oFGifts!.borderLabel!.labelTitle!
                        .color!)),
                        fontFamily: widget.lng!.titleHeader2.textFamily,
                        fontSize: widget.lng!.header5.size.toDouble()),)
                ],
              ),
            ),
            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    color: Colors.amber, width: 1.5, style: BorderStyle.solid)
            ),
          ),
          child: Column(
            children: [
              ListTile(
                // tileColor: Colors.green,
                visualDensity: VisualDensity(vertical: -4),
                // dense: true,
                title: MyText(
                  widget.cartPage!.body.paymentMethods.oFGifts!.title!.data!,
                  style: TextStyle(color: Color(int.parse(
                      widget.cartPage!.body.paymentMethods.oFGifts!.title!
                          .color)),
                      fontFamily: widget.lng!.header3.textFamily,
                      fontSize: widget.lng!.header3.size.toDouble()),),
                subtitle: MyText(
                  widget.cartPage!.body.paymentMethods.oFGifts!.subTitle!.data!,
                  style: TextStyle(color: Color(int.parse(
                      widget.cartPage!.body.paymentMethods.oFGifts!.subTitle!
                          .color)),
                      fontFamily: widget.lng!.header2.textFamily,
                      fontSize: widget.lng!.header2.size.toDouble()),),
                trailing: SizedBox(
                  height: 30,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          context: context,

                          backgroundColor: Colors.transparent,
                          builder: (context) =>
                              DraggableScrollableSheet(
                                  initialChildSize: 0.3,
                                  // minChildSize: 0.5,
                                  maxChildSize: 1,
                                  expand: true,
                                  builder: (context, scrollController) {
                                    return CartGiftsSheet(scrollController);
                                  }

                              )


                      );
                    },
                    child: MyText(widget.cartPage!.body.paymentMethods.oFGifts!
                        .chooseButton!.data,
                      style: TextStyle(color: Color(int.parse(widget.cartPage!
                          .body.paymentMethods.oFGifts!.chooseButton!.color)),
                          fontSize: widget.lng!.header2.size.toDouble(),
                          fontWeight: FontWeight.normal,
                          fontFamily: widget.lng!.header2.textFamily),),


                  ),
                ),
              ),

              if(loyaltyProvider.selectedGift!=null)
              /// -Divider
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(100),
                                topRight: Radius.circular(100)
                            )
                        ),
                        child: SizedBox(
                          width: 11,
                          height: 23,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: List.generate(850 ~/ 10, (index) =>
                              Expanded(
                                child: Container(
                                  color: index % 2 == 0 ? Colors.transparent
                                      : Colors.grey,
                                  height: 1,
                                ),
                              )),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                                topLeft: Radius.circular(100)
                            )
                        ),
                        child: SizedBox(
                          width: 11,
                          height: 23,
                        ),
                      ),

                    ],
                  ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title:
                    MyText("${loyaltyProvider.selectedGift!.name}",
                      style: TextStyle(color: Color(int.parse(
                          widget.cartPage!.body.paymentMethods.oFGifts!
                              .selectedVoucher!.title!.color!)),
                          fontSize: widget.lng!.header2.size.toDouble(),
                          fontWeight: FontWeight.bold,
                          fontFamily: widget.lng!.header2.textFamily),),
                    // MyText("Free Delivery. Min order. AED 30.",
                    //   style: TextStyle(color: Color(int.parse(
                    //       widget.cartPage!.body.paymentMethods.oFGifts!
                    //           .selectedVoucher!.title!.color!)),
                    //       fontSize: widget.lng!.header2.size.toDouble(),
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: widget.lng!.header2.textFamily),),
                    trailing: SizedBox(
                      height: 30,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Provider.of<LoyaltyProvider>(context, listen: false).resetSelectGift();
                        },
                        child:
                        MyText(widget.cartPage!.body.paymentMethods.oFGifts!
                            .selectedVoucher!.removeButton!.data,
                          style: TextStyle(color: Color(int.parse(widget.cartPage!
                              .body.paymentMethods.oFGifts!.selectedVoucher!
                              .removeButton!.color!)),
                              fontSize: widget.lng!.header2.size.toDouble(),
                              fontWeight: FontWeight.bold,
                              fontFamily: widget.lng!.header2.textFamily),),


                      ),
                    ),
                    children: [

                      /// -Divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(100),
                                    topRight: Radius.circular(100)
                                )
                            ),
                            child: SizedBox(
                              width: 11,
                              height: 23,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: List.generate(850 ~/ 10, (index) =>
                                  Expanded(
                                    child: Container(
                                      color: index % 2 == 0 ? Colors.transparent
                                          : Colors.grey,
                                      height: 1,
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(100),
                                    topLeft: Radius.circular(100)
                                )
                            ),
                            child: SizedBox(
                              width: 11,
                              height: 23,
                            ),
                          ),

                        ],
                      ),

                      /// -
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: loyaltyProvider.selectedGift!.giftCategory!.giftConditions!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8, left: 18, right: 18),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/page2orders_icon.png",
                                    height: 14,),

                                  /// <---- Add Icon After deploy the Icon in the server
                                  SizedBox(width: 10,),
                                  Expanded(child: MyText(
                                    "${loyaltyProvider.selectedGift!.giftCategory!.giftConditions![index].giftConditionTranslates![0].title}",
                                    style: TextStyle(color: Color(
                                        int.parse(widget.cartPage!.body.paymentMethods.oFGifts!.selectedVoucher!.voucherDetailsList!.title!.color!)),
                                        fontSize: widget.lng!.header1.size.toDouble(),
                                        fontWeight: FontWeight.normal,
                                        fontFamily: widget.lng!.header1.textFamily),
                                  )),
                                  // Expanded(child: MyText(
                                  //   "Valid on orders of at least AED 30 after discounts",
                                  //   style: TextStyle(color: Color(
                                  //       int.parse(widget.cartPage!.body.paymentMethods.oFGifts!.selectedVoucher!.voucherDetailsList!.title!.color!)),
                                  //       fontSize: widget.lng!.header1.size.toDouble(),
                                  //       fontWeight: FontWeight.normal,
                                  //       fontFamily: widget.lng!.header1.textFamily),
                                  // )),
                                ],
                              ),

                            );
                        },


                      ),


                    ],
                  )
                ],
              ),


            ],
          ),
        ),
      );
    });
  }
}
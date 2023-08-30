import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/Loyalty-MyGiftsPage/loyalty_my_gifts_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/models/gift.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:operation_falafel/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../providers/AppTheme/theme_provider.dart';

class CartGiftsSheet extends StatefulWidget{
  ScrollController scrollController;

  CartGiftsSheet(this.scrollController,{super.key});
  @override
  State<CartGiftsSheet> createState() => _CartGiftsSheetState();
}

class _CartGiftsSheetState extends State<CartGiftsSheet> {

  bool doesSelectedGiftExistInList({required List<Gift> gifts, Gift? selectedGift}) {
    // Check if the list is empty.
    if (gifts!.isEmpty || selectedGift==null) {
      return false;
    }else {
      // Iterate over the list and compare each object to the given object.
      for (Gift item in gifts) {
        if (item.id == selectedGift!.id) {
          return true;
        }
      }
    }

    // The object was not found in the list.
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return

      Consumer2<ThemeProvider, LoyaltyProvider>(
          builder: (context, appTheme,loyaltyProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyMyGiftsPage? loyaltyMyGiftsPage = appTheme.appTheme.designPerPage?.loyaltyMyGiftsPage;
      bool loadingDesign = loyaltyMyGiftsPage != null;
      bool giftsListEmpty = loyaltyProvider.gifts==null;

      return Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8)
            )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText("Choose Vaoucher", style: TextStyle(
                      color: Colors.amber,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      fontFamily: "${getTranslated(
                          context, "fontFamilyBody")!}"),),
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  },
                      icon: Icon(
                        CupertinoIcons.clear, color: Colors.white, size: 18,)),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.white,),

            (!giftsLoading)?
            (!giftsListEmpty)?
            Expanded(
              child: ListView.separated(
                controller: widget.scrollController,
                itemCount: loyaltyProvider.gifts!.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {



                  return ExpansionTile(
                    initiallyExpanded: true,
                    title:
                    MyText("${loyaltyProvider.gifts![index].name}", style: TextStyle(color: Colors.white70,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
                    // MyText("Free Delivery. Min order. AED 30.", style: TextStyle(color: Colors.white70,
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: "${getTranslated(
                    //           context, "fontFamilyBody")!}"),),
                    trailing: SizedBox(
                      height: 30,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if(loyaltyProvider.selectedGift==null) {
                            Provider.of<LoyaltyProvider>(context, listen: false)
                                .selectGift(loyaltyProvider.gifts![index]);
                          }else {
                            Provider.of<LoyaltyProvider>(context, listen: false).resetSelectGift();
                          }
                        },
                        child:
                        (!doesSelectedGiftExistInList(gifts: loyaltyProvider.gifts!,selectedGift: loyaltyProvider.selectedGift)) ?
                        MyText("Apply", style: TextStyle(color: Colors.amber,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: "${getTranslated(
                                context, "fontFamilyBody")!}"),):
                        MyText("Applied", style: TextStyle(color: Colors.amber,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: "${getTranslated(
                                context, "fontFamilyBody")!}"),),


                      ),
                    ),
                    children: [

                      /// -Divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
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
                                color: Colors.white,
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
                        controller: widget.scrollController,
                        itemCount: loyaltyProvider.gifts![index].giftCategory!.giftConditions!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index_2) {
                          return
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8, left: 18, right: 18),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/page2orders_icon.png",
                                    height: 14,),
                                  SizedBox(width: 10,),
                                  MyText(
                                    "${loyaltyProvider.gifts![index].giftCategory!.giftConditions![index_2].giftConditionTranslates![0].title}",
                                    style: TextStyle(color: Colors.white70,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "${getTranslated(
                                            context, "fontFamilyBody")!}"),),
                                  // MyText(
                                  //   "Valid on orders of at least AED 30 after discounts",
                                  //   style: TextStyle(color: Colors.white70,
                                  //       fontSize: 12,
                                  //       fontWeight: FontWeight.normal,
                                  //       fontFamily: "${getTranslated(
                                  //           context, "fontFamilyBody")!}"),),
                                ],
                              ),
                            );
                        },


                      ),


                    ],
                  );
                },
                separatorBuilder: (context, inexd) {
                  return Divider(color: Colors.white70,);
                },
              ),
            )



                :Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Icon(Icons.not_interested_outlined, color: Colors.white60,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyText(
                          getTranslated(context, "emptyGiftConditions")!,
                          style: TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              color: Colors.white60,
                              fontSize: lng?.header3.size.toDouble(),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
                :Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: LoadingWidget(),
                )

          ],
        ),
      );
    });

  }

bool giftsLoading = true;
  @override
  void initState() {
    if(Provider.of<AuthProvider>(context, listen: false).loggedInUser !=null) {
      String? userToken =Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
      Provider.of<LoyaltyProvider>(context, listen: false).getUserGiftsCards(userToken: userToken,lng: "en").then((value) {
        setState(() {
          giftsLoading = false;
        });
      });
    }
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_for_sale_details_page.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/buy_gift_payment_sheet.dart';
import 'package:operation_falafel/widgets/cached_image_with_placeholder.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:operation_falafel/widgets/loading_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/Loyalty-BuyGiftPage/loyalty_buy_gift_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class BuyGift extends StatefulWidget{
  static const routeName = 'BuyGift';
  @override
  State<BuyGift> createState() => _BuyGiftState();
}

class _BuyGiftState extends State<BuyGift> {

  List<String> giftImgs=[
    "assets/images/credits_30_credits.png",
    "assets/images/credits_50_credits.png",
    "assets/images/credits_70_credits.png",
    "assets/images/credits_100_credits.png",
    "assets/images/credits_150_credits.png",
    "assets/images/credits_200_credits.png",
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Consumer2<ThemeProvider,LoyaltyProvider>(builder: (context, appTheme,loyaltyProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyBuyGiftPage? loyaltyBuyGiftPage = appTheme.appTheme.designPerPage?.loyaltyBuyGiftPage;
      bool loadingDesign = loyaltyBuyGiftPage != null;
      bool giftsListLoading = loyaltyProvider.GiftsForSale==null;

                    return (loadingDesign)?
                    Stack(
                      children: [
                        Background(),
                        // Image.asset(
                        //   "assets/images/background.png",
                        //   height: MediaQuery
                        //       .of(context)
                        //       .size
                        //       .height,
                        //   width: MediaQuery
                        //       .of(context)
                        //       .size
                        //       .width,
                        //   fit: BoxFit.cover,
                        // ),
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
                                NetworkImage(loyaltyBuyGiftPage.appBar.backIcon.imageIcon),
                                size: double.parse(loyaltyBuyGiftPage?.appBar.backIcon.mobileSize as String),
                              ) :
                              ImageIcon(
                                NetworkImage(loyaltyBuyGiftPage.appBar.backIcon.imageIcon),
                                size: double.parse(loyaltyBuyGiftPage?.appBar.backIcon.mobileSize as String),
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            centerTitle: true,
                            title: MyText(
                              loyaltyBuyGiftPage.appBar.title.data,
                              style: TextStyle(
                                  fontFamily: "${lng?.logoTitle.textFamily}",
                                  fontWeight: FontWeight.bold),),
                            actions: [],
                          ),
                          body:
                          Center(
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 450,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  MyText(
                                    loyaltyBuyGiftPage.body.pageTitle.data,
                                    style: TextStyle(
                                        fontFamily: lng?.titleHeader2.textFamily,
                                        color: Color(int.parse(loyaltyBuyGiftPage.body.pageTitle.color)),
                                        fontSize: lng?.titleHeader2.size.toDouble()
                                    ),),

                                  // MyText(getTranslated(context, "buyGifts")!,
                                  //   style: TextStyle(
                                  //     fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                                  //     color: Colors.amber,
                                  //     fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)
                                  //   ),),

                                  Expanded(
                                    child:
                                    (!giftsListLoading)?
                                    GridView.builder(
                                      padding: const EdgeInsets.all(10),
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 1.39,
                                      ),

                                      itemBuilder: (context, index) =>
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Stack(
                                              children: [
                                                Container(

                                                  decoration: BoxDecoration(
                                                    color: Colors.black.withOpacity(0.4),
                                                    borderRadius: const BorderRadius.only(
                                                      topRight: Radius.circular(0),
                                                      bottomLeft: Radius.circular(0),
                                                      topLeft: Radius.circular(0),
                                                      bottomRight: Radius.circular(0),
                                                    ),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.amber,
                                                      style: BorderStyle.solid,
                                                    ),
                                                  ),
                                                  child: SizedBox(
                                                      height: 150,
                                                      width: MediaQuery.of(context).size.width,
                                                      child: CachedImageWithPlaceholder(loyaltyProvider.GiftsForSale![index].image!, BoxFit.cover))
                                                  // Image.asset(giftImgs[index],),

                                                ),
                                                Positioned.fill(
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(0)),
                                                        splashColor: Colors.black,
                                                        overlayColor: MaterialStateProperty
                                                            .all<Color>(Colors.black54),

                                                        onTap: () {
                                                          PersistentNavBarNavigator.pushNewScreen(
                                                            context,
                                                            screen: GiftForSaleDetailsPage(giftForSale: loyaltyProvider.GiftsForSale![index]),
                                                            withNavBar: true,
                                                            // OPTIONAL VALUE. True by default.
                                                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                                          );
                                                        },
                                                      ),

                                                    )
                                                ),

                                              ],
                                            ),
                                          ),


                                      itemCount: loyaltyProvider.GiftsForSale!.length,
                                    ):
                                       LoadingWidget(),
                                  )

                                ],
                              ),
                            ),
                          ),


                        )
                      ],
                    )
                    :LoadingPage();
    });

  }

  @override
  void initState() {

    super.initState();

    if(Provider.of<AuthProvider>(context, listen: false).loggedInUser !=null) {
      String? userToken =Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
      Provider.of<LoyaltyProvider>(context, listen: false).getGiftsCardsForSale(userToken: userToken,lng: "en",country: "UAE");
    }
  }
}
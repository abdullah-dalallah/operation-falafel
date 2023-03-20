import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_details.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/Loyalty-MyGiftsPage/loyalty_my_gifts_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class MyGiftsList extends StatefulWidget{
  @override
  State<MyGiftsList> createState() => _MyGiftsListState();
}

class _MyGiftsListState extends State<MyGiftsList> {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyMyGiftsPage? loyaltyMyGiftsPage = appTheme.appTheme.designPerPage?.loyaltyMyGiftsPage;
      bool loadingDesign = loyaltyMyGiftsPage != null;

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
            appBar:AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(loyaltyMyGiftsPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyMyGiftsPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(loyaltyMyGiftsPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltyMyGiftsPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                loyaltyMyGiftsPage.appBar.title.data,
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

                    Text(
                      loyaltyMyGiftsPage.body.pageTitle.data,
                      style: TextStyle(
                        fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                        color: Color(int.parse(loyaltyMyGiftsPage.body.pageTitle.color)),
                        fontSize: lng?.titleHeader2.size.toDouble()
                          )
                      ),
                    // Text(getTranslated(context, "myGifts")!, style: TextStyle(
                    //     fontFamily: "${getTranslated(
                    //         context, "fontFamilyButtons")!}",
                    //     color: Colors.amber,
                    //     fontSize: double.parse(
                    //         getTranslated(context, "fontFamilyTitleُSize")!)),),

                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, Index) =>
                              Column(
                                children: [
                                  ListTile(
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: GiftDetails(),
                                          withNavBar: true,
                                          // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation
                                              .cupertino,
                                        );
                                      },
                                      leading: Image.asset(
                                        "assets/images/of_credit_icon.png",
                                        height: 60, width: 60,),
                                      title: Text(
                                        getTranslated(context, "registrationGift")!,
                                        style: TextStyle(
                                          fontSize: lng?.header3.size.toDouble(),
                                          // fontSize: 17,
                                          fontFamily: "${lng?.header3.textFamily}",
                                          // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                          color: Color(int.parse(loyaltyMyGiftsPage.body.giftsList.title.color))),),
                                        subtitle: Text("2023-10-18",
                                        style: TextStyle(
                                            fontSize: lng?.header3.size.toDouble(),
                                            // fontSize: 17,
                                            fontFamily: "${lng?.header3.textFamily}",
                                            // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                            color: Color(int.parse(loyaltyMyGiftsPage.body.giftsList.subTitle.color))),
                                        )
                                  ),
                                  Row(
                                    children: List.generate(
                                        800 ~/ 10, (index) =>
                                        Expanded(
                                          child: Container(
                                            color: index % 2 == 0 ? Colors
                                                .transparent
                                                : Colors.grey,
                                            height: 1,
                                          ),
                                        )),
                                  ),
                                ],
                              )
                      ),
                    ))
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
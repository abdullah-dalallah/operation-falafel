import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/screens/profile/profile_pages/add_new_card.dart';
import 'package:operation_falafel/widgets/Saved%20cards/saved_cards_list_widget.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/SavedCardsPage/saved_cards_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class SavedCards extends StatefulWidget{
  static const routeName = 'SavedCards';
  @override
  State<SavedCards> createState() => _SavedCardsState();
}

class _SavedCardsState extends State<SavedCards> {



  @override
  Widget build(BuildContext context) {

    return Consumer2<ThemeProvider, ProfileProvider>(builder: (context, appTheme,profileProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      SavedCardsPage? savedCardsPage = appTheme.appTheme.designPerPage?.savedCardsPage;
      bool loadingDesign = savedCardsPage != null;



      return
        (loadingDesign)?
        Stack(
        children: [
         Background(),
          (Localizations.localeOf(context).languageCode == 'en') ?
          Visibility(
            visible: true,
            child: Positioned(
                right: 20,
                top: 130,
                child: Image.asset("assets/images/page7_right_icon.png", height: 50,)),
          ) :
          Visibility(
            visible: true,
            child: Positioned(
                left: 30,
                top: 100,
                child: Image.asset(
                  "assets/images/page7_left_icon.png", height: 50,)),
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
                  NetworkImage(savedCardsPage.appBar.backIcon.imageIcon),
                  size: double.parse(savedCardsPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(savedCardsPage.appBar.backIcon.imageIcon),
                  size: double.parse(savedCardsPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: MyText(
                savedCardsPage.appBar.title.data,
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
                    /// - Page title
                    MyText(
                     savedCardsPage.body.pageTitle.data,
                      style: TextStyle(
                              fontFamily: lng?.titleHeader2.textFamily,
                              color: Color( int.parse(savedCardsPage.body.pageTitle.color)),
                              fontSize: lng?.titleHeader2.size.toDouble()
                      ),),
                    // MyText(getTranslated(context, "savedCards")!,
                    //   style: TextStyle(fontFamily: "${getTranslated(
                    //       context, "fontFamilyButtons")!}",
                    //       color: Colors.amber,
                    //       fontSize: double.parse(getTranslated(
                    //           context, "fontFamilyTitleُSize")!)),),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          savedCardsPage.body.emptyList.data,
                          style: TextStyle(
                              fontFamily: lng?.titleHeader1.textFamily,
                              color: Color(int.parse(savedCardsPage.body.emptyList.color)),
                              fontSize: lng?.titleHeader1.size.toDouble()),),

                        // MyText(getTranslated(context, "youHaveNoSavedCards")!,
                        //   style: TextStyle(
                        //       fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                        //       color: Colors.white,
                        //       fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                        const SizedBox(width: 10,),

                      ],
                    ),
                    /// - Page title


                    SavedCardsListWidget(lng: lng, savedCardsPage: savedCardsPage),



                    const SizedBox(height: 10,),
                    SizedBox(
                        width: 330,
                        height: 38,
                        child: ElevatedButton(
                            onPressed: () {
                              context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${AddNewCard.routeName}");

                              // PersistentNavBarNavigator.pushNewScreen(
                              //   context,
                              //   screen: AddNewCard(),
                              //   withNavBar: true,
                              //   // OPTIONAL VALUE. True by default.
                              //   pageTransitionAnimation: PageTransitionAnimation
                              //       .cupertino,
                              // );
                            },
                            style: ButtonStyle(
                              // backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(savedAddressPage?.body.addNewAdressButton.backGroundColor as String))),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: const BorderSide(
                                          color: Colors.transparent, width: 1.5)
                                  )
                              ),


                            ),
                            child: MyText(
                              "Add New Card",
                              // getTranslated(context, "addNewAddress")!,
                              style: TextStyle(
                                  fontFamily: lng?.header3.textFamily,
                                  color:Colors.white,
                                  // color: Color(int.parse(savedAddressPage?.body.addNewAdressButton.color as String)),
                                  fontSize: lng?.header3.size.toDouble()),
                            )

                        )
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
      :LoadingPage();
    });
  }

  @override
  void initState() {
    super.initState();
   String userToken = Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
    Provider.of<ProfileProvider>(context, listen: false).getUserCards( userToken,);

  }
}
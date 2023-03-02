import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/SavedCardsPage/saved_cards_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class SavedCards extends StatefulWidget{
  @override
  State<SavedCards> createState() => _SavedCardsState();
}

class _SavedCardsState extends State<SavedCards> {
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      SavedCardsPage? savedCardsPage = appTheme.appTheme.designPerPage?.savedCardsPage;
      bool loadingDesign = savedCardsPage != null;

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
              title: Text(
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
                    Text(
                     savedCardsPage.body.pageTitle.data,
                      style: TextStyle(
                              fontFamily: lng?.titleHeader2.textFamily,
                              color: Color( int.parse(savedCardsPage.body.pageTitle.color)),
                              fontSize: lng?.titleHeader2.size.toDouble()
                      ),),
                    // Text(getTranslated(context, "savedCards")!,
                    //   style: TextStyle(fontFamily: "${getTranslated(
                    //       context, "fontFamilyButtons")!}",
                    //       color: Colors.amber,
                    //       fontSize: double.parse(getTranslated(
                    //           context, "fontFamilyTitleُSize")!)),),



                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          savedCardsPage.body.emptyList.data,
                          style: TextStyle(
                              fontFamily: lng?.titleHeader1.textFamily,
                              color: Color(int.parse(savedCardsPage.body.emptyList.color)),
                              fontSize: lng?.titleHeader1.size.toDouble()),),

                        // Text(getTranslated(context, "youHaveNoSavedCards")!,
                        //   style: TextStyle(
                        //       fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                        //       color: Colors.white,
                        //       fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                        const SizedBox(width: 10,),

                      ],
                    ),
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
}
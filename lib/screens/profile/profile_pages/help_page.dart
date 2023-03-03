import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';

import '../../../localization/localization_constants.dart';
import '../../../models/AppThemeModels/DesignPerPage/HelpPage/help_page.dart';
import '../../../models/AppThemeModels/DesignPerPage/Loyalty-GiftDetailsPage/loyalty_gift_detail_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';

import '../../../providers/AppTheme/theme_provider.dart';


class HelpPage extends StatefulWidget{
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {


    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      DesignHelpPage? helpPage = appTheme.appTheme.designPerPage?.helpPage;
      bool loadingDesign = helpPage != null;


      return (loadingDesign)?
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
                  NetworkImage(helpPage.appBar.backIcon.imageIcon),
                  size: double.parse(helpPage?.appBar.backIcon.size as String),
                ) :
                ImageIcon(
                  NetworkImage(helpPage.appBar.backIcon.imageIcon),
                  size: double.parse(helpPage?.appBar.backIcon.size as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                helpPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Column(
                children: [
                  Text(
                    helpPage.body.pageTitle.data,
                    style: TextStyle(
                        fontFamily: lng?.titleHeader2.textFamily,
                        color: Color(int.parse(helpPage.body.pageTitle.color)),
                        fontSize:lng?.titleHeader2.size.toDouble()
                    ),),
                  // Text(
                  //   getTranslated(context, "gotAnyQuestions")!,
                  //   style: TextStyle(
                  //       fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                  //       color: Colors.amber,
                  //       fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)
                  //   ),),
                  const SizedBox(height: 100,),
                  Expanded(
                    child: ListView(
                      children: [

                        /// - Title


                        Image.network(helpPage.body.pageImage),
                        // Image.asset("assets/images/help_icon.png",),


                      ],
                    ),
                  ),

                  /// - my Code
                  /// - Contact us
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Image.network(helpPage.body.callUsWidget.imageIcon, height: double.parse(helpPage.body.callUsWidget.mobileSize), color: Colors.amber,),
                            // Image.asset("assets/images/page8_phone.png", height: 29, color: Colors.amber,),

                            const SizedBox(width: 8,),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    helpPage.body.callUsWidget.data,
                                    style: TextStyle(
                                      fontSize: lng?.header2.size.toDouble(),
                                      fontFamily: lng?.header2.textFamily,
                                      color: Color(int.parse(helpPage.body.callUsWidget.color)),),),
                                  // Text(getTranslated(context, "callUs")!,
                                  //   style: TextStyle(fontSize: 13,
                                  //     fontFamily: "${getTranslated(
                                  //         context, "fontFamilyBody")!}",
                                  //     color: Colors.white,),),
                                  SizedBox(width: 60,
                                      child: Divider(
                                        color: Colors.white, thickness: 1,))
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.network(helpPage.body.emailUsWidget.imageIcon, height: double.parse(helpPage.body.callUsWidget.mobileSize), color: Colors.amber,),

                            // Image.asset("assets/images/page8_mail.png", height: 25, color: Colors.amber,),
                            const SizedBox(width: 8,),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    helpPage.body.emailUsWidget.data,
                                    style: TextStyle(
                                      fontSize: lng?.header2.size.toDouble(),
                                      fontFamily: lng?.header2.textFamily,
                                      color: Color(int.parse(helpPage.body.emailUsWidget.color)),),),

                                  SizedBox(width: double.parse(getTranslated(context, "emailUsDividerLength")!),
                                      child: Divider(
                                        color: Colors.white, thickness: 1,))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                  ),
                  const SizedBox(height: 10,)

                ],
              ),

            ),
          ),
        ],
      )
      :LoadingPage();
    });



  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/Loyalty-HistoryPage/loyalty_history_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class RewardsHistory extends StatefulWidget{
  @override
  State<RewardsHistory> createState() => _RewardsHistoryState();
}

class _RewardsHistoryState extends State<RewardsHistory> {
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyHistoryPage? loyaltyHistoryPage = appTheme.appTheme.designPerPage?.loyaltyHistoryPage;
      bool loadingDesign = loyaltyHistoryPage != null;
      return Stack(
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
                  NetworkImage("${loyaltyHistoryPage?.appBar.backIcon.imageIcon}"),
                  size: double.parse(loyaltyHistoryPage?.appBar.backIcon.size as String),
                ) :
                ImageIcon(
                  NetworkImage("${loyaltyHistoryPage?.appBar.backIcon.imageIcon}"),
                  size: double.parse(loyaltyHistoryPage?.appBar.backIcon.size as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "${loyaltyHistoryPage?.appBar.title.data}",
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
                    const SizedBox(height: 25,),

                    /// - Title
                    Text(
                      loyaltyHistoryPage?.body.pageTitle.data as String,
                      style: TextStyle(
                          fontFamily: lng?.titleHeader2.textFamily,
                          color: Color(int.parse(loyaltyHistoryPage?.body.pageTitle.color as String)),
                          fontSize: lng?.titleHeader2.size.toDouble()),
                      textAlign: TextAlign.center,),
                    // Text(
                    //   getTranslated(context, "history")!,
                    //   style: TextStyle(
                    //     fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                    //     color: Colors.amber,
                    //     fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),
                    //   textAlign: TextAlign.center,),

                    const SizedBox(height: 25,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 50),
                            child: ListTile(
                              title: Text("${getTranslated(context, "earnd")!}",
                                style: TextStyle(fontSize: 15, color: Color(int.parse(loyaltyHistoryPage?.body.historyList.title.color as String,))),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("2.09625 ${getTranslated(context, "pointEarnd")!} 19.75",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: getTranslated(context, "fontFamilyBody")!,
                                        color: Color(int.parse(loyaltyHistoryPage?.body.historyList.subTitle.color as String,))),),
                                  Text("2022-10-19 20:22:17", style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: getTranslated(
                                          context, "fontFamilyBody")!,
                                      color: Color(int.parse(loyaltyHistoryPage?.body.historyList.dateTitle.color as String,))),),
                                  const SizedBox(height: 10,),
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
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });

  }
}
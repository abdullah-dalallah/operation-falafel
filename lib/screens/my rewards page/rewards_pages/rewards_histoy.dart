import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/providers/tab_index_generator_provider.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/Loyalty-HistoryPage/loyalty_history_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';
import '../../../providers/gifts_provider/models/loyalty_point_history.dart';

class RewardsHistory extends StatefulWidget{
  static const routeName = 'RewardsHistory';
  @override
  State<RewardsHistory> createState() => _RewardsHistoryState();
}

class _RewardsHistoryState extends State<RewardsHistory> {
  @override
  Widget build(BuildContext context) {

    return Consumer2<ThemeProvider,LoyaltyProvider>(builder: (context, appTheme,loyaltyProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltyHistoryPage? loyaltyHistoryPage = appTheme.appTheme.designPerPage?.loyaltyHistoryPage;
      bool loadingDesign = loyaltyHistoryPage != null;
      return Stack(
        children: [
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
          Background(),
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
                  size: double.parse(loyaltyHistoryPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage("${loyaltyHistoryPage?.appBar.backIcon.imageIcon}"),
                  size: double.parse(loyaltyHistoryPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: MyText(
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
                    MyText(
                      loyaltyHistoryPage?.body.pageTitle.data as String,
                      style: TextStyle(
                          fontFamily: lng?.titleHeader2.textFamily,
                          color: Color(int.parse(loyaltyHistoryPage?.body.pageTitle.color as String)),
                          fontSize: lng?.titleHeader2.size.toDouble()),
                      textAlign: TextAlign.center,),
                    // MyText(
                    //   getTranslated(context, "history")!,
                    //   style: TextStyle(
                    //     fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                    //     color: Colors.amber,
                    //     fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),
                    //   textAlign: TextAlign.center,),

                    const SizedBox(height: 25,),
                    (loadingList )?


                    const Center(
                        child:   SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                            strokeWidth: 2,
                          ),
                        )
                      // child: CircularProgressIndicator(strokeWidth: 2.1,)
                    )
                     :(!loggedIn)?
                    _buildLoginRequired( loyaltyHistoryPage,lng)

                        : _buildHistoryTile(loyaltyProvider.loyaltyPointHistory,  loyaltyHistoryPage,lng),


                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });

  }

  bool loadingList = true;
  bool loggedIn= false;
  @override
  void initState() {
    if(Provider.of<AuthProvider>(context, listen: false).loggedInUser !=null) {
      String? userToken =Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
      Provider.of<LoyaltyProvider>(context, listen: false).getLoyaltyPointHistory(userToken: userToken).then((value) {
        setState(() {
          loggedIn =true;
          loadingList = false;
        });

      });
    }
    else{

      setState(() {
        loggedIn = false;
        loadingList = false;
      });

    }


  }

  Widget _buildHistoryTile(LoyaltyPointHistory? loyaltyPointHistory, LoyaltyHistoryPage? loyaltyHistoryPage,Language? lng ) {
    if (loyaltyPointHistory==null) {
      return Center(child: Column(
        children: [
          Text('No Point History!',style: TextStyle(
            color:Color(int.parse(loyaltyHistoryPage!.body.historyList.emptyList.color)),
            fontWeight: FontWeight.bold,
              fontFamily: lng?.header2.textFamily,
              fontSize: lng?.header2.size.toDouble()
          ),),
        ],
      ));
    } else {
      return
        Expanded(
          child: ListView.builder(
          itemCount: loyaltyPointHistory!.historyList!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: ListTile(
                title:
                MyText("${loyaltyPointHistory!.historyList![index].reason}", style: TextStyle(fontSize: 15, color: Color(int.parse(loyaltyHistoryPage?.body.historyList.title.color as String,))),),
                // MyText("${getTranslated(context, "earnd")!}", style: TextStyle(fontSize: 15, color: Color(int.parse(loyaltyHistoryPage?.body.historyList.title.color as String,))),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText("${loyaltyPointHistory!.historyList![index].amount} ${loyaltyHistoryPage?.body.historyList.subTitle.data}",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: getTranslated(context, "fontFamilyBody")!,
                          color:
                          // Colors.green.shade600
                          Color(int.parse(loyaltyHistoryPage?.body.historyList.subTitle.color as String,))
                      ),),
                    // MyText("2.09625 ${getTranslated(context, "pointEarnd")!} 19.75",
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       fontFamily: getTranslated(context, "fontFamilyBody")!,
                    //       color: Color(int.parse(loyaltyHistoryPage?.body.historyList.subTitle.color as String,))),),
                    MyText("${loyaltyPointHistory!.historyList![index].createdAt}", style: TextStyle(
                        fontSize: 13,
                        fontFamily: getTranslated(context, "fontFamilyBody")!,
                        color:
                        // Color(0xff878787)),),
                        Color(int.parse(loyaltyHistoryPage?.body.historyList.dateTitle.color as String,))),),
                    // MyText("2022-10-19 20:22:17", style: TextStyle(
                    //     fontSize: 13,
                    //     fontFamily: getTranslated(
                    //         context, "fontFamilyBody")!,
                    //     color: Color(int.parse(loyaltyHistoryPage?.body.historyList.dateTitle.color as String,))),),
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
        );
    }
  }


  Widget _buildLoginRequired(LoyaltyHistoryPage? loyaltyHistoryPage,Language? lng){
    // Provider.of<TabIndexGenerator>(context, listen: false).setIndex(4);
    return    Column(
      children: [
        Text('${loyaltyHistoryPage?.body.historyList.emptyListLoginRequired.data}',style: TextStyle(
          color: Color(int.parse(loyaltyHistoryPage!.body.historyList.emptyListLoginRequired.color)),
          fontWeight: FontWeight.bold,
          fontFamily: lng?.header2.textFamily,
          fontSize: lng?.header2.size.toDouble()
        ),
        textAlign: TextAlign.center,
        ),
      ],
    );
  }




}
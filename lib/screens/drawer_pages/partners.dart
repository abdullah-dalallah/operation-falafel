import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:provider/provider.dart';

import '../../models/AppThemeModels/DesignPerPage/Drawer-PartnersPage/drawer_partners_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../widgets/loading_page.dart';

class Partners extends StatefulWidget{
  @override
  State<Partners> createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      DrawerPartnersPage? drawerPartnersPage = appTheme.appTheme.designPerPage?.drawerPartnersPage;
      bool loadingDesign = drawerPartnersPage != null;
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

            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                 ImageIcon(
                  NetworkImage(drawerPartnersPage.appBar.backIcon.imageIcon),
                  size: double.parse(drawerPartnersPage?.appBar.backIcon.size as String),
                )
                    :  ImageIcon(
                  NetworkImage(drawerPartnersPage.appBar.backIcon.imageIcon),
                  size: double.parse(drawerPartnersPage?.appBar.backIcon.size as String),
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon:
              //   (Localizations.localeOf(context).languageCode == 'en') ?
              //   const ImageIcon(
              //     AssetImage("assets/images/back_new.png",),
              //     size: 35,
              //   )
              //       : const ImageIcon(AssetImage("assets/images/back_arabic.png",), size: 35,),
              // ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title:
              Text(
                drawerPartnersPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              // Text(getTranslated(context, "operationFalafelLogo")!,
              //   style: TextStyle(
              //       fontFamily: "${getTranslated(context, "fontFamilyTitle")!}",
              //       fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 450,),
                child: Column(

                  children: [
                    ///- page Title

                    Text(
                      drawerPartnersPage.body.pageTitle.data,
                      style: TextStyle(
                          fontFamily: "${lng?.titleHeader2.textFamily}",
                          fontWeight: FontWeight.bold
                        ,fontSize:lng?.titleHeader2.size.toDouble(),
                        color: Color(int.parse(drawerPartnersPage.body.pageTitle.color)),
                      ),

                    ),
                    // Text(getTranslated(context, "partnersTitle")!,
                    //   style: TextStyle(fontFamily: "${getTranslated(
                    //       context, "fontFamilyButtons")!}",
                    //       color: Colors.amber,
                    //       fontSize: double.parse(getTranslated(
                    //           context, "fontFamilyTitleُSize")!)),),
                    Expanded(child:
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),

                                      ),
                                      child: Image.asset("assets/images/aud.png", width: 80, height: 80, fit: BoxFit.cover,)),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getTranslated(context, "audTitle")!,
                                        style:  TextStyle(
                                          fontFamily: "${lng?.header3.textFamily}",
                                          fontWeight: FontWeight.bold
                                          ,fontSize:lng?.header3.size.toDouble(),
                                          color: Color(int.parse(drawerPartnersPage.body.partnersList.title.color)),
                                        ),),
                                      // Text(
                                      //   getTranslated(context, "audTitle")!,
                                      //   style: TextStyle(
                                      //       fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                      //       color: Colors.amber,
                                      //       fontSize: 15
                                      //   ),),
                                      Text(
                                        getTranslated(context, "validOnAppDlivery")!,
                                        style: TextStyle(
                                          fontFamily: "${lng?.header2.textFamily}",
                                          fontWeight: FontWeight.bold
                                          ,fontSize:lng?.header2.size.toDouble(),
                                          color: Color(int.parse(drawerPartnersPage.body.partnersList.subTitle.color)),
                                        ),)
                                    ],),
                                ),
                              ],
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),

                                      ),
                                      child: Image.asset(
                                        "assets/images/dha.jpg", width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,)),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(getTranslated(context, "dhaTitle")!,
                                        style: TextStyle(
                                          fontFamily: "${lng?.header3.textFamily}",
                                          fontWeight: FontWeight.bold
                                          ,fontSize:lng?.header3.size.toDouble(),
                                          color: Color(int.parse(drawerPartnersPage.body.partnersList.title.color)),
                                        ),),
                                      Text(getTranslated(
                                          context, "validOnAppDlivery")!,
                                        style: TextStyle(
                                          fontFamily: "${lng?.header2.textFamily}",
                                          fontWeight: FontWeight.bold
                                          ,fontSize:lng?.header2.size.toDouble(),
                                          color: Color(int.parse(drawerPartnersPage.body.partnersList.subTitle.color)),
                                        ),)
                                    ],),
                                ),
                              ],
                            ),
                          ),


                        ],


                      ),
                    )
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
}
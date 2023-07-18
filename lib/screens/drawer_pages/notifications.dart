import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:provider/provider.dart';

import '../../models/AppThemeModels/DesignPerPage/Drawer-NotificationPage/drawer_notification_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../widgets/loading_page.dart';

class Notifications extends StatefulWidget{
  static const routeName = 'Notifications';
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {

      Language? lng= (Localizations.localeOf(context).languageCode=='ar')? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      DrawerNotificationPage? drawerNotificationPage = appTheme.appTheme.designPerPage?.drawerNotificationPage;
      bool loadingDesign= drawerNotificationPage!=null;


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
              leading:
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon:  ImageIcon(
                  NetworkImage("${drawerNotificationPage?.appBar.backIcon.imageIcon}",),
                  size: double.parse(drawerNotificationPage?.appBar.backIcon.mobileSize as String),
                ),
              ),

              // IconButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon:
              //   (Localizations.localeOf(context).languageCode == 'en') ?
              //   const ImageIcon(AssetImage("assets/images/back_new.png",), size: 35,
              //   ) :
              //   const ImageIcon(
              //     AssetImage("assets/images/back_arabic.png",),
              //     size: 35,
              //   ),
              // ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title:  MyText(
                drawerNotificationPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),

              // MyText(getTranslated(context, "operationFalafelLogo")!,
              //   style: TextStyle(
              //       fontFamily: "${getTranslated(context, "fontFamilyTitle")!}",
              //       fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Column(

                children: [

                  /// - Title Page
                  MyText(
                    drawerNotificationPage.body.pageTitle.data,
                    style: TextStyle(
                        fontFamily: "${lng?.titleHeader2.textFamily}",
                        color: Color(int.parse(drawerNotificationPage.body.pageTitle.color)),
                        fontSize: lng?.titleHeader2.size.toDouble(),),),
                  // MyText(getTranslated(context, "notificationsTitle")!,
                  //   style: TextStyle(fontFamily: "${getTranslated(
                  //       context, "fontFamilyButtons")!}",
                  //       color: Colors.amber,
                  //       fontSize: double.parse(
                  //           getTranslated(context, "fontFamilyTitleُSize")!)),),



                  Expanded(child:
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, Index) =>
                            Column(
                              children: [
                                ListTile(
                                    onTap: () {

                                    },

                                    title: MyText(
                                      getTranslated(context, "orderInitiated")!,
                                      style: TextStyle(
                                        fontFamily: "${lng?.header3.textFamily}",
                                        color: Color(int.parse(drawerNotificationPage.body.notificationList.title.color)),
                                        fontSize: lng?.header3.size.toDouble(),),),
                                    // title: MyText(
                                    //   getTranslated(context, "orderInitiated")!,
                                    //   style: TextStyle(
                                    //       fontFamily: "${getTranslated(
                                    //           context, "fontFamilyBody")!}",
                                    //       color: Colors.amber,
                                    //       fontSize: 15),),
                                    subtitle: MyText("10/19/2022 08:22:17",
                                      style: TextStyle(
                                        fontFamily: "${lng?.header3.textFamily}",
                                        color: Color(int.parse(drawerNotificationPage.body.notificationList.subTitle.color)),
                                        fontSize: lng?.header3.size.toDouble(),),)
                                ),

                              ],
                            )
                    ),
                  ))
                ],
              ),
            ),

          )
        ],
      )
            :LoadingPage();
    });
  }
}
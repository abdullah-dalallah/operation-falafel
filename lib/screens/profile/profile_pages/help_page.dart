import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../localization/localization_constants.dart';
import '../../../models/AppThemeModels/DesignPerPage/HelpPage/help_page.dart';
import '../../../models/AppThemeModels/DesignPerPage/Loyalty-GiftDetailsPage/loyalty_gift_detail_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';

import '../../../providers/AppTheme/theme_provider.dart';


class HelpPage extends StatefulWidget{
  static const routeName = 'HelpPage';
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {


    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      DesignHelpPage? helpPage = appTheme.appTheme.designPerPage?.helpPage;
      bool loadingDesign = helpPage != null;


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
                  size: double.parse(helpPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(helpPage.appBar.backIcon.imageIcon),
                  size: double.parse(helpPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: MyText(
                helpPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Column(
                children: [
                  MyText(
                    helpPage.body.pageTitle.data,
                    style: TextStyle(
                        fontFamily: lng?.titleHeader2.textFamily,
                        color: Color(int.parse(helpPage.body.pageTitle.color)),
                        fontSize:lng?.titleHeader2.size.toDouble()
                    ),),
                  // MyText(
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
                        /// - Phone number
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(helpPage.body.callUsWidget.imageIcon, height: double.parse(helpPage.body.callUsWidget.mobileSize), color: Colors.amber,),
                                  // Image.asset("assets/images/page8_phone.png", height: 29, color: Colors.amber,),

                                  const SizedBox(width: 8,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        MyText(
                                          helpPage.body.callUsWidget.data,
                                          style: TextStyle(
                                            fontSize: lng?.header2.size.toDouble(),
                                            fontFamily: lng?.header2.textFamily,
                                            color: Color(int.parse(helpPage.body.callUsWidget.color)),),),
                                        // MyText(getTranslated(context, "callUs")!,
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
                            ),
                            Positioned.fill(

                                child:  Material(
                                  color: Colors.transparent,
                                  child:   InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    splashColor: Colors.black,
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                    onTap: (){


                                      if(Provider.of<AuthProvider>(context, listen: false).loggedInUser!=null) {
                                        String userToken =  Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
                                        Provider.of<ProfileProvider>(context, listen: false).getHelpContacts( userToken).then((res) {

                                          if(res.statusCode==200) {
                                            print(res.data[Keys.bodyKey][Keys.phoneKey]);
                                            launchPhone("${res.data[Keys.bodyKey][Keys.phoneKey]}");
                                          }
                                        });

                                      }else{

                                      }


                                    },
                                  ),

                                )
                            ),
                          ],
                        ),
                        /// - Email
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(helpPage.body.emailUsWidget.imageIcon, height: double.parse(helpPage.body.callUsWidget.mobileSize), color: Colors.amber,),

                                  // Image.asset("assets/images/page8_mail.png", height: 25, color: Colors.amber,),
                                  const SizedBox(width: 8,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        MyText(
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
                            ),
                            Positioned.fill(

                                child:  Material(
                                  color: Colors.transparent,
                                  child:   InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    splashColor: Colors.black,
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                    onTap: (){


                                      if(Provider.of<AuthProvider>(context, listen: false).loggedInUser!=null) {
                                        String userToken =  Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
                                        Provider.of<ProfileProvider>(context, listen: false).getHelpContacts( userToken).then((res) {


                                          if(res.statusCode==200) {
                                            print(res.data[Keys.bodyKey][Keys
                                                .emailKey]);
                                            launchEmail(
                                              "${res.data[Keys.bodyKey][Keys
                                                  .emailKey]}",);
                                          }
                                          });

                                      }else{

                                      }


                                    },
                                  ),

                                )
                            ),
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


  void launchEmail(String email,) async {
    final Uri emailUrl = Uri.parse('mailto:$email');
    await launchUrl(emailUrl);
  }
  void launchPhone(String phone) async {
    final Uri phoneUrl = Uri.parse('tel:$phone');
    await launchUrl(phoneUrl);
  }

}
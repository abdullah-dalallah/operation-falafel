import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../models/AppThemeModels/DesignPerPage/ForgetPasswordPage/forget_password_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';

class ResetYourPassword extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const ResetYourPassword(this.onChanged,{super.key,required this.layOut});
  @override
  State<ResetYourPassword> createState() => _ResetYourPasswordState();
}

class _ResetYourPasswordState extends State<ResetYourPassword> {

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  void initState() {
    super.initState();
    // Get the language set as default on the users phone
    // String? systemCountryCode = window.locale.countryCode;
    countryCode= CountryCode(code: "AE",name: "United Arab Emirates",dialCode: "+971" );


  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      ForgetPasswordPage? forgetPasswordPage = appTheme.appTheme.designPerPage?.forgetPasswordPage;
      bool loadingDesign = forgetPasswordPage != null;

      return
        (loadingDesign)?
        Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png",),
              fit: BoxFit.cover,
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
              (Localizations
                  .localeOf(context)
                  .languageCode == 'en') ?
              const ImageIcon(
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ) :
              const ImageIcon(
                AssetImage("assets/images/back_arabic.png",),
                size: 35,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            // centerTitle: true,
            // title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            // actions: [],
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 450,),
              child: Column(

                children: [
                  // const SizedBox(height: 50,),
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Image.asset(
                            "assets/images/forget_graphic.png",
                            height: 280,
                            // fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Text(
                          forgetPasswordPage.pageTile.data,
                          style: TextStyle(
                              fontFamily: lng?.titleHeader2.textFamily,
                              color: Color(int.parse(forgetPasswordPage.pageTile.color)),
                              fontSize: double.parse(
                                  getTranslated(context, "welcomeBackTitle")!),
                              height: 1
                          ),
                          textAlign: TextAlign.center,),
                        // Text(getTranslated(context, "resetYourPassword")!,
                        //   style: TextStyle(fontFamily: getTranslated(
                        //       context, "fontFamilyButtons"),
                        //       color: Colors.amber,
                        //       fontSize: double.parse(
                        //           getTranslated(context, "welcomeBackTitle")!),
                        //       height: 1), textAlign: TextAlign.center,),

                        const SizedBox(height: 30,),

                        /// - Phone number
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left: 0, right: 0),

                            decoration: const BoxDecoration(
                              color: Colors.transparent,

                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              // border: Border.all(
                              //   width: 0,
                              //   color: Colors.transparent,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, bottom: 5),
                                  child:

                                  Text(
                                    forgetPasswordPage.form.phoneNumber.data,
                                    style: TextStyle(
                                        fontFamily: lng?.header2.textFamily,
                                        color: Color(int.parse(forgetPasswordPage.form.phoneNumber.color))),),
                                  // Text(
                                  //   "${getTranslated(context, "mobileNo")!} :",
                                  //   style: TextStyle(fontFamily: getTranslated(
                                  //       context, "fontFamilyBody")!,
                                  //       color: Colors.amber),),
                                ),

                                Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.black45,

                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topRight: Radius.circular(10)
                                    ),
                                    // (Localizations.localeOf(context).languageCode=='en')?
                                    // const BorderRadius.only(
                                    //   bottomLeft:  Radius.circular(10.0),
                                    //   topLeft: Radius.circular(10.0),
                                    // ):
                                    // (Localizations.localeOf(context).languageCode=='ar')?
                                    // const BorderRadius.only(
                                    //   bottomRight:     Radius.circular(10),
                                    //   topRight: Radius.circular(10),
                                    // ):
                                    // const BorderRadius.only(
                                    //   bottomLeft:  Radius.circular(10.0),
                                    //   topLeft: Radius.circular(10.0),
                                    // ),

                                    // border: Border.all(
                                    //   width: 0,
                                    //   color: Colors.transparent,
                                    //   style: BorderStyle.solid,
                                    // ),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10,),
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, right: 0),
                                              child: IconButton(
                                                icon:
                                                countryCode != null ?
                                                SizedBox(width: 30,
                                                    height: 30,
                                                    child: countryCode!
                                                        .flagImage)
                                                    : const Icon(
                                                    Icons.flag_outlined),
                                                padding: EdgeInsets.zero,
                                                onPressed: () async {
                                                  final code = await countryPicker
                                                      .showPicker(
                                                      context: context,
                                                      initialSelectedLocale: "AE");
                                                  if (code != null) {
                                                    setState(() {
                                                      countryCode = code;
                                                    });
                                                  };
                                                },)
                                          )),
                                      const Expanded(
                                        flex: 8,
                                        child: SizedBox(

                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            autofocus: false,
                                            style: TextStyle(
                                                color: Colors.white),
                                            decoration: InputDecoration(

                                              filled: true,
                                              fillColor: Colors.transparent,
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(0.0),
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(0.0),
                                                ),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              hintText: '',

                                              // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                            ),

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),


                        const SizedBox(height: 10,),

                        /// - Submit button
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  // border: Border.all(
                                  //   width: 0.5,
                                  //   color: Colors.white,
                                  //   style: BorderStyle.solid,
                                  // ),
                                ),
                                child: const Icon(
                                  Icons.check, color: Colors.white,),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  // border: Border.all(
                                  //   width: 0.5,
                                  //   color: Colors.white,
                                  //   style: BorderStyle.solid,
                                  // ),
                                ),
                                // child:Icon(Icons.check, color:Colors.white,),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 9,

                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      topLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.check, color: Colors.white,
                                    size: 30,),
                                ),
                              ),

                              Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      splashColor: Colors.black45,
                                      overlayColor: MaterialStateProperty.all<
                                          Color>(Colors.black54),

                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: LoggedInUserProfile(
                                              layOut: widget.layOut, (value) {
                                            widget.onChanged(value);
                                          }),
                                          withNavBar: true,
                                          // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation
                                              .cupertino,
                                        );
                                      },
                                    ),

                                  )
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      )
      :LoadingPage();
    });

  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class HowItWorks extends StatefulWidget{
  @override
  State<HowItWorks> createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          key: _drawerKey,
          backgroundColor: Colors.transparent,
          appBar:AppBar(
            leading:

            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:
              (Localizations.localeOf(context).languageCode=='en')?
              const ImageIcon(
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ):
              const ImageIcon(
                AssetImage("assets/images/back_arabic.png",),
                size: 35,
              ),
            ) ,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title:MyText(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            // Image.asset("assets/images/of_logo_top.png", width: 220,),
            // MyText("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)
            actions: [
              // CupertinoSwitch(
              //   value: _switchValue,
              //   onChanged: (value) {
              //     setState(() {
              //       _switchValue = value;
              //     });
              //   },
              // ),
            ],
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(getTranslated(context, "howItworksTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),

                  Expanded(
                    child: ListView(
                      children: [
                        /// - Intro
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child:
                          MyText(getTranslated(context, "howItWorksIntro")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                        ),

                        /// - Welcome to Gifts
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex:2 ,
                                child: ListTile(
                                  //welcomeOF
                                   contentPadding: EdgeInsets.zero,

                                  title:MyText(getTranslated(context, "welcomeGifts")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w300)),
                                  subtitle:MyText(getTranslated(context, "welcomeOF")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 13, fontWeight: FontWeight.w300)),
                                  // trailing: Image.asset("assets/images/welcome_g.png", ),
                                ),
                              ),
                              Expanded(flex:1,child: Image.asset("assets/images/welcome_g.png", height: 140,width: 140,),),
                            ],
                          ),
                        ),

                        /// - O:F Rewards
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Expanded(flex:1,child: Image.asset("assets/images/how2.png", height: 140,width: 140,),),
                              SizedBox(width: 20,),
                              Expanded(
                                flex:2 ,
                                child: ListTile(
                                  //welcomeOF
                                  contentPadding: EdgeInsets.zero,
                                  title:MyText(getTranslated(context, "ofRewardsTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w300)),
                                  subtitle:MyText(getTranslated(context, "ofRewardsSubTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 13, fontWeight: FontWeight.w300)),
                                  // trailing: Image.asset("assets/images/welcome_g.png", ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// - Gift Vouchers
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex:2 ,
                                child: ListTile(
                                  //welcomeOF
                                  contentPadding: EdgeInsets.zero,
                                  title:MyText(getTranslated(context, "giftVoucherTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w300)),
                                  subtitle:MyText(getTranslated(context, "giftVoucherSubTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 13, fontWeight: FontWeight.w300)),
                                  // trailing: Image.asset("assets/images/welcome_g.png", ),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Expanded(flex:1,child: Image.asset("assets/images/transfer_image.png", height: 140,width: 140,),),
                            ],
                          ),
                        ),

                        /// - Transfer Credit
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Expanded(flex:1,child: Image.asset("assets/images/how7.png", height: 140,width: 140,),),
                              const SizedBox(width: 20,),
                              Expanded(
                                flex:2 ,
                                child: ListTile(
                                  //welcomeOF
                                  contentPadding: EdgeInsets.zero,
                                  title:MyText(getTranslated(context, "transferCreditTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w300)),
                                  subtitle:MyText(getTranslated(context, "transferCreditSubTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 13, fontWeight: FontWeight.w300)),
                                  // trailing: Image.asset("assets/images/welcome_g.png", ),
                                ),
                              ),


                            ],
                          ),
                        ),
                        /// - Refer a Friend
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex:2 ,
                                child: ListTile(
                                  //welcomeOF
                                  contentPadding: EdgeInsets.zero,
                                  title:MyText(getTranslated(context, "referFriendTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w300)),
                                  subtitle:MyText(getTranslated(context, "referFriendSubTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 13, fontWeight: FontWeight.w300)),
                                  // trailing: Image.asset("assets/images/welcome_g.png", ),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Expanded(flex:1,child: Image.asset("assets/images/how4.png", height: 140,width: 140,),),




                            ],
                          ),
                        ),
                        /// - Terms & conditions  conditionsTitle
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [


                              Expanded(flex:1,child: Image.asset("assets/images/how5.png", height: 140,width: 140,),),
                              const SizedBox(width: 20,),
                              Expanded(
                                flex:2 ,
                                child: ListTile(
                                  //welcomeOF
                                  contentPadding: EdgeInsets.zero,
                                  title:MyText(getTranslated(context, "terms&conditionsTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w300)),
                                  subtitle:MyText(getTranslated(context, "terms&conditionsSubTitle")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 13, fontWeight: FontWeight.w300)),
                                  // trailing: Image.asset("assets/images/welcome_g.png", ),
                                ),
                              ),



                            ],
                          ),
                        ),


                      ],
                    ),
                  )


                ],
              ),
            ),
          ) ,

        ),
      ],
    );
  }
}
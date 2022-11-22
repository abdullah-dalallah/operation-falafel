import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_friend.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class GiftDetails extends StatefulWidget{
  @override
  State<GiftDetails> createState() => _GiftDetailsState();
}

class _GiftDetailsState extends State<GiftDetails> {



  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
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
            leading: IconButton(
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
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            actions: [],
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                children: [
                  Image.asset("assets/images/gift.png", height: 150,width: 150,),
                  const SizedBox(height: 15,),
                  Text(getTranslated(context, "welcomeToOFFamily")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize:25 ),),
                  Text(getTranslated(context, "registrationGift")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize:20 ),),
                  const SizedBox(height: 25,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: ListView(
                        children: [

                              Row(
                                children: [
                                  Text("${getTranslated(context, "voucherTitle")!}:",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
                                ],
                              ),

                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("${getTranslated(context, "voucherBody")!}:",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,fontSize: 15, fontWeight: FontWeight.normal),)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 330,
                      height: 38,
                      child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(Colors.amber),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side:const BorderSide(color: Colors.transparent,width: 1.5)
                                )
                            ),


                          ),
                          child: Text(getTranslated(context, "redeem")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 20),),

                      )
                  ),
                  SizedBox(

                    child: DecoratedBox(

                      decoration:const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white),
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: GiftFriend(),
                            withNavBar: true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text(getTranslated(context, "sendAsGift")!,style: TextStyle(fontWeight: FontWeight.w400, fontFamily:  getTranslated(context, "fontFamilyBody")!,),textAlign: TextAlign.center,),

                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),

        )
      ],
    );
  }
}
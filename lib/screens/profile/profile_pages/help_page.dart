import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../localization/localization_constants.dart';

class HelpPage extends StatefulWidget{
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
            child:  Column(
                children: [
                  Text(getTranslated(context, "gotAnyQuestions")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                  const  SizedBox(height: 100,),
                  Expanded(
                    child: ListView(
                      children: [
                        /// - Title


                        Image.asset("assets/images/help_icon.png", ),









                      ],
                    ),
                  ),
                  /// - my Code
                  /// - Contact us
                  const  SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery. of(context). size. width,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/images/page8_phone.png" ,height: 29,color: Colors.amber,),
                            const SizedBox(width: 8,),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text(getTranslated(context, "callUs")!,style: TextStyle(fontSize: 13, fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, ),),
                                  SizedBox(width:60,child: Divider(color:Colors.white,thickness: 1,))
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset("assets/images/page8_mail.png", height: 25,color: Colors.amber,),
                            const SizedBox(width: 8,),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text(getTranslated(context, "emailUs")!,style: TextStyle(fontSize: 13,fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, ),),
                                  SizedBox(width:double.parse(getTranslated(context, "emailUsDividerLength")!),child: Divider(color:Colors.white,thickness: 1,))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                  ),
                  const  SizedBox(height: 10,)

                ],
              ),

          ),
        ),
      ],
    );
  }
}
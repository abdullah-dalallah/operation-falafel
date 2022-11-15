import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class Partners extends StatefulWidget{
  @override
  State<Partners> createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
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
          body:Center(
            child: Column(

              children: [
                Text(getTranslated(context, "partnersTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
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
                              child: Image.asset("assets/images/aud.png", width: 80,height:80,fit: BoxFit.cover,)),
                            ),
                             SizedBox(width: 15,),
                             Expanded(
                               flex: 3,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                 Text(getTranslated(context, "audTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,),),
                                 Text(getTranslated(context, "validOnAppDlivery")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white60,fontSize: 13),)
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
                                   child: Image.asset("assets/images/dha.jpg", width: 80,height:80,fit: BoxFit.cover,)),
                             ),
                             SizedBox(width: 15,),
                             Expanded(
                               flex: 3,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(getTranslated(context, "dhaTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,),),
                                   Text(getTranslated(context, "validOnAppDlivery")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white60,fontSize: 13),)
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

        )
      ],
    );
  }
}
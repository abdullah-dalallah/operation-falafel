import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class Notifications extends StatefulWidget{
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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

                Text(getTranslated(context, "notificationsTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, Index)=>
                          Column(
                            children: [
                              ListTile(
                                  onTap: (){

                                  },

                                  title: Text(getTranslated(context, "orderInitiated")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize: 15),),
                                  subtitle: Text("10/19/2022 08:22:17",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white60,fontSize: 13),)
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
    );
  }
}
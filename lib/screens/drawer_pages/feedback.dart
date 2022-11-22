import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/statrsWidgets.dart';

class FeedbackPage extends StatefulWidget{
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
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
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// - Title
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Expanded(child: Image.asset("assets/images/feed_back_im.png", height: 170,width: 170,),),

                    ],
                  ),

                  Expanded(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ListView(
                          children: [
                            StarsWidgets(),
                            const SizedBox(height: 10,),
                            Text(getTranslated(context, "weLoveToHereFromYou")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize: 20),textAlign: TextAlign.center,),
                            const SizedBox(height: 10,),
                            TextFormField(
                                autofocus: false,
                                style:  TextStyle(fontSize: 14.0,color: Colors.white,fontFamily:getTranslated(context, "fontFamilyBody")!,),
                                maxLength: 1000,
                                decoration:  InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black45,
                                  //amber.withOpacity(0.1),
                                  contentPadding:const EdgeInsets.only(left:10, top: 10, bottom: 10, right: 10),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:  BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                  ),
                                  enabledBorder:const  OutlineInputBorder(
                                    borderRadius:  BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                  ),
                                  hintText: getTranslated(context, "yourComments")!,
                                  hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),


                                ),
                                minLines: 4,
                                maxLines:50,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.next,

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
                                    child: Text(getTranslated(context, "submit")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 20),)

                                )
                            ),






                          ],

                        ),
                  )),


                ],
              ),
            ),
          ),

        )
      ],
    );
  }
}
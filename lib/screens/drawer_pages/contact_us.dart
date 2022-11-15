import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class ContactUs extends StatefulWidget{
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// - Title
                Text(getTranslated(context, "contactUsTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),

                Expanded(
                    child:
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView(
                        children: [

                          const SizedBox(height: 10,),
                          Text(getTranslated(context, "weLoveToHereFromYou")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize: 20),textAlign: TextAlign.center,),
                          const SizedBox(height: 10,),
                          TextFormField(

                            autofocus: false,
                            style:  TextStyle(fontSize: 14.0,color: Colors.white,fontFamily:getTranslated(context, "fontFamilyBody")!,),
                            maxLength: 1000,
                            decoration:  InputDecoration(
                              filled: true,
                              fillColor: Colors.black,
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
                              hintText: '',
                              label: Text(getTranslated(context, "yourComments")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

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
                                    backgroundColor:  MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
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

        )
      ],
    );
  }
}
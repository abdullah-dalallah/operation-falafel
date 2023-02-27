import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../localization/localization_constants.dart';

class WarningPage extends StatelessWidget{
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

        body:  Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 450, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [

               Stack(
                 alignment: Alignment.bottomRight,
                 children: [
                   Image.asset("assets/images/of_logo.png", height: 150,width: 150,),
                   Image.asset("assets/images/maintenance.png", height: 35,width: 35,),
                 ],
               ),
                SizedBox(height: 10,),
                Text(getTranslated(context, "weWillBeBack")!, style: TextStyle(fontFamily:"${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontWeight: FontWeight.w300,fontSize: 20),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left:18.0,right: 18),
                  child: Text(getTranslated(context, "weWillBeBackBody")!, style: TextStyle(fontFamily:"${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontWeight: FontWeight.w300,fontSize: 12,),textAlign: TextAlign.center,),
                ),
                SizedBox(height: 20,),
                Text(getTranslated(context, "thankYouForUnderstanding")!, style: TextStyle(fontFamily:"${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontWeight: FontWeight.w300,fontSize: 15),),
                SizedBox(height: 10,),
                /// - Close App Button
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 250, ),
                    child:  ElevatedButton(
                        onPressed: (){ SystemNavigator.pop();},
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(45)),
                          // maximumSize: MaterialStateProperty.all<Size>(Size.fromWidth(400)),
                          backgroundColor:  MaterialStateProperty.all<Color>(Colors.amber),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side:const BorderSide(color: Colors.transparent,width: 1.5)
                              )
                          ),
                          overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                        ),
                        child:
                        // Text(OrderNowButton,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons")!,color: Colors.white, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),)
                        Text(getTranslated(context, "closeApp")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons")!,color: Colors.white, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),)

                    ),

                  ),
                ),



              ],
            ),
          ),
        ),

      ),


    ],
  );
  }

}
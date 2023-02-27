import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../localization/localization_constants.dart';

class LoadingPage extends StatelessWidget{
  const LoadingPage({super.key});

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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset("assets/images/loading_page.gif", height: 60,width: 60,fit: BoxFit.cover,),
                      )

                      // Image.asset("assets/images/maintenance.png", height: 35,width: 35,),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Text("Loading...", style: TextStyle(fontFamily:"${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),),




                ],
              ),
            ),
          ),

        ),


      ],
    );
  }

}
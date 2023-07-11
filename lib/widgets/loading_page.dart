import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/widgets/background.dart';

import '../localization/localization_constants.dart';

class LoadingPage extends StatefulWidget{
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin{




   late AnimationController _animationController;
   late Animation<double> _opacityAnimation1;
   late Animation<double> _opacityAnimation2;
   late Animation<double> _opacityAnimation3;

   @override
   void initState() {
     super.initState();

     _animationController = AnimationController(
       vsync: this,
       duration: const Duration(milliseconds: 1000),
     )..repeat();

     _opacityAnimation1 = Tween<double>(begin: 0.2, end: 1.0).animate(
       CurvedAnimation(
         parent: _animationController,
         curve: Interval(0.0, 0.33, curve: Curves.easeInOut),
       ),
     );

     _opacityAnimation2 = Tween<double>(begin: 0.2, end: 1.0).animate(
       CurvedAnimation(
         parent: _animationController,
         curve: Interval(0.33, 0.66, curve: Curves.easeInOut),
       ),
     );

     _opacityAnimation3 = Tween<double>(begin: 0.2, end: 1.0).animate(
       CurvedAnimation(
         parent: _animationController,
         curve: Interval(0.66, 1.0, curve: Curves.easeInOut),
       ),
     );
   }

   @override
   void dispose() {
     _animationController.dispose();
     super.dispose();
   }


  @override
  Widget build(BuildContext context) {
   return Stack(
      children: [
        Background(),
        Scaffold(

          backgroundColor: Colors.transparent,

          body:  Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _opacityAnimation1.value,
                            child: Image.asset('assets/images/page2_icon.png', height: 30,width: 30,),
                          );
                        },
                      ),
                      SizedBox(width: 5),
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _opacityAnimation2.value,
                            child: Image.asset('assets/images/page2_icon.png', height: 30,width: 30,),
                          );
                        },
                      ),
                      SizedBox(width: 5),
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _opacityAnimation3.value,
                            child: Image.asset('assets/images/page2_icon.png', height: 30,width: 30,),
                          );
                        },
                      ),
                    ],
                  ),

///

                  // Stack(
                  //   alignment: Alignment.bottomRight,
                  //   children: [
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(50.0),
                  //       child: Image.asset("assets/images/loading_page.gif", height: 60,width: 60,fit: BoxFit.cover,),
                  //     )
                  //
                  //     // Image.asset("assets/images/maintenance.png", height: 35,width: 35,),
                  //   ],
                  // ),

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
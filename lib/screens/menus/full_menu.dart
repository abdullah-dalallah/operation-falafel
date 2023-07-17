import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class FullMenu extends StatelessWidget{
  const FullMenu({super.key});

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
          appBar: AppBar(
            leading:IconButton(
              onPressed: (){
               Navigator.pop(context);
              },
              icon: const ImageIcon(
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ),
            ) ,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,

            title: Image.asset("assets/images/of_logo_top.png", width: 220,),


          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children:  [
              const  SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText("FULL MENU", style: TextStyle(fontSize: 45,fontFamily: "oldpress", color: Colors.amber.shade500)),
                ],
              ),
              const  SizedBox(height: 10,),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:5,
                      childAspectRatio: 1.35,
                  ),

                  itemBuilder: (context, index) =>  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1,
                                color: Colors.amber,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child:  Image.asset("assets/images/falafel.jpg",),

                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 1.0,left: 1,right: 1),
                              child: Container(
                                decoration:const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Colors.transparent,
                                          Colors.black
                                        ])
                                ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   MyText("NEW AT O:F",style: TextStyle(fontSize: 35,fontFamily: "oldpress", color: Colors.amber.shade500)),
                                 ],
                               ),

                              ),
                            ),
                          ),
                          Positioned.fill(
                              child:  Material(
                                color: Colors.transparent,
                                child:   InkWell(
                                  borderRadius: BorderRadius.all(Radius.circular(0)),
                                  splashColor: Colors.black,
                                  overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                  onTap: (){
                                    // PersistentNavBarNavigator.pushNewScreen(
                                    //   context,
                                    //   screen: TabeBarMenu(),
                                    //   withNavBar: true, // OPTIONAL VALUE. True by default.
                                    //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    // );
                                  },
                                ),

                              )
                          ),

                        ],
                      ),
                  ),


                  itemCount: 10,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}
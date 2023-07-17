import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';

class VegetarianMenu extends StatefulWidget{
  @override
  State<VegetarianMenu> createState() => _VegetarianMenuState();
}

class _VegetarianMenuState extends State<VegetarianMenu> {
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


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [//menu_vegetarian
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset("assets/images/menu_vegetarian.png",height: 25)),
                  ),
                  const  SizedBox(width: 10,),
                  MyText("VEGETARIAN", style: TextStyle(fontSize: 35,fontFamily: "oldpress", color: Colors.green.shade700)),
                  const  SizedBox(width: 10,),
                  MyText("MENU", style: TextStyle(fontSize: 35,fontFamily: "oldpress", color: Colors.white)),
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

                    // mainAxisExtent: 1

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
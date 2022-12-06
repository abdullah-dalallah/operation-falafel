import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'add_new_address.dart';
import 'order_details.dart';

class OrderHistory extends StatelessWidget{
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
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                children: [
                  Text(getTranslated(context, "orderHistory")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                  const  SizedBox(height: 15,),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// - Image
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                      height: 25,
                                      child: VerticalDivider(color: Colors.white,thickness: 4,)),
                                  Image.asset('assets/images/page2orders_icon.png', height: 40,fit: BoxFit.cover,),
                                  const SizedBox(
                                      height: 25,
                                      child: VerticalDivider(color: Colors.white,thickness: 4,)),
                                ],
                              ),


                              /// - Text
                              const  SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(getTranslated(context, "newOrder")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.green, fontSize: 15),),
                                Text("2022-10-19 20:22:17",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white54, fontSize: 15),),

                              ],),
                              /// - buttons
                              const Expanded(child: SizedBox(width: 15,)),
                              Column(
                                  children: [
                                    SizedBox(
                                     height:30,
                                        width: 110,
                                        child: ElevatedButton(
                                            onPressed: (){
                                              PersistentNavBarNavigator.pushNewScreen(
                                                context,
                                                screen: OrderDetails(),
                                                withNavBar: true, // OPTIONAL VALUE. True by default.
                                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                              );
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.black45),
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      side:const BorderSide(color: Colors.transparent,width: 1.5)
                                                  )
                                              ),
                                              padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.document_scanner_outlined, color: Colors.white54,size:14,),
                                                SizedBox(width: 5,),
                                                Text(getTranslated(context, "viewReceipt")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize:10)),

                                              ],
                                            ),)

                                        ),
                                    const SizedBox(height: 5,),
                                    SizedBox(
                                        height:30,
                                        width: 110,
                                        child: ElevatedButton(
                                          onPressed: null,
                                          style: ButtonStyle(
                                            backgroundColor:  MaterialStateProperty.all<Color>(Colors.black45),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    side:const BorderSide(color: Colors.transparent,width: 1.5)
                                                )
                                            ),
                                            padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.refresh, color: Colors.white54,size: 14,),
                                              SizedBox(width: 5,),
                                              Text(getTranslated(context, "reOrder")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize:10)),

                                            ],
                                          ),)

                                    )

                                  ],
                                ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// - Image
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                      height: 25,
                                      child: VerticalDivider(color: Colors.white,thickness: 4,)),
                                  Image.asset('assets/images/page2orders_icon.png', height: 40,fit: BoxFit.cover,),
                                  const SizedBox(
                                      height: 25,
                                      child: VerticalDivider(color: Colors.white,thickness: 4,)),
                                ],
                              ),


                              /// - Text
                              const  SizedBox(width: 15,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(getTranslated(context, "newOrder")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.green, fontSize: 15),),
                                  Text("2022-10-19 20:22:17",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white54, fontSize: 15),),

                                ],),
                              /// - buttons
                              const Expanded(child: SizedBox(width: 15,)),
                              Column(
                                children: [
                                  SizedBox(
                                      height:30,
                                      width: 110,
                                      child: ElevatedButton(
                                        onPressed: (){
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: OrderDetails(),
                                            withNavBar: true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:  MaterialStateProperty.all<Color>(Colors.black45),
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                  side:const BorderSide(color: Colors.transparent,width: 1.5)
                                              )
                                          ),
                                          padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.document_scanner_outlined, color: Colors.white54,size:14,),
                                            SizedBox(width: 5,),
                                            Text(getTranslated(context, "viewReceipt")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize:10)),

                                          ],
                                        ),)

                                  ),
                                  const SizedBox(height: 5,),
                                  SizedBox(
                                      height:30,
                                      width: 110,
                                      child: ElevatedButton(
                                        onPressed: null,
                                        style: ButtonStyle(
                                          backgroundColor:  MaterialStateProperty.all<Color>(Colors.black45),
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                  side:const BorderSide(color: Colors.transparent,width: 1.5)
                                              )
                                          ),
                                          padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.refresh, color: Colors.white54,size: 14,),
                                            SizedBox(width: 5,),
                                            Text(getTranslated(context, "reOrder")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize:10)),

                                          ],
                                        ),)

                                  )

                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
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
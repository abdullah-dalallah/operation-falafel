import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/drawer.dart';


class TrackMyOrder extends StatefulWidget{
  @override
  State<TrackMyOrder> createState() => _TrackMyOrderState();
}

class _TrackMyOrderState extends State<TrackMyOrder> {

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey(); // Cre
  @override
  Widget build(BuildContext context) {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Image.asset(
        "assets/images/background.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
          key: _drawerKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading:IconButton(onPressed: (){

            _drawerKey.currentState?.openDrawer();
          },
            icon: const FaIcon(FontAwesomeIcons.bars,size: 30,),) ,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(getTranslated(context, "noOrder")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber.shade400, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),

              Expanded(
                  flex: 5,
                  child: Image.asset("assets/images/track_my_order_delivery_guy.png", height:350,width: 300,)),


              const Expanded(child: SizedBox(height: 1,)),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const  SizedBox(width: 30,child:  Divider(color: Colors.white,thickness: 2,)),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),

                          ),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child:const SizedBox(width: 20,height: 20,
                        ),
                      ),
                      const  SizedBox(width: 60,child: Divider(color: Colors.white,thickness: 2,)),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),

                          ),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child:const SizedBox(width: 20,height: 20,
                        ),
                      ),
                      const  SizedBox(width: 60,child:  Divider(color: Colors.white,thickness: 2,)),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),

                          ),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child: const SizedBox(width: 20,height: 20,
                        ),
                      ),
                      const SizedBox(width: 60,child:  Divider(color: Colors.white,thickness: 2,)),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),

                          ),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child: const SizedBox(width: 20,height: 20,
                        ),
                      ),
                      const SizedBox(width: 30,child:  Divider(color: Colors.white,thickness: 2,)),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child:SizedBox(
                      width: 320,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // const  SizedBox(width: 65,),
                           Expanded(child: Text(getTranslated(context, "orderAccepted")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize:13, color: Colors.white, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)),
                            // const  SizedBox(width: 30,),
                           Expanded(child: Text(getTranslated(context, "inTheKitchen")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize:13,color: Colors.white, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)),

                            // const  SizedBox(width: 40,),
                           Expanded(child: Text(getTranslated(context, "onTheWay")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize:13,color: Colors.white, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)),

                            // const  SizedBox(width: 30,),
                            Expanded(child: Text(getTranslated(context, "orderDelivered")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize:13,color: Colors.white, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)),
                            // const  SizedBox(width: 65,),
                          ],
                        ),
                    ),

                  ),
                ],
              ),


              /// - Contact us
              const  SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery. of(context). size. width,
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          children: [
                            Image.asset("assets/images/page8_phone.png" ,height: 29,color: Colors.amber,),
                            const SizedBox(width: 8,),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text(getTranslated(context, "callUs")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, ),),
                                  SizedBox(width:60,child: Divider(color:Colors.white,thickness: 1,))
                                ],
                              ),
                            )
                          ],
                        ),

                      Row(
                        children: [
                            Image.asset("assets/images/page8_mail.png", height: 25,color: Colors.amber,),
                          const SizedBox(width: 8,),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                Text(getTranslated(context, "emailUs")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, ),),
                                  SizedBox(width:double.parse(getTranslated(context, "emailUsDividerLength")!),child: Divider(color:Colors.white,thickness: 1,))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

              ),
              const  SizedBox(height: 10,)



            ],
          ),
        ),

        drawer: DrawerWidget()
      ),
    ],
  );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:expandable/expandable.dart';
import 'package:url_launcher/url_launcher.dart';

class Locations extends StatefulWidget{
  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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

                children: [

                  Text(getTranslated(context, "locationsTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset("assets/images/location_map.png", fit: BoxFit.contain,),
                  ),
                  Expanded(child:
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ListView(
                       children: [
                         ExpandableNotifier(
                             child: Padding(
                               padding: const EdgeInsets.all(0),
                               child: Container(
                                 decoration: const BoxDecoration(
                                   // boxShadow: [
                                   //   BoxShadow(
                                   //     color: Colors.grey.shade300,
                                   //     offset: Offset(0.0, 0.0), //(x,y)
                                   //     blurRadius: 5.0,
                                   //   ),
                                   // ],
                                   color: Colors.transparent,
                                   borderRadius:  BorderRadius.only(
                                     bottomRight: Radius.circular(0.0),
                                     bottomLeft: Radius.circular(0.0),
                                     topLeft: Radius.circular(0.0),
                                     topRight: Radius.circular(0.0),
                                   ),),
                                 child: ExpandablePanel(
                                       collapsed: const SizedBox(),
                                       theme: const ExpandableThemeData(
                                           headerAlignment: ExpandablePanelHeaderAlignment.center,
                                           tapBodyToExpand: true,
                                           tapBodyToCollapse: false,
                                           hasIcon: false,
                                           useInkWell: true
                                       ),
                                       header:  Padding(
                                         padding: const EdgeInsets.only(left:18.0, right:18, top: 8,bottom: 8),
                                         child: Container(
                                             height: 55,
                                             padding:  const EdgeInsets.all(5),
                                             decoration: const BoxDecoration(

                                               color: Colors.white,
                                               borderRadius: BorderRadius.only(
                                                 bottomRight: Radius.circular(0.0),
                                                 bottomLeft: Radius.circular(0.0),
                                                 topLeft: Radius.circular(0.0),
                                                 topRight: Radius.circular(0.0),
                                               ),),
                                             child:

                                             IntrinsicHeight(
                                               child: Stack(
                                                 children: [
                                                   Align(child:Text(getTranslated(context, "uae")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.black, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                                                   ),
                                                   Visibility(
                                                     visible: false,
                                                     child: Positioned(right: 0, child:  RotationTransition(
                                                       turns:  AlwaysStoppedAnimation(-15 / 600 ),
                                                       child: Padding(
                                                         padding: const EdgeInsets.all(8.0),
                                                         child: Container(
                                                           padding: const EdgeInsets.only(left:15, right:15, top:2, bottom: 2),
                                                           decoration: BoxDecoration(
                                                             color: Colors.transparent,
                                                             borderRadius: const BorderRadius.only(
                                                               topRight: Radius.circular(2),
                                                               bottomLeft: Radius.circular(2),
                                                               topLeft: Radius.circular(2),
                                                               bottomRight: Radius.circular(2),
                                                             ),
                                                             border: Border.all(
                                                               width: 3,
                                                               color: Colors.amber,
                                                               style: BorderStyle.solid,
                                                             ),
                                                           ),
                                                           child: Text(getTranslated(context, "commingSoon")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber),),



                                                         ),
                                                       ),
                                                     ),),
                                                   ),
                                                 ],
                                               ),
                                             )
                                         ),
                                       ),
                                       expanded: GridView(
                                               physics: const NeverScrollableScrollPhysics(),
                                               shrinkWrap: true,
                                               padding: const EdgeInsets.only(left:25, right: 25),
                                               gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                                 crossAxisCount: 2,
                                                 // crossAxisSpacing:5,
                                                 childAspectRatio: 1.39,
                                               ),
                                                 children: [
                                                   /// - JBR
                                                   Padding(
                                                     padding: const EdgeInsets.all(5.0),
                                                     child: Column(
                                                       children: [
                                                         Expanded(
                                                          
                                                           child: Stack(
                                                             children: [
                                                               Container(
                                                                 decoration:const BoxDecoration(
                                                                   color: Colors.transparent,
                                                                   borderRadius: BorderRadius.only(
                                                                     topRight: Radius.circular(0),
                                                                     bottomLeft: Radius.circular(0),
                                                                     topLeft: Radius.circular(0),
                                                                     bottomRight: Radius.circular(0),
                                                                   ),
                                                                   // border: Border.all(
                                                                   //   width: 1,
                                                                   //   color: Colors.amber,
                                                                   //   style: BorderStyle.solid,
                                                                   // ),
                                                                 ),
                                                                 child:Column(
                                                                   children: [
                                                                     Expanded(
                                                                       child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                                                         children:  [
                                                                           Image.asset("assets/images/driver.png",height: 30,),
                                                                           const SizedBox(width: 10,),
                                                                           Expanded(child:  Text("The Beach Mall JBR 24 hours", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                         ],
                                                                       ),
                                                                     ),
                                                                     const SizedBox(height: 15,),
                                                                      Text("Dine In and Takeaway", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),),

                                                                   ],
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
                                                                         _launchMapsUrl( 25.076743,  55.132394);
                                                                       },
                                                                     ),

                                                                   )
                                                               ),

                                                             ],
                                                           ),
                                                         ),
                                                         Expanded(
                                                           child: Row(
                                                               children: [
                                                                 Image.asset("assets/images/page8_phone.png", color: Colors.amber,height: 20,),
                                                                 const  SizedBox(width: 15,),
                                                                 Expanded(flex:2, child:  GestureDetector(
                                                                     onTap: (){
                                                                       launch("tel://0442430069");
                                                                     },
                                                                     child: Text("0442430069", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,decoration: TextDecoration.underline),))),


                                                               ],
                                                             ),
                                                         ),

                                                       ],
                                                     ),
                                                   ),
                                                   /// - bolevard
                                                   Padding(
                                                     padding: const EdgeInsets.all(5.0),
                                                     child: Column(
                                                       children: [
                                                         Expanded(
                                                           flex: 2,
                                                           child: Stack(
                                                             children: [
                                                               Container(
                                                                 decoration:const BoxDecoration(
                                                                   color: Colors.transparent,
                                                                   borderRadius: BorderRadius.only(
                                                                     topRight: Radius.circular(0),
                                                                     bottomLeft: Radius.circular(0),
                                                                     topLeft: Radius.circular(0),
                                                                     bottomRight: Radius.circular(0),
                                                                   ),
                                                                   // border: Border.all(
                                                                   //   width: 1,
                                                                   //   color: Colors.amber,
                                                                   //   style: BorderStyle.solid,
                                                                   // ),
                                                                 ),
                                                                 child:Column(
                                                                   crossAxisAlignment: CrossAxisAlignment.end,
                                                                   children: [
                                                                     Expanded(
                                                                       child: Row(
                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                                         children:  [
                                                                           Image.asset("assets/images/driver.png",height: 30,),
                                                                           const SizedBox(width: 10,),
                                                                           Expanded(child:  Text("MBR Bolevard Downtown 24 hours", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                         ],
                                                                       ),
                                                                     ),
                                                                     Center(child: Text("Dine In,Delivery and Takeaway", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                     const SizedBox(height: 15,),
                                                                   ],
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
                                                                         _launchMapsUrl( 25.191180, 55.273305);
                                                                       },
                                                                     ),

                                                                   )
                                                               ),

                                                             ],
                                                           ),
                                                         ),
                                                         Expanded(
                                                           child: Row(
                                                               children: [
                                                                 Image.asset("assets/images/page8_phone.png", color: Colors.amber,height: 20,),
                                                                 const  SizedBox(width: 15,),
                                                                 Expanded(flex:2, child:  GestureDetector(
                                                                     onTap: (){
                                                                       launch("tel://045578020");
                                                                     },
                                                                     child: Text("04 557 8020", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,decoration: TextDecoration.underline),))),


                                                               ],
                                                             ),
                                                         ),

                                                       ],
                                                     ),
                                                   ),
                                                   /// - motor city
                                                   Padding(
                                                     padding: const EdgeInsets.all(0.0),
                                                     child: Column(
                                                       children: [
                                                         Expanded(
                                                           flex: 2,
                                                           child: Stack(
                                                             children: [
                                                               Container(
                                                                 decoration:const BoxDecoration(
                                                                   color: Colors.transparent,
                                                                   borderRadius: BorderRadius.only(
                                                                     topRight: Radius.circular(0),
                                                                     bottomLeft: Radius.circular(0),
                                                                     topLeft: Radius.circular(0),
                                                                     bottomRight: Radius.circular(0),
                                                                   ),
                                                                   // border: Border.all(
                                                                   //   width: 1,
                                                                   //   color: Colors.amber,
                                                                   //   style: BorderStyle.solid,
                                                                   // ),
                                                                 ),
                                                                 child:Column(
                                                                   crossAxisAlignment: CrossAxisAlignment.end,
                                                                   children: [
                                                                     Expanded(
                                                                       child: Row(
                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                                         children:  [
                                                                           Image.asset("assets/images/driver.png",height: 30,),
                                                                           const SizedBox(width: 10,),
                                                                           Expanded(child:  Text("The Ribbon Motor City 9:00 am -1 am", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                         ],
                                                                       ),
                                                                     ),
                                                                     Center(child: Text("Dine In,Delivery and Takeaway", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                     const SizedBox(height: 15,),
                                                                   ],
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
                                                                         _launchMapsUrl( 25.045966, 55.239003);
                                                                       },
                                                                     ),

                                                                   )
                                                               ),

                                                             ],
                                                           ),
                                                         ),
                                                         Expanded(
                                                           child: Row(
                                                               children: [
                                                                 Image.asset("assets/images/page8_phone.png", color: Colors.amber,height: 20,),
                                                                 const  SizedBox(width: 15,),
                                                                 Expanded(flex:2, child:
                                                                 GestureDetector(
                                                                     onTap: (){
                                                                       launch("tel://045142805");
                                                                     },
                                                                     child: Text("04 514 2805", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,decoration: TextDecoration.underline),))),


                                                               ],
                                                             ),
                                                         ),

                                                       ],
                                                     ),
                                                   ),
                                                   /// - outlit village
                                                   Padding(
                                                     padding: const EdgeInsets.all(0.0),
                                                     child: Column(
                                                       children: [
                                                         Expanded(
                                                           flex: 2,
                                                           child: Stack(
                                                             children: [
                                                               Container(
                                                                 decoration:const BoxDecoration(
                                                                   color: Colors.transparent,
                                                                   borderRadius: BorderRadius.only(
                                                                     topRight: Radius.circular(0),
                                                                     bottomLeft: Radius.circular(0),
                                                                     topLeft: Radius.circular(0),
                                                                     bottomRight: Radius.circular(0),
                                                                   ),
                                                                   // border: Border.all(
                                                                   //   width: 1,
                                                                   //   color: Colors.amber,
                                                                   //   style: BorderStyle.solid,
                                                                   // ),
                                                                 ),
                                                                 child:Column(
                                                                   crossAxisAlignment: CrossAxisAlignment.end,
                                                                   children: [
                                                                     Expanded(
                                                                       child: Row(
                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                                         children:  [
                                                                           Image.asset("assets/images/driver.png",height: 30,),
                                                                           const SizedBox(width: 10,),
                                                                           Expanded(child:  Text("The Outlet Village 10:00 am - 12:00 am", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                         ],
                                                                       ),
                                                                     ),
                                                                     Center(child: Text("Dine In and Takeaway", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                     const SizedBox(height: 15,),
                                                                   ],
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
                                                                         _launchMapsUrl( 24.911175,  55.011204);
                                                                       },
                                                                     ),

                                                                   )
                                                               ),

                                                             ],
                                                           ),
                                                         ),
                                                         Expanded(
                                                           child: Row(
                                                               children: [
                                                                 Image.asset("assets/images/page8_phone.png", color: Colors.amber,height: 20,),
                                                                 const  SizedBox(width: 15,),
                                                                 Expanded(flex:2, child:
                                                                 GestureDetector(
                                                                     onTap: (){
                                                                       launch("tel://042731628");
                                                                     },
                                                                     child: Text("04 273 1628", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,decoration: TextDecoration.underline),))),


                                                               ],
                                                             ),
                                                         ),

                                                       ],
                                                     ),
                                                   ),
                                                   /// - media city
                                                   Padding(
                                                     padding: const EdgeInsets.all(0.0),
                                                     child: Column(
                                                       children: [
                                                         Expanded(
                                                           flex: 4,
                                                           child: Stack(
                                                             children: [
                                                               Container(
                                                                 decoration:const BoxDecoration(
                                                                   color: Colors.transparent,
                                                                   borderRadius: BorderRadius.only(
                                                                     topRight: Radius.circular(0),
                                                                     bottomLeft: Radius.circular(0),
                                                                     topLeft: Radius.circular(0),
                                                                     bottomRight: Radius.circular(0),
                                                                   ),
                                                                   // border: Border.all(
                                                                   //   width: 1,
                                                                   //   color: Colors.amber,
                                                                   //   style: BorderStyle.solid,
                                                                   // ),
                                                                 ),
                                                                 child:Column(
                                                                   crossAxisAlignment: CrossAxisAlignment.end,
                                                                   children: [
                                                                     Expanded(
                                                                       child: Row(
                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                                         children:  [
                                                                           Image.asset("assets/images/driver.png",height: 30,),
                                                                           const SizedBox(width: 10,),
                                                                           Expanded(child:  Text("Dubai Media City CNBC Building C7 - G Floor - Dubai\nOpen 24 hours", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                         ],
                                                                       ),
                                                                     ),
                                                                     Center(child: Text("Dine In,Delivery and Takeaway", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                                     const SizedBox(height: 15,),
                                                                   ],
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
                                                                         _launchMapsUrl( 25.0953904,55.156927);
                                                                       },
                                                                     ),

                                                                   )
                                                               ),

                                                             ],
                                                           ),
                                                         ),
                                                         Expanded(
                                                           flex: 1,
                                                            child: Row(
                                                               children: [
                                                                 Image.asset("assets/images/page8_phone.png", color: Colors.amber,height: 20,),
                                                                 const  SizedBox(width: 15,),
                                                                 Expanded(flex:2, child:
                                                                 GestureDetector(
                                                                     onTap: (){
                                                                       launch("tel://600530006");
                                                                     },
                                                                     child: Text("600 530006", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,decoration: TextDecoration.underline),))),


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
                             )),
                         ExpandableNotifier(
                             child: Padding(
                               padding: const EdgeInsets.all(0),
                               child: Container(
                                 decoration: const BoxDecoration(
                                   // boxShadow: [
                                   //   BoxShadow(
                                   //     color: Colors.grey.shade300,
                                   //     offset: Offset(0.0, 0.0), //(x,y)
                                   //     blurRadius: 5.0,
                                   //   ),
                                   // ],
                                   color: Colors.transparent,
                                   borderRadius:  BorderRadius.only(
                                     bottomRight: Radius.circular(0.0),
                                     bottomLeft: Radius.circular(0.0),
                                     topLeft: Radius.circular(0.0),
                                     topRight: Radius.circular(0.0),
                                   ),),
                                 child: ExpandablePanel(
                                   collapsed: const SizedBox(),
                                   theme: const ExpandableThemeData(
                                       headerAlignment: ExpandablePanelHeaderAlignment.center,
                                       tapBodyToExpand: true,
                                       tapBodyToCollapse: false,
                                       hasIcon: false,
                                       useInkWell: true
                                   ),
                                   header:   Padding(
                                     padding: const EdgeInsets.only(left:18.0, right:18, top: 8,bottom: 8),
                                     child: Container(
                                         height: 55,
                                         padding:  const EdgeInsets.all(5),
                                         decoration: const BoxDecoration(

                                           color: Colors.white,
                                           borderRadius: BorderRadius.only(
                                             bottomRight: Radius.circular(0.0),
                                             bottomLeft: Radius.circular(0.0),
                                             topLeft: Radius.circular(0.0),
                                             topRight: Radius.circular(0.0),
                                           ),),
                                         child:

                                         IntrinsicHeight(
                                           child: Stack(
                                             children: [
                                               Align(child:Text(getTranslated(context, "ksa")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.black, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                                               ),
                                               Visibility(
                                                 visible: false,
                                                 child: Positioned(right: 0, child:  RotationTransition(
                                                   turns:  AlwaysStoppedAnimation(-15 / 600 ),
                                                   child: Padding(
                                                     padding: const EdgeInsets.all(8.0),
                                                     child: Container(
                                                       padding: const EdgeInsets.only(left:15, right:15, top:2, bottom: 2),
                                                       decoration: BoxDecoration(
                                                         color: Colors.transparent,
                                                         borderRadius: const BorderRadius.only(
                                                           topRight: Radius.circular(2),
                                                           bottomLeft: Radius.circular(2),
                                                           topLeft: Radius.circular(2),
                                                           bottomRight: Radius.circular(2),
                                                         ),
                                                         border: Border.all(
                                                           width: 3,
                                                           color: Colors.amber,
                                                           style: BorderStyle.solid,
                                                         ),
                                                       ),
                                                       child: Text(getTranslated(context, "commingSoon")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber),),



                                                     ),
                                                   ),
                                                 ),),
                                               ),
                                             ],
                                           ),
                                         )
                                     ),
                                   ),
                                   expanded: GridView(
                                     physics: const NeverScrollableScrollPhysics(),
                                     shrinkWrap: true,
                                     padding: const EdgeInsets.only(left:25, right: 25),
                                     gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                       crossAxisCount: 2,
                                       // crossAxisSpacing:5,
                                       childAspectRatio: 1.39,
                                     ),
                                     children: [
                                       /// - rubeen plaza
                                       Padding(
                                         padding: const EdgeInsets.all(5.0),
                                         child: Column(
                                           children: [
                                             Expanded(
                                              flex: 2,
                                               child: Stack(
                                                 children: [
                                                   Container(
                                                     decoration:const BoxDecoration(
                                                       color: Colors.transparent,
                                                       borderRadius: BorderRadius.only(
                                                         topRight: Radius.circular(0),
                                                         bottomLeft: Radius.circular(0),
                                                         topLeft: Radius.circular(0),
                                                         bottomRight: Radius.circular(0),
                                                       ),
                                                       // border: Border.all(
                                                       //   width: 1,
                                                       //   color: Colors.amber,
                                                       //   style: BorderStyle.solid,
                                                       // ),
                                                     ),
                                                     child:Column(
                                                       children: [
                                                         Expanded(
                                                           child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                                             children:  [
                                                               Image.asset("assets/images/driver.png",height: 30,),
                                                               const SizedBox(width: 10,),
                                                               Expanded(child:  Text("Rubeen Plaza,Northern Ring Branch Road,Hittin 7 am - 1 am", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                             ],
                                                           ),
                                                         ),
                                                         const SizedBox(height: 15,),
                                                         Text("Dine In , Takeaway", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),),

                                                       ],
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
                                                             _launchMapsUrl(24.7524000, 46.6255000);
                                                           },
                                                         ),

                                                       )
                                                   ),

                                                 ],
                                               ),
                                             ),
                                             Expanded(
                                               child: Row(
                                                 children: [
                                                   Image.asset("assets/images/page8_phone.png", color: Colors.amber,height: 20,),
                                                   const  SizedBox(width: 15,),
                                                   Expanded(flex:2, child:  GestureDetector(
                                                       onTap: (){
                                                         launch("tel://0112465709");
                                                       },
                                                       child: Text("0112465709", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,decoration: TextDecoration.underline),))),


                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       /// - al-shatea square
                                       Padding(
                                         padding: const EdgeInsets.all(5.0),
                                         child: Column(
                                           children: [
                                             Expanded(
                                               flex: 3,
                                               child: Stack(
                                                 children: [
                                                   Container(
                                                     decoration:const BoxDecoration(
                                                       color: Colors.transparent,
                                                       borderRadius: BorderRadius.only(
                                                         topRight: Radius.circular(0),
                                                         bottomLeft: Radius.circular(0),
                                                         topLeft: Radius.circular(0),
                                                         bottomRight: Radius.circular(0),
                                                       ),
                                                       // border: Border.all(
                                                       //   width: 1,
                                                       //   color: Colors.amber,
                                                       //   style: BorderStyle.solid,
                                                       // ),
                                                     ),
                                                     child:Column(
                                                       crossAxisAlignment: CrossAxisAlignment.end,
                                                       children: [
                                                         Expanded(
                                                           child: Row(
                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                                             children:  [
                                                               Image.asset("assets/images/driver.png",height: 30,),
                                                               const SizedBox(width: 10,),
                                                               Expanded(child:  Text("Al-Shatea Square,Ash Shati Al Gharabi street 15 7am - 1 am", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                             ],
                                                           ),
                                                         ),
                                                         Center(child: Text("Dine In,pickup", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                         const SizedBox(height: 15,),
                                                       ],
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
                                                             _launchMapsUrl(24.9126000, 55.0105000);
                                                           },
                                                         ),

                                                       )
                                                   ),

                                                 ],
                                               ),
                                             ),
                                             Expanded(
                                               child: Row(
                                                 children: [
                                                   Image.asset("assets/images/page8_phone.png", color: Colors.amber,height: 20,),
                                                   const  SizedBox(width: 15,),
                                                   Expanded(flex:2, child:  GestureDetector(
                                                       onTap: (){
                                                         launch("tel://920029970");
                                                       },
                                                       child: Text("920029970", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,decoration: TextDecoration.underline),))),


                                                 ],
                                               ),
                                             ),

                                           ],
                                         ),
                                       ),
                                       /// - dhahran mall
                                       Padding(
                                         padding: const EdgeInsets.all(0.0),
                                         child: Column(
                                           children: [
                                             Expanded(
                                               flex: 2,
                                               child: Stack(
                                                 children: [
                                                   Container(
                                                     decoration:const BoxDecoration(
                                                       color: Colors.transparent,
                                                       borderRadius: BorderRadius.only(
                                                         topRight: Radius.circular(0),
                                                         bottomLeft: Radius.circular(0),
                                                         topLeft: Radius.circular(0),
                                                         bottomRight: Radius.circular(0),
                                                       ),
                                                       // border: Border.all(
                                                       //   width: 1,
                                                       //   color: Colors.amber,
                                                       //   style: BorderStyle.solid,
                                                       // ),
                                                     ),
                                                     child:Column(
                                                       crossAxisAlignment: CrossAxisAlignment.end,
                                                       children: [
                                                         Expanded(
                                                           child: Row(
                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                                             children:  [
                                                               Image.asset("assets/images/driver.png",height: 30,),
                                                               const SizedBox(width: 10,),
                                                               Expanded(child:  Text("Dhahran Mall. Gate 10 9:00 am - 12:00 am", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                             ],
                                                           ),
                                                         ),
                                                         Center(child: Text("Dine in, Takeaway", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white),)),
                                                         const SizedBox(height: 15,),
                                                       ],
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
                                                             _launchMapsUrl(24.9126000, 55.0105000);
                                                           },
                                                         ),

                                                       )
                                                   ),

                                                 ],
                                               ),
                                             ),
                                             Expanded(
                                               child: Row(
                                                 children: [
                                                   Image.asset("assets/images/page8_phone.png", color: Colors.amber,height: 20,),
                                                   const  SizedBox(width: 15,),
                                                   Expanded(flex:2, child:
                                                   GestureDetector(
                                                       onTap: (){
                                                         launch("tel://920029970");
                                                       },
                                                       child: Text("920029970", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white,decoration: TextDecoration.underline),))),


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
                             )),
                         Padding(
                           padding: const EdgeInsets.only(left:18.0, right:18, top: 8,bottom: 8),
                           child: Container(
                               height: 55,
                               padding:  const EdgeInsets.all(5),
                               decoration: const BoxDecoration(

                                 color: Colors.white,
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(0.0),
                                   bottomLeft: Radius.circular(0.0),
                                   topLeft: Radius.circular(0.0),
                                   topRight: Radius.circular(0.0),
                                 ),),
                               child:

                               IntrinsicHeight(
                                 child: Stack(
                                   children: [
                                     Align(child:Text(getTranslated(context, "france")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.black, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                                     ),
                                     Positioned(right: 0, child:  RotationTransition(
                                       turns:  AlwaysStoppedAnimation(-15 / 600 ),
                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Container(
                                           padding: const EdgeInsets.only(left:15, right:15, top:2, bottom: 2),
                                           decoration: BoxDecoration(
                                             color: Colors.transparent,
                                             borderRadius: const BorderRadius.only(
                                               topRight: Radius.circular(2),
                                               bottomLeft: Radius.circular(2),
                                               topLeft: Radius.circular(2),
                                               bottomRight: Radius.circular(2),
                                             ),
                                             border: Border.all(
                                               width: 3,
                                               color: Colors.amber,
                                               style: BorderStyle.solid,
                                             ),
                                           ),
                                           child: Text(getTranslated(context, "commingSoon")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber),),



                                         ),
                                       ),
                                     ),),
                                   ],
                                 ),
                               )
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:18.0, right:18, top: 8,bottom: 8),
                           child: Container(
                               height: 55,
                               padding:  const EdgeInsets.all(5),
                               decoration: const BoxDecoration(

                                 color: Colors.white,
                                 borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(0.0),
                                   bottomLeft: Radius.circular(0.0),
                                   topLeft: Radius.circular(0.0),
                                   topRight: Radius.circular(0.0),
                                 ),),
                               child:

                               IntrinsicHeight(
                                 child: Stack(
                                   children: [
                                     Align(child:Text(getTranslated(context, "usa")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.black, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                                     ),
                                     Positioned(right: 0, child:  RotationTransition(
                                       turns:  AlwaysStoppedAnimation(-15 / 600 ),
                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Container(
                                           padding: const EdgeInsets.only(left:15, right:15, top:2, bottom: 2),
                                           decoration: BoxDecoration(
                                             color: Colors.transparent,
                                             borderRadius: const BorderRadius.only(
                                               topRight: Radius.circular(2),
                                               bottomLeft: Radius.circular(2),
                                               topLeft: Radius.circular(2),
                                               bottomRight: Radius.circular(2),
                                             ),
                                             border: Border.all(
                                               width: 3,
                                               color: Colors.amber,
                                               style: BorderStyle.solid,
                                             ),
                                           ),
                                           child: Text(getTranslated(context, "commingSoon")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber),),



                                         ),
                                       ),
                                     ),),
                                   ],
                                 ),
                               )
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:18.0, right:18, top: 8,bottom: 8),
                           child: Container(
                             height: 55,
                             padding:  const EdgeInsets.all(5),
                             decoration: const BoxDecoration(

                               color: Colors.white,
                               borderRadius: BorderRadius.only(
                                 bottomRight: Radius.circular(0.0),
                                 bottomLeft: Radius.circular(0.0),
                                 topLeft: Radius.circular(0.0),
                                 topRight: Radius.circular(0.0),
                               ),),
                             child:

                             IntrinsicHeight(
                               child: Stack(
                                 children: [
                                   Align(child:                                        Text(getTranslated(context, "uk")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.black, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                                   ),
                                   Positioned(right: 0, child:  RotationTransition(
                                     turns:  AlwaysStoppedAnimation(-15 / 600 ),
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Container(
                                         padding: const EdgeInsets.only(left:15, right:15, top:2, bottom: 2),
                                         decoration: BoxDecoration(
                                           color: Colors.transparent,
                                           borderRadius: const BorderRadius.only(
                                             topRight: Radius.circular(2),
                                             bottomLeft: Radius.circular(2),
                                             topLeft: Radius.circular(2),
                                             bottomRight: Radius.circular(2),
                                           ),
                                           border: Border.all(
                                             width: 3,
                                             color: Colors.amber,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Text(getTranslated(context, "commingSoon")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber),),



                                       ),
                                     ),
                                   ),),
                                 ],
                               ),
                             )
                           ),
                         ),




                       ],

                    ),
                  ))
                ],
              ),
            ),
          ),

        )
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class GiftFriend extends StatefulWidget{
  @override
  State<GiftFriend> createState() => _GiftFriendState();
}

class _GiftFriendState extends State<GiftFriend> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
   return Stack(
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
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset("assets/images/gift.png", height: 60,width: 60,),
                         SizedBox(width: 15,),
                         Text(getTranslated(context, "giftfriend")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.white, fontSize: double.parse(getTranslated(context, "fontFamilyTitle??Size")!)),),
                         SizedBox(width: 15,),
                         Image.asset("assets/images/gift.png", height: 60,width: 60,),
                       ],
                     ),

                     const SizedBox(height: 50,),

                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(18.0),
                         child: ListView(
                           children: [
                              /// - Name
                              TextField(

                               autofocus: false,
                               style: const TextStyle(color: Colors.white),
                               decoration:  InputDecoration(
                                 filled: true,
                                 fillColor: Colors.black45,
                                 contentPadding: const EdgeInsets.only(left:10, right: 10),
                                 focusedBorder: const OutlineInputBorder(
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(10.0),
                                   ),
                                   borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                 ),
                                 enabledBorder:const OutlineInputBorder(
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(10.0),
                                   ),
                                   borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                 ),
                                hintText: getTranslated(context, "name")!,
                                 hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                               ),

                             ),
                             const SizedBox(height: 20,),
                              /// - Mobile No
                             TextField(
                               keyboardType: TextInputType.number,

                               autofocus: false,
                               style: const TextStyle(color: Colors.white),
                               decoration:  InputDecoration(

                                 filled: true,
                                 fillColor: Colors.black45,
                                 contentPadding: const EdgeInsets.only(left:10, right: 10),
                                 focusedBorder: const OutlineInputBorder(
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(10.0),
                                   ),
                                   borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                 ),
                                 enabledBorder:const OutlineInputBorder(
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(10.0),
                                   ),
                                   borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                 ),
                                 hintText: getTranslated(context, "mobileNo")!,
                                 hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                               ),

                             ),
                             const SizedBox(height: 20,),
                             /// - Email Address
                             TextField(


                               autofocus: false,
                               style: const TextStyle(color: Colors.white),
                               decoration:  InputDecoration(

                                 filled: true,
                                 fillColor: Colors.black45,
                                 contentPadding: const EdgeInsets.only(left:10, right: 10),
                                 focusedBorder: const OutlineInputBorder(
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(10.0),
                                   ),
                                   borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                 ),
                                 enabledBorder:const OutlineInputBorder(
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(10.0),
                                   ),
                                   borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                 ),
                                 hintText: getTranslated(context, "emailAddress")!,
                                 hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                               ),

                             ),
                             const SizedBox(height: 20,),
                             /// - Add Notes
                             TextField(


                               autofocus: false,
                               style: const TextStyle(color: Colors.white),
                               decoration:  InputDecoration(

                                 filled: true,
                                 fillColor: Colors.black45,
                                 contentPadding: const EdgeInsets.only(left:10, right: 10),
                                 focusedBorder: const OutlineInputBorder(
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(10.0),
                                   ),
                                   borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                 ),
                                 enabledBorder:const OutlineInputBorder(
                                   borderRadius:  BorderRadius.all(
                                     Radius.circular(10.0),
                                   ),
                                   borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                 ),
                                 hintText: getTranslated(context, "addNots")!,
                                 hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                               ),

                             ),

                           ],
                         ),
                       ),
                     ),

                     /// - Submit button
                     Center(
                       child: Stack(
                         alignment: Alignment.center,
                         children: [
                           Container(
                             width: 50,
                             height: 50,
                             decoration: BoxDecoration(
                               color: Colors.transparent,
                               borderRadius:const BorderRadius.only(
                                 topRight: Radius.circular(40),
                                 bottomLeft: Radius.circular(40),
                                 topLeft: Radius.circular(40),
                                 bottomRight: Radius.circular(40),
                               ),
                               // border: Border.all(
                               //   width: 0.5,
                               //   color: Colors.white,
                               //   style: BorderStyle.solid,
                               // ),
                             ),
                             child:Icon(Icons.check, color:Colors.white,),
                           ),
                           Container(
                             width: 40,
                             height: 40,
                             decoration: BoxDecoration(
                               color: Colors.amber,
                               borderRadius:const BorderRadius.only(
                                 topRight: Radius.circular(40),
                                 bottomLeft: Radius.circular(40),
                                 topLeft: Radius.circular(40),
                                 bottomRight: Radius.circular(40),
                               ),
                               // border: Border.all(
                               //   width: 0.5,
                               //   color: Colors.white,
                               //   style: BorderStyle.solid,
                               // ),
                             ),
                             // child:Icon(Icons.check, color:Colors.white,),
                           ),
                           Positioned(
                             bottom:8,
                             right:9,

                             child: Container(
                               width: 40,
                               height: 40,
                               decoration: BoxDecoration(
                                 color: Colors.transparent,
                                 borderRadius:const BorderRadius.only(
                                   topRight: Radius.circular(40),
                                   bottomLeft: Radius.circular(40),
                                   topLeft: Radius.circular(40),
                                   bottomRight: Radius.circular(40),
                                 ),
                                 border: Border.all(
                                   width: 3,
                                   color: Colors.white,
                                   style: BorderStyle.solid,
                                 ),
                               ),
                               child:Icon(Icons.check, color:Colors.white,size: 30,),
                             ),
                           ),

                           new Positioned.fill(
                               child: new Material(
                                 color: Colors.transparent,
                                 child:  new InkWell(
                                   borderRadius: BorderRadius.all(Radius.circular(100)),
                                   splashColor: Colors.black45,
                                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                   onTap: (){

                                   },
                                 ),

                               )
                           ),

                         ],
                       ),
                     ),
                      // Stack(
                      //    children: [
                      //      Container(
                      //        width: 50,
                      //        height: 50,
                      //        decoration: BoxDecoration(
                      //          color: Colors.transparent,
                      //          borderRadius:const BorderRadius.only(
                      //            topRight: Radius.circular(40),
                      //            bottomLeft: Radius.circular(40),
                      //            topLeft: Radius.circular(40),
                      //            bottomRight: Radius.circular(40),
                      //          ),
                      //          // border: Border.all(
                      //          //   width: 0.5,
                      //          //   color: Colors.white,
                      //          //   style: BorderStyle.solid,
                      //          // ),
                      //        ),
                      //        child: Image.asset("assets/images/page4_confirm_button.png",height: 60,width: 60,),
                      //      ),
                      //
                      //      new Positioned.fill(
                      //          child: new Material(
                      //            color: Colors.transparent,
                      //            child:  new InkWell(
                      //              borderRadius: BorderRadius.all(Radius.circular(100)),
                      //              splashColor: Colors.black,
                      //              overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                      //
                      //              onTap: (){
                      //
                      //              },
                      //            ),
                      //
                      //          )
                      //      ),
                      //
                      //    ],
                      //  ),

                     const SizedBox(height:15,),
                   ],
                 ),
            ),
          ),



       )
     ],
   );
  }
}
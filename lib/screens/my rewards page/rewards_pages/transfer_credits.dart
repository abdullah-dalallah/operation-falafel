import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'dart:math' as math;

class TransferCredit extends StatefulWidget{
  @override
  State<TransferCredit> createState() => _TransferCreditState();
}

class _TransferCreditState extends State<TransferCredit> {
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
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Expanded(
                   child: ListView(
                     children: [
                       /// - Title
                       Row(
                           crossAxisAlignment: CrossAxisAlignment.center,

                           children: [
                             Expanded(
                               // flex: 2,
                                 child:
                                 Padding(
                                   padding: const EdgeInsets.all(38.0),
                                   child: Text(getTranslated(context, "transferCreditsTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),textAlign: TextAlign.center,),
                                 )
                             ),



                             Expanded(flex:1,child: Image.asset("assets/images/transfer_image.png", height: 170,width: 170,),),



                           ],
                         ),


                       SizedBox(height: 25,),
                       /// - enter Amount
                       Padding(
                         padding: const EdgeInsets.only(left:18.0, right: 18),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Expanded(
                               flex:  (Localizations.localeOf(context).languageCode=='en')?3:2,
                               child: SizedBox(
                                 // width: 295,
                                 height: 50,
                                 child:   TextField(
                                   keyboardType: TextInputType.number,
                                   autofocus: false,
                                   style:const TextStyle(color: Colors.white70),
                                   decoration:  InputDecoration(

                                     filled: true,
                                     fillColor: Colors.black45,
                                     contentPadding:const EdgeInsets.only(left:10,right: 10 ),
                                     focusedBorder:const OutlineInputBorder(
                                       borderRadius:
                                        BorderRadius.only(
                                         bottomLeft:  Radius.circular(10.0),
                                         topLeft: Radius.circular(10.0),
                                         bottomRight:     Radius.circular(10),
                                         topRight: Radius.circular(10),
                                       ),



                                       borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius:  const BorderRadius.only(
                                         bottomLeft:  Radius.circular(10.0),
                                         topLeft: Radius.circular(10.0),
                                         bottomRight:     Radius.circular(10),
                                         topRight: Radius.circular(10),
                                       ),
                                       borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                     ),
                                     hintText: getTranslated(context, "enterAmount")!,
                                     hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                   ),

                                 ),
                               ),
                             ),
                             Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.only(bottom: 2.0),
                                 child: SizedBox(
                                   // width:80,
                                   height: 48,
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text('0', style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),),
                                       Text(getTranslated(context, "creditLefts")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white),),
                                     ],
                                   )
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(height: 25,),
                       /// Name
                       Padding(
                         padding: const EdgeInsets.only(left:18.0, right: 18),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Expanded(
                               flex: 3,
                               child: SizedBox(
                                 // width: 295,
                                 height: 50,
                                 child:   TextField(
                                   keyboardType: TextInputType.number,
                                   autofocus: false,
                                   style:const TextStyle(color: Colors.white70),
                                   decoration:  InputDecoration(

                                     filled: true,
                                     fillColor: Colors.black45,
                                     contentPadding:const EdgeInsets.only(left:10,right: 10 ),
                                     focusedBorder:const OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.only(
                                         bottomLeft:  Radius.circular(10.0),
                                         topLeft: Radius.circular(10.0),
                                         bottomRight:     Radius.circular(10),
                                         topRight: Radius.circular(10),
                                       ),



                                       borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius:  const BorderRadius.only(
                                         bottomLeft:  Radius.circular(10.0),
                                         topLeft: Radius.circular(10.0),
                                         bottomRight:     Radius.circular(10),
                                         topRight: Radius.circular(10),
                                       ),
                                       borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                     ),
                                     hintText: getTranslated(context, "name")!,
                                     hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                   ),

                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(height: 25,),
                       /// - Mobile No
                       Padding(
                         padding: const EdgeInsets.only(left:18.0, right: 18),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Expanded(
                               flex: 3,
                               child: SizedBox(
                                 // width: 295,
                                 height: 50,
                                 child:   TextField(
                                   keyboardType: TextInputType.number,
                                   autofocus: false,
                                   style:const TextStyle(color: Colors.white70),
                                   decoration:  InputDecoration(

                                     filled: true,
                                     fillColor: Colors.black45,
                                     contentPadding:const EdgeInsets.only(left:10,right: 10 ),
                                     focusedBorder:const OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.only(
                                         bottomLeft:  Radius.circular(10.0),
                                         topLeft: Radius.circular(10.0),
                                         bottomRight:     Radius.circular(10),
                                         topRight: Radius.circular(10),
                                       ),



                                       borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius:  const BorderRadius.only(
                                         bottomLeft:  Radius.circular(10.0),
                                         topLeft: Radius.circular(10.0),
                                         bottomRight:     Radius.circular(10),
                                         topRight: Radius.circular(10),
                                       ),
                                       borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                     ),
                                     hintText: getTranslated(context, "mobileNo")!,
                                     hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                   ),

                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(height: 25,),
                       /// -Email Address
                       Padding(
                         padding: const EdgeInsets.only(left:18.0, right: 18),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Expanded(
                               flex: 3,
                               child: SizedBox(
                                 // width: 295,
                                 height: 50,
                                 child:   TextField(
                                   keyboardType: TextInputType.number,
                                   autofocus: false,
                                   style:const TextStyle(color: Colors.white70),
                                   decoration:  InputDecoration(

                                     filled: true,
                                     fillColor: Colors.black45,
                                     contentPadding:const EdgeInsets.only(left:10,right: 10 ),
                                     focusedBorder:const OutlineInputBorder(
                                       borderRadius:
                                       BorderRadius.only(
                                         bottomLeft:  Radius.circular(10.0),
                                         topLeft: Radius.circular(10.0),
                                         bottomRight:     Radius.circular(10),
                                         topRight: Radius.circular(10),
                                       ),



                                       borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                     ),
                                     enabledBorder:const  OutlineInputBorder(
                                       borderRadius:   BorderRadius.only(
                                         bottomLeft:  Radius.circular(10.0),
                                         topLeft: Radius.circular(10.0),
                                         bottomRight:     Radius.circular(10),
                                         topRight: Radius.circular(10),
                                       ),
                                       borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                     ),
                                     hintText: getTranslated(context, "emailAddress")!,
                                     hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                   ),

                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),






                     ],
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

                 SizedBox(height: 25,)

               ],
             ),
           ),
         ),
       ),
     ],
   );

  }
}
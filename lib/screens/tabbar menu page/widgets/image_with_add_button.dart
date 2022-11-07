import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:operation_falafel/screens/item%20details%20page/item_details_sheet.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/widgets/repeat_last_customization_sheet.dart';

class ImageWithAddButton extends StatefulWidget{

  @override
  State<ImageWithAddButton> createState() => _ImageWithAddButtonState();
}

class _ImageWithAddButtonState extends State<ImageWithAddButton> {
  bool addFirstTime =true;
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     height: 130,
     child: Stack(
       alignment: Alignment.topCenter,
       children: [
         /// - Image
         Container(
             width: 100,
             height: 100,
             decoration: const BoxDecoration(
               borderRadius:  BorderRadius.only(
                 topRight: Radius.circular(10),
                 bottomLeft: Radius.circular(10),
                 topLeft: Radius.circular(10),
                 bottomRight: Radius.circular(10),

               ),
               color: Colors.transparent,
               // border: Border.all(
               //   width: 0.8,
               //   color: Colors.white,
               //   style: BorderStyle.solid,
               // ),
             ),
             child:  ClipRRect(
                 borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(10),
                   topRight: Radius.circular(10),
                   bottomLeft: Radius.circular(10),
                   bottomRight: Radius.circular(10),

                 ),
                 child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,))
         ),
         /// - Add button
         Visibility(
           visible: addFirstTime,
           child: Positioned(
             bottom:13,
             child: Align(
               alignment:Alignment.bottomCenter,
               child: Container(
                 decoration:const BoxDecoration(
                   borderRadius:  BorderRadius.only(
                     topRight: Radius.circular(10),
                     bottomLeft: Radius.circular(10),
                     topLeft: Radius.circular(10),
                     bottomRight: Radius.circular(10),
                   ),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black12,
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 3), // changes position of shadow
                     ),
                   ],
                   // border: Border.all(
                   //   width: 0.8,
                   //   color: Colors.white,
                   //   style: BorderStyle.solid,
                   // ),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Stack(
                       alignment: Alignment.topRight,
                       children: [
                         SizedBox(
                           width:80,
                           height:30,

                           child: ElevatedButton(
                             onPressed: () {
                               setState(() {
                                 addFirstTime= false;
                               });
                               showMaterialModalBottomSheet(
                                   expand: false,
                                   context: context,
                                   backgroundColor: Colors.transparent,
                                   builder: (context) =>
                                       DraggableScrollableSheet(
                                           initialChildSize: 0.7,
                                           minChildSize: 0.6,
                                           maxChildSize: 1,
                                           expand: true,
                                           builder: (context, scrollController) {
                                             return ItemDetailsSheet(scrollController);
                                           }

                                       )

                               );
                             },
                             style: ButtonStyle(
                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                     const RoundedRectangleBorder(
                                         borderRadius: BorderRadius.all(Radius.circular(10)),
                                         side: BorderSide(color: Colors.transparent,width: 1)
                                     )
                                 ),
                                 overlayColor: MaterialStateProperty.all(Colors.black12),
                                 elevation:MaterialStateProperty.all(0),
                                 shadowColor: MaterialStateProperty.all(Colors.transparent),
                                 backgroundColor: MaterialStateProperty.all(Colors.amber.shade300.withOpacity(0.3)),
                                 foregroundColor: MaterialStateProperty.all(Colors.black),
                                 padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                 textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                             child: const Text('ADD ', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                           ),
                         ),
                         const  Padding(
                           padding:  EdgeInsets.all(4.0),
                           child: Icon(Icons.add, size:10,),
                         )
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),
         /// - Pluse & minuse
         Visibility(
           visible: !addFirstTime,
           child: Positioned(
             bottom:13,
             child: Align(
               alignment:Alignment.bottomCenter,
               child: Container(
                 decoration:const BoxDecoration(
                   borderRadius:  BorderRadius.only(
                     topRight: Radius.circular(10),
                     bottomLeft: Radius.circular(10),
                     topLeft: Radius.circular(10),
                     bottomRight: Radius.circular(10),
                   ),
                   color: Colors.amber,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black12,
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 3), // changes position of shadow
                     ),
                   ],
                   // border: Border.all(
                   //   width: 0.8,
                   //   color: Colors.white,
                   //   style: BorderStyle.solid,
                   // ),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     SizedBox(
                       width:30,
                       height:30,

                       child: ElevatedButton(
                         onPressed: () {},
                         style: ButtonStyle(
                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                 (Localizations.localeOf(context).languageCode=='en')?
                                 const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                       bottomLeft:     Radius.circular(10),
                                       topLeft: Radius.circular(10),
                                     ),
                                     side: BorderSide(color: Colors.transparent)
                                 ):
                                 (Localizations.localeOf(context).languageCode=='ar')?
                                 const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                       bottomRight:     Radius.circular(10),
                                       topRight: Radius.circular(10),
                                     ),
                                     side: BorderSide(color: Colors.transparent)
                                 ):
                                 const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                       bottomLeft:     Radius.circular(10),
                                       topLeft: Radius.circular(10),
                                     ),
                                     side: BorderSide(color: Colors.transparent)
                                 )
                             ),
                             elevation:MaterialStateProperty.all(0),
                             shadowColor: MaterialStateProperty.all(Colors.transparent),
                             backgroundColor: MaterialStateProperty.all(Colors.amber),
                             foregroundColor: MaterialStateProperty.all(Colors.black),
                             padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                             textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                         child:const Icon(Icons.remove,size: 18,),
                       ),
                     ),
                     const SizedBox(width:30, child: Text("1",textAlign: TextAlign.center,),),
                     SizedBox(
                       width:30,
                       height:30,

                       child: ElevatedButton(
                         onPressed: () {
                           showMaterialModalBottomSheet(
                               expand: false,
                               context: context,
                               backgroundColor: Colors.transparent,
                               builder: (context) =>
                                   DraggableScrollableSheet(
                                       initialChildSize: 0.33,
                                       minChildSize: 0.3,
                                       maxChildSize: 0.4,
                                       expand: true,
                                       builder: (context, scrollController) {
                                        return RepeatLastCustomizationSheet(scrollController: scrollController);
                                       }

                                   )

                           );

                         },
                         style: ButtonStyle(
                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                 (Localizations.localeOf(context).languageCode=='en')?
                                 const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                       bottomRight:     Radius.circular(10),
                                       topRight: Radius.circular(10),
                                     ),
                                     side: BorderSide(color: Colors.transparent)
                                 ):
                                 (Localizations.localeOf(context).languageCode=='ar')?
                                 const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                       bottomLeft:     Radius.circular(10),
                                       topLeft: Radius.circular(10),
                                     ),
                                     side: BorderSide(color: Colors.transparent)
                                 ):
                                 const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(
                                       bottomRight:     Radius.circular(10),
                                       topRight: Radius.circular(10),
                                     ),
                                     side: BorderSide(color: Colors.transparent)
                                 )
                             ),
                             elevation:MaterialStateProperty.all(0),
                             shadowColor: MaterialStateProperty.all(Colors.transparent),
                             backgroundColor: MaterialStateProperty.all(Colors.amber),
                             foregroundColor: MaterialStateProperty.all(Colors.black),
                             padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                             textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                         child: const Icon(Icons.add,size: 18,),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),

       ],
     ),
   );
  }
}
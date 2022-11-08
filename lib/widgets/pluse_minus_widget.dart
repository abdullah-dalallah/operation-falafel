import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PluseMinusWidget extends StatefulWidget{
  const PluseMinusWidget({super.key});

  @override
  State<PluseMinusWidget> createState() => _PluseMinusWidgetState();
}

class _PluseMinusWidgetState extends State<PluseMinusWidget> {
  int ItemQuantity = 0;
  @override
  Widget build(BuildContext context) {
     return Align(
       alignment:Alignment.bottomCenter,
       child: Container(
         decoration:const BoxDecoration(
           borderRadius:  BorderRadius.only(
             topRight: Radius.circular(10),
             bottomLeft: Radius.circular(10),
             topLeft: Radius.circular(10),
             bottomRight: Radius.circular(10),
           ),
           color: Colors.black,
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
               height:25,

               child: ElevatedButton(
                 onPressed: () {
                   if(ItemQuantity>0){
                     setState(() {
                       ItemQuantity--;
                     });
                   }

                 },
                 style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         (Localizations.localeOf(context).languageCode=='en')?
                         const RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(
                               bottomLeft:     Radius.circular(5),
                               topLeft: Radius.circular(5),
                             ),
                             side: BorderSide(color: Colors.transparent)
                         ):
                         (Localizations.localeOf(context).languageCode=='ar')?
                         const RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(
                               bottomRight:     Radius.circular(5),
                               topRight: Radius.circular(5),
                             ),
                             side: BorderSide(color: Colors.transparent)
                         ):
                         const RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(
                               bottomLeft:     Radius.circular(5),
                               topLeft: Radius.circular(5),
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
              SizedBox(width:30, child: Text(  "${ItemQuantity}" ,textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),),
             SizedBox(
               width:30,
               height:25,

               child: ElevatedButton(
                 onPressed: () {
                   if(ItemQuantity>=0){
                     setState(() {
                       ItemQuantity++;
                     });
                   }

                 },
                 style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         (Localizations.localeOf(context).languageCode=='en')?
                         const RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(
                               bottomRight:     Radius.circular(5),
                               topRight: Radius.circular(5),
                             ),
                             side: BorderSide(color: Colors.transparent)
                         ):
                         (Localizations.localeOf(context).languageCode=='ar')?
                         const RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(
                               bottomLeft:     Radius.circular(5),
                               topLeft: Radius.circular(5),
                             ),
                             side: BorderSide(color: Colors.transparent)
                         ):
                         const RoundedRectangleBorder(
                             borderRadius: BorderRadius.only(
                               bottomRight:     Radius.circular(5),
                               topRight: Radius.circular(5),
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
     );
  }
}
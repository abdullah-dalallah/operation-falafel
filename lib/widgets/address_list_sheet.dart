import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

import 'Saved_address/saved_address_list_sheet.dart';

class AddressListSheet extends StatelessWidget{
  ScrollController scrollController;

  AddressListSheet(this.scrollController,{super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: const BoxDecoration(
         color: Colors.black87,
         borderRadius: BorderRadius.only(
             topLeft: Radius.circular(8),
             topRight: Radius.circular(8)
         )
    ),
     padding: const EdgeInsets.all(8),
     height: MediaQuery.of(context).size.height / 3,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         /// - Title
         Padding(
           padding: const EdgeInsets.only(top:8.0, left: 8, right: 8),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                  getTranslated(context, "selectAddress")!,
                   style: TextStyle(
                     fontFamily:  getTranslated(context, "fontFamilyBody")!,
                     fontSize: 20,
                     fontWeight: FontWeight.w400,
                     color: Colors.amber
                   )),
               IconButton(
                   onPressed: () {
                     Navigator.of(context).pop();
                   },
                   icon: Icon(Icons.close, color: Colors.white,)),
             ],
           ),
         ),
         /// - Add address title
         SizedBox(
           width: double.maxFinite,
           child: DecoratedBox(

             decoration:const BoxDecoration(
               border: Border(
                 bottom: BorderSide(color: Colors.white),
               ),
             ),
             child: TextButton(
               style: TextButton.styleFrom(
                 foregroundColor: Colors.white,
               ),
               onPressed: () { },
               child: Row(
                 children: [
                   Text(getTranslated(context, "addAddress")!,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400, fontFamily:  getTranslated(context, "fontFamilyBody")!,),),
                 ],
               ),
             ),
           ),
         ),


          Padding(
           padding:  EdgeInsets.all(8.0),
           child: Text( getTranslated(context, "savedAddress")!, style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300,fontFamily:  getTranslated(context, "fontFamilyBody")!),),
         ),

          SavedAddressListSheet(scrollController: scrollController),


         //  Expanded(
         //   child: ListView(
         //    controller: scrollController,
         //     padding: const EdgeInsets.only(top: 0),
         //     children: [
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //            Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //
         //
         //
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //
         //       ListTile(
         //         title: Text("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             Text("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
         //             Divider(color: Colors.white,)
         //           ],
         //         ),
         //         leading: Padding(
         //           padding: const EdgeInsets.only(bottom: 8.0, left: 18),
         //           child: Image.asset("assets/images/icon_location_address.png",scale:3,),
         //         ),
         //
         //       ),
         //
         //     ],
         //   ),
         // )
       ],
     ),
   );

  }

}
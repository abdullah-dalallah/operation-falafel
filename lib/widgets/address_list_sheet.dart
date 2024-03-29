import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../screens/profile/profile_pages/add_new_address.dart';
import 'Saved_address/saved_address_list_sheet.dart';

class AddressListSheet extends StatefulWidget{
  ScrollController scrollController;

  AddressListSheet(this.scrollController,{super.key});

  @override
  State<AddressListSheet> createState() => _AddressListSheetState();
}

class _AddressListSheetState extends State<AddressListSheet> {
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
               MyText(
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
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox(
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
                 onPressed: () {

                   PersistentNavBarNavigator.pushNewScreen(
                     context,
                     screen: AddNewAddress(),
                     withNavBar: true,
                     // OPTIONAL VALUE. True by default.
                     pageTransitionAnimation: PageTransitionAnimation
                         .cupertino,
                   );

                 },
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Icon(Icons.add),
                     MyText(getTranslated(context, "addAddress")!,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400, fontFamily:  getTranslated(context, "fontFamilyBody")!,),),
                   ],
                 ),
               ),
             ),
           ),
         ),


          Padding(
           padding:  EdgeInsets.all(8.0),
           child: MyText( getTranslated(context, "savedAddress")!, style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300,fontFamily:  getTranslated(context, "fontFamilyBody")!),),
         ),

          SavedAddressListSheet(scrollController: widget.scrollController),


         //  Expanded(
         //   child: ListView(
         //    controller: scrollController,
         //     padding: const EdgeInsets.only(top: 0),
         //     children: [
         //       ListTile(
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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
         //         title: MyText("Flat | Acadmic City", style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300),),
         //         subtitle: Column(
         //           crossAxisAlignment: CrossAxisAlignment.start,
         //           children: [
         //             MyText("Abu hail - building", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.w300),),
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

  @override
  void initState() {
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    String token =authProvider.loggedInUser?.token??"";

    Provider.of<ProfileProvider>(context,listen: false).getUserSavedAddress(token);
  }
}
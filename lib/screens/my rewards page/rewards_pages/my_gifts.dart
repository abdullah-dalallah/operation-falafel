import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/buy_gift.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/my_gifts_list.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyGifts extends StatefulWidget{
  @override
  State<MyGifts> createState() => _MyGiftsState();
}

class _MyGiftsState extends State<MyGifts> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
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
         key: _drawerKey,
         backgroundColor: Colors.transparent,
         appBar:AppBar(
           leading: IconButton(
             onPressed: (){
               Navigator.pop(context);
             },
             icon: const ImageIcon(
               AssetImage("assets/images/back_new.png",),
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
           child: Column(
             children: [
               Expanded(
                 child: ListView(
                   children: [
                     /// - Title
                     Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.end,

                         children: [
                           Expanded(flex:1,child: Image.asset("assets/images/gift_pack.png", height: 170,width: 170,),),
                           SizedBox(width: 20,),
                           Expanded(
                               // flex: 2,
                               child:
                           Text(getTranslated(context, "myRewardsTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),)
                           ),

                         ],
                       ),
                     ),

                     /// - My gifts
                     Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: ElevatedButton(
                           onPressed: () {
                             PersistentNavBarNavigator.pushNewScreen(
                               context,
                               screen: MyGiftsList(),
                               withNavBar: true, // OPTIONAL VALUE. True by default.
                               pageTransitionAnimation: PageTransitionAnimation.cupertino,
                             );
                           },
                           style: ButtonStyle(
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                   const RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       side: BorderSide(color: Colors.transparent,width: 1)
                                   )
                               ),
                               overlayColor: MaterialStateProperty.all(Colors.white12),
                               elevation:MaterialStateProperty.all(0),
                               shadowColor: MaterialStateProperty.all(Colors.transparent),
                               backgroundColor: MaterialStateProperty.all(Colors.black),
                               foregroundColor: MaterialStateProperty.all(Colors.black),
                               padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                               textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                           child:  Text(getTranslated(context, "myGifts")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.amber, fontSize: 17, fontWeight: FontWeight.w300, ),textAlign: TextAlign.center,),
                         ),
                     ),

                     /// - Buy gifts
                     Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: ElevatedButton(
                         onPressed: () {
                           PersistentNavBarNavigator.pushNewScreen(
                             context,
                             screen: BuyGift(),
                             withNavBar: true, // OPTIONAL VALUE. True by default.
                             pageTransitionAnimation: PageTransitionAnimation.cupertino,
                           );
                         },
                         style: ButtonStyle(
                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                 const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                     side: BorderSide(color: Colors.transparent,width: 1)
                                 )
                             ),
                             overlayColor: MaterialStateProperty.all(Colors.white12),
                             elevation:MaterialStateProperty.all(0),
                             shadowColor: MaterialStateProperty.all(Colors.transparent),
                             backgroundColor: MaterialStateProperty.all(Colors.black),
                             foregroundColor: MaterialStateProperty.all(Colors.black),
                             padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                             textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                         child:  Text(getTranslated(context, "buyGifts")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.amber, fontSize: 17, fontWeight: FontWeight.w300, ),textAlign: TextAlign.center,),
                       ),
                     ),






                   ],
                 ),
               ),
               /// - my Code
               Stack(
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Image.asset("assets/images/my_rewards_gencode.png", height: 60,width: 60,),
                       Text(getTranslated(context, "dashBoardTitle-myCode")!, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300,fontFamily:getTranslated(context, "fontFamilyBody")!,),textAlign:TextAlign.center,)
                     ],
                   ),
                   new Positioned.fill(
                       child: new Material(
                         color: Colors.transparent,
                         child:  new InkWell(
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
               SizedBox(height: 30,)

             ],
           ),
         ),
       ),
     ],
   );
  }
}
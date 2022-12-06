import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/rewards_pages/gift_details.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyGiftsList extends StatefulWidget{
  @override
  State<MyGiftsList> createState() => _MyGiftsListState();
}

class _MyGiftsListState extends State<MyGiftsList> {

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
         body:Center(
           child: Container(
             constraints: BoxConstraints(maxWidth: 450, ),
             child: Column(

               children: [

                 Text(getTranslated(context, "myGifts")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                 Expanded(child:
                 Padding(
                   padding: const EdgeInsets.all(18.0),
                   child: ListView.builder(
                       itemCount: 1,
                       itemBuilder: (context, Index)=>
                   Column(
                     children: [
                       ListTile(
                       onTap: (){
                         PersistentNavBarNavigator.pushNewScreen(
                           context,
                           screen: GiftDetails(),
                           withNavBar: true, // OPTIONAL VALUE. True by default.
                           pageTransitionAnimation: PageTransitionAnimation.cupertino,
                         );
                       },
                       leading: Image.asset("assets/images/of_credit_icon.png", height: 60,width: 60,),
                       title: Text(getTranslated(context, "registrationGift")!,style: TextStyle(fontSize:17,fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,),),
                         subtitle: Text("2023-10-18",style: TextStyle(fontSize:15,fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white12,),)
                       ),
                       Row(
                         children: List.generate(800~/10, (index) => Expanded(
                           child: Container(
                             color: index%2==0?Colors.transparent
                                 :Colors.grey,
                             height: 1,
                           ),
                         )),
                       ),
                     ],
                   )
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
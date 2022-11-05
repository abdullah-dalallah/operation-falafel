import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/checkbox_option.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/widgets/pluse_minus_widget.dart';

class Cart_Screen extends StatefulWidget{
  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {

  bool _switchValue=true;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey(); // Cre

  bool checkboxBool = false;
  ValueChanged _valueChangedHandler() {
    return (value) => setState(() {
      print(value);

      checkboxBool = true;


    });
  }


  // ate a key
  @override
  Widget build(BuildContext context) {
   return


     Stack(
      alignment: Alignment.topCenter,
     children: [
       Image.asset(
         "assets/images/background.png",
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         fit: BoxFit.cover,
       ),
       Scaffold(
         resizeToAvoidBottomInset: true,
         key: _drawerKey,
         backgroundColor: Colors.transparent,
         appBar: AppBar(
           leading:IconButton(onPressed: (){
             _drawerKey.currentState?.openDrawer();
           },icon: FaIcon(FontAwesomeIcons.bars,size: 30,),) ,
           backgroundColor: Colors.transparent,
           elevation: 0,
           centerTitle: true,
           title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
           // Image.asset("assets/images/of_logo_top.png", width: 220,),
           // Text("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)
           actions: [
             CupertinoSwitch(
               value: _switchValue,
               onChanged: (value) {
                 setState(() {
                   _switchValue = value;
                 });
               },
             ),
           ],
         ),

         body: SizedBox(
           // height: MediaQuery.of(context).size.height,
           // width: MediaQuery.of(context).size.width,
           child:  ListView(

             children: [

               /// - Special Intructions

               Visibility(
                 visible: _switchValue,
                 child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     const  SizedBox(height: 20,),
                     Text(getTranslated(context, "my o:f cart")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber.shade300, fontSize: 30),),

                     const  SizedBox(height: 50,),
                     /// - Items List
                     ListView.builder(
                         physics:const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemCount:1,
                         itemBuilder: (context, index) {
                           return Column(
                             children: [
                               ListTile(
                                 title: Text("Chicken Shawerma SaJ", style: TextStyle(color: Colors.amber, fontSize: 25, fontWeight: FontWeight.w300),),
                                 subtitle:  Column(children: [ListView.builder(
                                     physics:const NeverScrollableScrollPhysics(),
                                     shrinkWrap: true,
                                     itemCount:3,
                                     itemBuilder: (context, index) {return  Text("Mini Mountabal + 1pc bread", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),);}
                                 ),],),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left:15.0, right: 15, top: 10),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     PluseMinusWidget(),
                                     Text("AED 16", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),)
                                   ],
                                 ),
                               ),
                               (index <1)?    const Padding(
                                 padding: const EdgeInsets.all(18.0),
                                 child: Divider(
                                   color: Colors.grey,
                                 ),
                               ):SizedBox(height: 15,)
                             ],
                           );
                         }
                     ),

                     const Divider(color: Colors.grey,),
                     const SizedBox(height: 10,),

                     /// - Special Intructions
                      Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.amber, fontSize: 25),),
                     const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left:18.0, right: 18),
                        child: SizedBox(
                         // width: 400,
                         // height: 40,
                         child:   TextField(
                           autofocus: false,
                           style: TextStyle(color: Colors.white70),
                           keyboardType: TextInputType.multiline,
                           minLines: 1,//Normal textInputField will be displayed
                           maxLines: 10,
                           // scrollPadding: EdgeInsets.only(bottom:40),
                           decoration:  InputDecoration(
                             filled: true,
                             fillColor: Colors.amber.withOpacity(0.1),
                             contentPadding: EdgeInsets.only(left:10),
                             focusedBorder: OutlineInputBorder(
                               borderRadius:  BorderRadius.all(
                                  Radius.circular(0.0),
                               ),
                               borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius:  BorderRadius.all(
                                 Radius.circular(0.0),
                               ),
                               borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                             ),
                             hintText: '',
                             label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                           ),

                         ),
                     ),
                      ),
                     const SizedBox(height: 10,),

                     const Divider(color: Colors.grey,),


                     /// - checkbox
                     Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: Column(
                         children: [
                           CheckboxOption(
                             value: checkboxBool,
                             onChanged:_valueChangedHandler(),
                             label: '1',
                             text: 'I DONT NEED CUTLERY',
                             addOnFlag: false,
                             colorOfBox: Colors.white,
                             colorOfText: Colors.white,
                           ),
                           CheckboxOption(
                             value: checkboxBool,
                             onChanged:_valueChangedHandler(),
                             label: '1',
                             text: 'CONTACTLESS DELIVERY',
                             addOnFlag: false,
                             colorOfBox: Colors.white,
                             colorOfText: Colors.white,
                           ),
                         ],
                       ),
                     ),
                     /// - Promtion
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
                                 autofocus: false,
                                 style: TextStyle(color: Colors.white70),

                                 // scrollPadding: EdgeInsets.only(bottom:40),
                                 decoration:  InputDecoration(
                                   filled: true,
                                   fillColor: Colors.amber.withOpacity(0.1),
                                   contentPadding: EdgeInsets.only(left:10, ),
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(0.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(0.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.white70, width: 0.0),
                                   ),
                                   hintText: '',
                                   label: Text(getTranslated(context, "enter promo code")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

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
                                 child: ElevatedButton(
                                   onPressed: () {

                                   },
                                   style: ButtonStyle(
                                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                           const RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(Radius.circular(0)),
                                               side: BorderSide(color: Colors.white30,width: 1)
                                           )
                                       ),
                                       overlayColor: MaterialStateProperty.all(Colors.black12),
                                       elevation:MaterialStateProperty.all(0),
                                       shadowColor: MaterialStateProperty.all(Colors.transparent),
                                       backgroundColor: MaterialStateProperty.all(Colors.amber.shade700.withOpacity(0.3)),
                                       foregroundColor: MaterialStateProperty.all(Colors.black),
                                       padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                       textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                   child: const Text('ADD ', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),

                     const SizedBox(height: 15,),
                     Text(getTranslated(context, "tip the driver")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.amber, fontSize: 20),),
                     const SizedBox(height: 15,),
                     /// - tip the driver
                     Padding(
                       padding: const EdgeInsets.only(left:18.0, right: 18),
                       child: SizedBox(
                         // width: 400,
                         // height: 40,
                         child:   TextField(
                           autofocus: false,
                           style: TextStyle(color: Colors.white70),

                           // scrollPadding: EdgeInsets.only(bottom:50),
                           decoration:  InputDecoration(
                             filled: true,
                             fillColor: Colors.amber.withOpacity(0.1),
                             contentPadding:const EdgeInsets.only(left:10),
                             focusedBorder:const OutlineInputBorder(
                               borderRadius:  BorderRadius.all(
                                 Radius.circular(0.0),
                               ),
                               borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                             ),
                             enabledBorder:const OutlineInputBorder(
                               borderRadius:  BorderRadius.all(
                                 Radius.circular(0.0),
                               ),
                               borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                             ),
                             hintText: '',
                             label: Text(getTranslated(context, "tip")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white38),),

                           ),

                         ),
                       ),
                     ),
                     /// - sub total
                     const SizedBox(height: 15,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                Text(getTranslated(context, "subTotal")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
                                Text("AED 14", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
                             ],),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                  Text(getTranslated(context, "totalAfterPromoCode")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.amber, fontSize: 17,fontWeight: FontWeight.w300),),
                                  Text("AED 14", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
                               ],),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(getTranslated(context, "delivery fee")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
                                  Text("AED 14", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
                               ],),
                           ),
                         ],
                       ),
                     ),
                     /// - Total
                     Container(

                       decoration: const BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.only(
                           topRight: Radius.circular(10),
                           bottomLeft: Radius.circular(10),
                           topLeft: Radius.circular(10),
                           bottomRight: Radius.circular(10),
                         ),
                         // border: Border.all(
                         //   width: 0.5,
                         //   color: Colors.white,
                         //   style: BorderStyle.solid,
                         // ),
                       ),
                       padding: EdgeInsets.only(left:25, right: 24,top: 10,bottom: 10),
                       child: RichText(
                         text:  TextSpan(
                           text: getTranslated(context, "total")!,
                           style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber, fontWeight: FontWeight.w300,fontSize: 20),
                           children: [
                             TextSpan(
                               text: ' AED 25',
                               style: TextStyle(
                                 fontWeight: FontWeight.w300, color: Colors.white
                               ),
                             ),

                           ],
                         ),
                       )
                     ),
                     /// - credit calculation
                     Padding(
                       padding: const EdgeInsets.only(left:8.0, right:10, top: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:  [
                            Text(getTranslated(context, "earned credits")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color:Colors.amber, fontSize: 10),),
                            Text(getTranslated(context, "total of credits")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color:Colors.amber, fontSize: 10),),
                         ],
                       ),
                     ),
                     /// - Address
                     const SizedBox(height: 15,),
                     Align( alignment: Alignment.centerLeft, child: Padding(
                       padding: const EdgeInsets.only(left:18.0 , right: 18),
                       child:  Text(getTranslated(context, "address")!, style: TextStyle(color:Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!), fontFamily: getTranslated(context, "fontFamilyButtons")!),),
                     )),
                     Padding(
                       padding: const EdgeInsets.only(left:18.0, right: 18),
                       child: Container(

                           decoration:const BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.only(
                               topRight: Radius.circular(10),
                               bottomLeft: Radius.circular(10),
                               topLeft: Radius.circular(10),
                               bottomRight: Radius.circular(10),
                             ),
                             // border: Border.all(
                             //   width: 0.5,
                             //   color: Colors.white,
                             //   style: BorderStyle.solid,
                             // ),
                           ),
                           // padding: EdgeInsets.all(18),
                           child: ListTile(
                             title: Text(getTranslated(context, "pleaseSelectAddress")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color:Colors.white,fontWeight: FontWeight.w300), ),
                             leading: Image.asset("assets/images/icon_location_address.png",scale:3,),
                           )
                       ),
                     ),
                     /// - Address
                     const SizedBox(height: 15,),
                     Align( alignment: Alignment.centerLeft, child: Padding(
                       padding:  EdgeInsets.only(left:18.0 , right: 18),
                       child:  Text(getTranslated(context, "payment")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color:Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!) ),),
                     )),
                     Padding(
                       padding: const EdgeInsets.only(left:18.0, right: 18),
                       child: Container(

                           decoration: const BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.only(
                               topRight: Radius.circular(10),
                               bottomLeft: Radius.circular(10),
                               topLeft: Radius.circular(10),
                               bottomRight: Radius.circular(10),
                             ),
                             // border: Border.all(
                             //   width: 0.5,
                             //   color: Colors.white,
                             //   style: BorderStyle.solid,
                             // ),
                           ),
                           // padding: EdgeInsets.all(18),
                           child: ListTile(
                             leading: Icon(Icons.credit_card, color: Colors.amber,),
                             title:  Text(getTranslated(context, "pleaseSelectPayment")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color:Colors.white,fontWeight: FontWeight.w300), ),
                             // leading: Image.asset("assets/images/icon_location_address.png",scale:3,),
                           )
                       ),
                     ),
                     /// - checkbox
                     const SizedBox(height: 15,),
                     Text(getTranslated(context, "optional")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.amber, fontSize: 20),),
                     Padding(
                       padding: const EdgeInsets.all(18.0),
                       child: Column(
                         children: [
                            CheckboxOption(
                                 value: checkboxBool,
                                 onChanged:_valueChangedHandler(),
                                 label: '1',
                                 text: 'SCHEDULE PICKUP',
                                 addOnFlag: false,
                                 colorOfBox: Colors.white,
                                 colorOfText: Colors.white,
                               ),


                             CheckboxOption(
                                 value: checkboxBool,
                                 onChanged:_valueChangedHandler(),
                                 label: '1',
                                 text: 'SCHEDULE DELIVERY',
                                 addOnFlag: false,
                                 colorOfBox: Colors.white,
                                 colorOfText: Colors.white,
                               ),


                         ],
                       ),
                     ),
                     /// - bring it on
                     SizedBox(
                       width: MediaQuery. of(context). size. width,
                       height: 50,
                       child: ElevatedButton(
                           onPressed: (){},
                           style: ButtonStyle(
                             backgroundColor:  MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                             foregroundColor:
                             MaterialStateProperty.all<Color>(Colors.black),
                             shape: MaterialStateProperty.all(
                                 RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(0.0),
                                     side:const BorderSide(color: Colors.transparent,width: 1.5)
                                 )
                             ),


                           ),
                           child: Text(getTranslated(context, "bringItOn")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.white, fontSize: 40),)


                       ),
                     ),





                   ],
                 ),

               ),

               Visibility(
                 visible: !_switchValue,
                 child: Column(
                   children: [



                     const  Text("YOUR CART IS EMPITY",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),),
                     const SizedBox(height: 10,),
                     SizedBox(
                         width: 330,
                         height: 38,
                         child: ElevatedButton(
                             onPressed: null,
                             style: ButtonStyle(
                               backgroundColor:  MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                               foregroundColor:
                               MaterialStateProperty.all<Color>(Colors.black),
                               shape: MaterialStateProperty.all(
                                   RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(10.0),
                                       side:const BorderSide(color: Colors.transparent,width: 1.5)
                                   )
                               ),


                             ),
                             child:const Text("Order Now",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 25),)

                         )
                     ),
                   ],
                 ),
               ),

             ],
           ),




         ),

         drawer: DrawerWidget(),
       ),
     ],
   );
  }
}
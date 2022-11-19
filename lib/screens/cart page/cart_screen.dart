import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/widgets/address_list_sheet.dart';
import 'package:operation_falafel/widgets/checkbox_option.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/widgets/pluse_minus_widget.dart';
import 'package:provider/provider.dart';

class Cart_Screen extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const Cart_Screen(this.onChanged,{super.key,required this.layOut});
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
    Consumer<DemoCartProvider>(
    builder: (context, value, child) {
    bool cartEmpty = value.cartItems.isEmpty;


     return  Scaffold(
         resizeToAvoidBottomInset: true,
         key: _drawerKey,
         backgroundColor: Colors.transparent,
         appBar: AppBar(
           leading:Visibility(
             visible: (widget.layOut=="Mobile")?true:false,
             child: IconButton(
               onPressed: (){
                 _drawerKey.currentState?.openDrawer();
               },
               icon: const ImageIcon(
                 AssetImage("assets/images/icon_menu.png",),
                 size: 35,
               ),
             ),
           ) ,
           backgroundColor: Colors.transparent,
           elevation: 0,
           centerTitle: true,
           title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
           // Image.asset("assets/images/of_logo_top.png", width: 220,),
           // Text("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)
           actions: [
             Visibility(
               visible:(widget.layOut=="Desktop")?true:false,
               child: Padding(
                 padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8,bottom: 8),
                 child: Badge(
                   padding:
                   (Localizations.localeOf(context).languageCode=='ar')? EdgeInsets.only(bottom: 9, left: 7, right: 7, top:7):EdgeInsets.only(bottom: 9, left: 7, right: 7, top:5),
                   badgeContent: Text('${value.cartItems.length}', style: TextStyle(color: (value.cartItems.isNotEmpty)?Colors.white:Colors.transparent,
                       fontFamily: getTranslated(context, "fontFamilyBody")),),
                   elevation: (value.cartItems.isNotEmpty)?3:0,
                   badgeColor: (value.cartItems.isNotEmpty)?Colors.red:Colors.transparent,
                   child: ImageIcon(
                     size: 40,
                     AssetImage("assets/images/icon_cart.png"),
                   ),
                 ),
               ),
             ),

           ],
         ),

         body:Center(child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
                   child:  SingleChildScrollView(
                     child: Column(

                       children: [
                         const  SizedBox(height: 20,),
                         Text(getTranslated(context, "my o:f cart")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),

                         const  SizedBox(height: 50,),

                         /// - cart with items
                         Visibility(
                           visible:!cartEmpty,
                           child:  Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [

                               /// - Items List
                               ListView.builder(
                                   physics:const NeverScrollableScrollPhysics(),
                                   shrinkWrap: true,
                                   itemCount:value.cartItems.length,
                                   itemBuilder: (context, index) {
                                     return Column(
                                       children: [
                                         ListTile(
                                           title: Text("${value.cartItems[index].itemName}", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.amber, fontSize: 25, fontWeight: FontWeight.w300),),
                                           subtitle:  Column(children: [
                                             /// - Customiztion
                                             ListView.builder(
                                                 physics:const NeverScrollableScrollPhysics(),
                                                 shrinkWrap: true,
                                                 itemCount:value.cartItems[index].selectedOtions.length,
                                                 itemBuilder: (context, index2) {
                                                   return Padding(
                                                     padding: const EdgeInsets.all(2.0),
                                                     child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                       children: [

                                                         Text("${value.cartItems[index].selectedOtions[index2].keys.elementAt(0)}", style: TextStyle(
                                                             fontSize: 15,
                                                             fontFamily: getTranslated(
                                                                 context,
                                                                 "fontFamilyBody")!,
                                                             color: Colors.white,
                                                             fontWeight: FontWeight.w300),),
                                                         // Text("AED ${value.cartItems[index].selectedOtions[index2][value.cartItems[index].selectedOtions[index2].keys.elementAt(0)]["Price"]}",
                                                         //   style: TextStyle(
                                                         //       fontSize: 15,
                                                         //       fontFamily: getTranslated(
                                                         //           context,
                                                         //           "fontFamilyBody")!,
                                                         //       color: Colors.white,
                                                         //       fontWeight: FontWeight.w300),),
                                                       ],
                                                     ),
                                                   );

                                                 }
                                             ),
                                             /// - AddON
                                             ListView.builder(
                                                 physics:const NeverScrollableScrollPhysics(),
                                                 shrinkWrap: true,
                                                 itemCount:value.cartItems[index].selectedAddon.length,
                                                 itemBuilder: (context, index2) {
                                                   return Padding(
                                                     padding: const EdgeInsets.all(2.0),
                                                     child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       children: [
                                                         Text("${value.cartItems[index].selectedAddon[index2][value.cartItems[index].selectedAddon[index2].keys.elementAt(0)]["quantity"]}X ", style: TextStyle(
                                                             fontSize: 15,
                                                             fontFamily: getTranslated(
                                                                 context,
                                                                 "fontFamilyBody")!,
                                                             color: Colors.white,
                                                             fontWeight: FontWeight.w300),),
                                                         Text("${value.cartItems[index].selectedAddon[index2].keys.elementAt(0)}",
                                                           style: TextStyle(
                                                               fontSize: 15,
                                                               fontFamily: getTranslated(
                                                                   context,
                                                                   "fontFamilyBody")!,
                                                               color: Colors.white,
                                                               fontWeight: FontWeight.w300),),
                                                         Expanded(child: SizedBox(width: 2,)),
                                                         Text("AED ${value.cartItems[index].selectedAddon[index2][value.cartItems[index].selectedAddon[index2].keys.elementAt(0)]["Price"]}",
                                                           style: TextStyle(
                                                               fontSize: 15,
                                                               fontFamily: getTranslated(
                                                                   context,
                                                                   "fontFamilyBody")!,
                                                               color: Colors.white,
                                                               fontWeight: FontWeight.w300),),
                                                       ],
                                                     ),
                                                   );

                                                 }
                                             ),



                                           ],),
                                         ),


                                         Padding(
                                           padding: const EdgeInsets.only(left:15.0, right: 15, top: 10),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               PluseMinusWidgetCart(ItemQuantity:value.cartItems[index].itemQuantity, itemIndex: index, ),
                                               Text("AED ${value.cartItems[index].itemTotalPrice}", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),)
                                             ],
                                           ),
                                         ),

                                         (index <0)? const Padding(
                                           padding: EdgeInsets.all(18.0),
                                           child: Divider(
                                             color: Colors.grey,
                                           ),
                                         ):const SizedBox(height: 15,)
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
                                     maxLines: 4,
                                     // scrollPadding: EdgeInsets.only(bottom:40),
                                     decoration:  InputDecoration(
                                       filled: true,
                                       fillColor: Colors.black45,
                                       //amber.withOpacity(0.1),
                                       contentPadding:const EdgeInsets.only(left:10, top: 10, bottom: 10, right: 10),
                                       focusedBorder: const OutlineInputBorder(
                                         borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                         ),
                                         borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                       ),
                                       enabledBorder:const  OutlineInputBorder(
                                         borderRadius:  BorderRadius.all(
                                           Radius.circular(10.0),
                                         ),
                                         borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                       ),
                                       hintText: getTranslated(context, "sepecial instructions")!,
                                       hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

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
                                             fillColor: Colors.black45,
                                             contentPadding:const EdgeInsets.only(left:10,right: 10 ),
                                             focusedBorder: OutlineInputBorder(
                                               borderRadius:

                                               (Localizations.localeOf(context).languageCode=='en')?
                                               const BorderRadius.only(
                                                bottomLeft:  Radius.circular(10.0),
                                                 topLeft: Radius.circular(10.0),
                                               ):
                                               (Localizations.localeOf(context).languageCode=='ar')?
                                               const BorderRadius.only(
                                                 bottomRight:     Radius.circular(10),
                                                 topRight: Radius.circular(10),
                                               ):
                                               const BorderRadius.only(
                                                 bottomLeft:  Radius.circular(10.0),
                                                 topLeft: Radius.circular(10.0),
                                               ),




                                               borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                             ),
                                             enabledBorder: OutlineInputBorder(
                                               borderRadius:

                                               (Localizations.localeOf(context).languageCode=='en')?
                                               const BorderRadius.only(
                                                 bottomLeft:  Radius.circular(10.0),
                                                 topLeft: Radius.circular(10.0),
                                               ):
                                               (Localizations.localeOf(context).languageCode=='ar')?
                                               const BorderRadius.only(
                                                 bottomRight:     Radius.circular(10),
                                                 topRight: Radius.circular(10),
                                               ):
                                               const BorderRadius.only(
                                                 bottomLeft:  Radius.circular(10.0),
                                                 topLeft: Radius.circular(10.0),
                                               ),
                                               borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                             ),
                                             hintText: getTranslated(context, "enter promo code")!,
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
                                           child: ElevatedButton(
                                             onPressed: () {

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
                                                     const  RoundedRectangleBorder(
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
                                                 overlayColor: MaterialStateProperty.all(Colors.black12),
                                                 elevation:MaterialStateProperty.all(0),
                                                 shadowColor: MaterialStateProperty.all(Colors.transparent),
                                                 backgroundColor: MaterialStateProperty.all(Colors.amber),
                                                 foregroundColor: MaterialStateProperty.all(Colors.black),
                                                 padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                                 textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                             child:  Text(getTranslated(context, "add")!, style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: getTranslated(context, "fontFamilyBody")),),
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
                                       fillColor: Colors.black45,
                                       //amber.withOpacity(0.1),
                                       contentPadding:const EdgeInsets.only(left:10, right: 10),
                                       focusedBorder:const OutlineInputBorder(
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
                                       hintText: getTranslated(context, "tip")!,
                                       hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

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
                                           Text("AED ${value.Details.Total}", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
                                         ],),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text(getTranslated(context, "totalAfterPromoCode")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.amber, fontSize: 17,fontWeight: FontWeight.w300),),
                                           Text("AED ${value.Details.Total}", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
                                         ],),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text(getTranslated(context, "delivery fee")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
                                           Text("AED 0.00", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white, fontSize: 17,fontWeight: FontWeight.w300),),
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
                                           text: ' AED ${value.Details.Total}',
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
                                 padding: const EdgeInsets.only(left:18.0, right:18, top: 10),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children:  [
                                      Text(getTranslated(context, "earned credits")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color:Colors.amber, fontSize: 10),),
                                      Text(getTranslated(context, "total of credits")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color:Colors.amber, fontSize: 10),),
                                   ],
                                 ),
                               ),
                               /// - Address
                               const SizedBox(height: 20,),
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
                                       onTap: (){
                                         showMaterialModalBottomSheet(
                                             expand: false,
                                             context: context,

                                             backgroundColor: Colors.transparent,
                                             builder: (context) => DraggableScrollableSheet(
                                                 initialChildSize: 0.5,
                                                 minChildSize: 0.5,
                                                 maxChildSize: 1,
                                                 expand: true,
                                                 builder: (context, scrollController) {
                                                   return AddressListSheet(scrollController);
                                                 }

                                             )




                                         );
                                       },
                                       title: Text(getTranslated(context, "pleaseSelectAddress")!,style: TextStyle(color:Colors.white60,fontWeight: FontWeight.w300,fontFamily: getTranslated(context, "fontFamilyBody")), ),
                                       leading: Image.asset("assets/images/icon_location_address.png",scale:3,),
                                     )
                                 ),
                               ),
                               /// - Payment
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
                                       title:  Text(getTranslated(context, "pleaseSelectPayment")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody"),color:Colors.white60,fontWeight: FontWeight.w300), ),
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

                               const SizedBox(height: 50,),




                             ],
                           ),

                         ),


                         /// - Empty cart
                         Visibility(
                           visible: cartEmpty,
                           child: Column(
                             children: [



                                 Text(getTranslated(context, "yourCartIsEmpity")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons")!,color: Colors.white, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                               const SizedBox(height: 10,),
                               SizedBox(
                                   width: 330,
                                   height: 38,
                                   child: ElevatedButton(
                                       onPressed: (){widget.onChanged(1);},
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
                                       child: Text(getTranslated(context, "ORDER NOW")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons")!,color: Colors.white, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),)

                                   )
                               ),
                             ],
                           ),
                         ),

                       ],
                     ),
                   ),




                 ),),


         /// - bring it on
         bottomSheet: Visibility(
           visible: !cartEmpty,
           child: SizedBox(
             width: MediaQuery. of(context). size. width,
             height: 50,
             child: ElevatedButton(
                 onPressed: (){},
                 style: ButtonStyle(
                   backgroundColor:  MaterialStateProperty.all<Color>(Colors.amber),
                   //MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                   shape: MaterialStateProperty.all(
                       RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(0.0),
                           side:const BorderSide(color: Colors.transparent,width: 1.5)
                       )
                   ),


                 ),
                 child: Text(getTranslated(context, "bringItOn")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.white, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),)


             ),
           ),
         ),
         drawer: DrawerWidget(layOut: widget.layOut,onChanged: (value) {widget.onChanged(value);},),
       );
    }),
     ],
   );
  }
}
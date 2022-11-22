import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class AddNewAddress extends StatefulWidget{
  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {


  final List<String> addressType = [
    "flat",
    "house",
    "villa",
    "office",
  ];
  dynamic? selectedValue;
  bool primary = false;
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
                children: [
                  Text(getTranslated(context, "address")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                  Expanded(
                   child: ListView(
                     children: [
                       const  SizedBox(height: 15,),
                       Image.asset("assets/images/of_logo.png", height: 200,),
                       const  SizedBox(height: 15,),
                       /// - Address Line
                       Padding(
                         padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                         child: TextField(

                           autofocus: false,
                           style: const TextStyle(color: Colors.white),
                           decoration:  InputDecoration(
                             filled: true,
                             fillColor: Colors.black45,
                             contentPadding:const EdgeInsets.only(left:10, right: 10),
                             focusedBorder: const OutlineInputBorder(
                               borderRadius:  BorderRadius.all(
                                 Radius.circular(10.0),
                               ),
                               borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                             ),
                             enabledBorder: const OutlineInputBorder(
                               borderRadius:  BorderRadius.all(
                                 Radius.circular(10.0),
                               ),
                               borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                             ),
                             hintText: getTranslated(context, "addressLine")!,
                             hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                           ),

                         ),
                       ),
                       /// - Building name & villa No
                       Padding(
                         padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                         child: Row(
                           children: [
                             Expanded(
                               flex:4,
                               child: TextField(

                                 autofocus: false,
                                 style: const TextStyle(color: Colors.white),
                                 decoration:  InputDecoration(
                                   filled: true,
                                   fillColor: Colors.black45,
                                   contentPadding:const EdgeInsets.only(left:10, right: 10),
                                   focusedBorder: const OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(10.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                   ),
                                   enabledBorder: const OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(10.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                   ),
                                   hintText: getTranslated(context, "buildingName")!,
                                   hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                 ),

                               ),
                             ),
                             const SizedBox(width: 10,),
                             Expanded(
                               flex:3,
                               child: TextField(
                                 autofocus: false,
                                 style: const TextStyle(color: Colors.white),
                                 decoration:  InputDecoration(
                                   filled: true,
                                   fillColor: Colors.black45,
                                   contentPadding:const EdgeInsets.only(left:10, right: 10),
                                   focusedBorder: const OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(10.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                   ),
                                   enabledBorder: const OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(10.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                   ),
                                   hintText: getTranslated(context, "villa")!,
                                   hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                 ),

                               ),
                             ),
                           ],
                         ),
                       ),
                       /// - Area & Address Type
                       Padding(
                         padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                         child: Row(
                           children: [
                             Expanded(
                               flex:4,
                               child: TextField(

                                 autofocus: false,
                                 style: const TextStyle(color: Colors.white),
                                 decoration:  InputDecoration(
                                   filled: true,
                                   fillColor: Colors.black45,
                                   contentPadding:const EdgeInsets.only(left:10, right: 10),
                                   focusedBorder: const OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(10.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                   ),
                                   enabledBorder: const OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(10.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                   ),
                                   hintText: getTranslated(context, "area")!,
                                   hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                 ),

                               ),
                             ),
                             const SizedBox(width: 10,),
                             Expanded(
                               flex:3,
                               child:  DropdownButtonFormField2(

                                 scrollbarAlwaysShow: true,
                                 style: const TextStyle(color: Colors.white),
                                 decoration: const InputDecoration(
                                   //Add isDense true and zero Padding.
                                   //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                   isDense: true,
                                   fillColor: Colors.transparent,
                                   filled: true,

                                   contentPadding: EdgeInsets.only(),
                                   // border: OutlineInputBorder(
                                   //   borderSide: const BorderSide(color: Colors.green, width: 40.0, style: BorderStyle.solid ),
                                   //   borderRadius: BorderRadius.circular(10),
                                   //
                                   // ),
                                   focusColor: Colors.amber,

                                   focusedBorder: OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(10.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.amber, width: 2.0, ),
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderRadius:  BorderRadius.all(
                                       Radius.circular(10.0),
                                     ),
                                     borderSide: BorderSide(color: Colors.white60, width: 2.0),
                                   ),

                                   //Add more decoration as you want here
                                   //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                 ),
                                 isExpanded: true,
                                 hint:  Text(getTranslated(context, "addressType")!, style: TextStyle(fontSize: 15, color: Colors.white60 ,fontFamily: getTranslated(context, "fontFamilyBody")!),),

                                 icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                 // const Icon(
                                 //   Icons.arrow_drop_down,
                                 //   color: Colors.white60,
                                 // ),
                                 iconSize: 30,
                                 buttonHeight: (selectedValue!=null)?50:50,
                                 buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                                 dropdownDecoration: BoxDecoration(
                                   color: Colors.black,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 itemHeight: 30,

                                 items: addressType
                                     .map((order) =>
                                     DropdownMenuItem<dynamic>(
                                       value: order,
                                       child:
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [

                                           Row(
                                             children: [

                                               (selectedValue!=null)?
                                               (selectedValue==order)?
                                               Image.asset("assets/images/page2_icon.png", height: 15,width: 15,)
                                                   :SizedBox(width: 15,):SizedBox(width: 15,),
                                               SizedBox(width: 5,),
                                               Text(getTranslated(context, order)!,
                                                 style:  TextStyle(fontSize: 13,color: Colors.white, fontFamily: getTranslated(context, "fontFamilyBody")!),
                                               ),
                                             ],
                                           ),




                                         ],
                                       ),





                                     ))
                                     .toList(),
                                 validator: (value) {
                                   if (value == null) {
                                     return 'Please select gender.';
                                   }
                                 },
                                 onChanged: (value) {
                                   //Do something when changing the item if you want.
                                   setState((){
                                     selectedValue = value;
                                   });


                                   print(selectedValue.keys.elementAt(0));
                                 },
                                 onSaved: (value) {
                                   setState((){
                                     selectedValue = value;
                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                       ),
                       /// - Save address
                       Padding(
                         padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                         child: Row(children: [
                           (primary==false)? GestureDetector(
                               onTap: (){
                                 setState(() {
                                   primary = true;
                                 });
                               },
                               child: Image.asset("assets/images/star_empty.png", height: 40,width: 40,))
                           :GestureDetector(
                               onTap: (){
                                 setState(() {
                                   primary = false;
                                 });
                               },
                               child: Image.asset("assets/images/star_full.png", height: 40,width: 40,)),

                           const SizedBox(width: 10,),
                           Text(getTranslated(context, "makePrimaryAddress")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: 14),),
                           const Expanded(child: SizedBox(width: 10,)),
                           SizedBox(
                               width: 150,

                               child: ElevatedButton(
                                   onPressed: (){},
                                   style: ButtonStyle(
                                     backgroundColor:  MaterialStateProperty.all<Color>(Colors.amber),
                                     foregroundColor:
                                     MaterialStateProperty.all<Color>(Colors.black),
                                     shape: MaterialStateProperty.all(
                                         RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(0.0),
                                             side:const BorderSide(color: Colors.transparent,width: 1.5)
                                         )
                                     ),
                                   ),
                                   child: Text(getTranslated(context, "saveAddress")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 14),)

                               )
                           ),
                         ],),
                       ),
                      ],
                   ),
                 ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
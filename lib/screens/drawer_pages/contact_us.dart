import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class ContactUs extends StatefulWidget{
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {


  final List<String> recentOrders = [
    "generalEnquiry",
    "comments",
    "careers",
   "procurement",
  ];
  dynamic? selectedValue;



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
          body:Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// - Title
                  Text(getTranslated(context, "contactUsTitle")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(getTranslated(context, "pleaseFillTheFormBelow")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize: 20),textAlign: TextAlign.center,),
                      const  SizedBox(width: 10,),
                      (Localizations.localeOf(context).languageCode=='en')?
                      Image.asset("assets/images/page7_right_icon.png", height: 50,):
                      Image.asset("assets/images/page7_left_icon.png", height: 50,)
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Expanded(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ListView(
                          children: [
                            /// - Name
                            SizedBox(
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

                                    hintText: getTranslated(context, "name")!,
                                    hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                  ),

                                ),
                              ),
                            const SizedBox(height: 10,),

                            /// - Email
                            SizedBox(
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
                                 hintText: getTranslated(context, "emailAddress")!,
                                  hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                ),

                              ),
                            ),
                            const SizedBox(height: 10,),

                            /// - Phone Number
                            SizedBox(
                              // width: 400,
                              // height: 40,
                              child:   TextField(
                                autofocus: false,
                                style: const TextStyle(color: Colors.white70),
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
                                  hintText: getTranslated(context, "mobileNo")!,
                                  hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                ),

                              ),
                            ),
                            const SizedBox(height: 10,),

                            /// - Type of inquiry
                            DropdownButtonFormField2(

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
                              hint:  Text(
                                'Select Order',
                                style: TextStyle(fontSize: 16, color: Colors.white60 ,fontFamily: getTranslated(context, "fontFamilyBody")!),
                              ),

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

                              items: recentOrders
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
                            const SizedBox(height: 10,),
                            /// - Message
                            TextFormField(

                              autofocus: false,
                              style:  TextStyle(fontSize: 14.0,color: Colors.white,fontFamily:getTranslated(context, "fontFamilyBody")!,),
                              maxLength: 1000,
                              decoration:  InputDecoration(
                                filled: true,
                                fillColor: Colors.black45,
                                //amber.withOpacity(0.1),
                                contentPadding:const EdgeInsets.only(left:10, top: 10, bottom: 10, right: 10),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                ),
                                enabledBorder:const  OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                ),
                                hintText: getTranslated(context, "message")!,
                                hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                              ),
                              minLines: 4,
                              maxLines:50,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.next,

                            ),
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
                                    child: Text(getTranslated(context, "submit")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 20),)

                                )
                            ),






                          ],

                        ),
                      )),


                ],
              ),
            ),
          ),

        )
      ],
    );
  }
}
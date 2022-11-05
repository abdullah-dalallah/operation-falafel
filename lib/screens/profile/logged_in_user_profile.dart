import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/drawer.dart';

class LoggedInUserProfile extends StatefulWidget{
  @override
  State<LoggedInUserProfile> createState() => _LoggedInUserProfileState();
}

class _LoggedInUserProfileState extends State<LoggedInUserProfile> {


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
        SafeArea(
          child: Image.asset(
            "assets/images/profile_back.png",
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          key: _drawerKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading:IconButton(onPressed: (){
              print("open drwaer");
              _drawerKey.currentState?.openDrawer();
            },icon: FaIcon(FontAwesomeIcons.bars,size: 30,),) ,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            // Image.asset("assets/images/of_logo_top.png", width: 220,),
            // Text("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)
            actions: [
              // CupertinoSwitch(
              //   value: _switchValue,
              //   onChanged: (value) {
              //     setState(() {
              //       _switchValue = value;
              //     });
              //   },
              // ),
            ],
          ),
          body:  Column(
              children: [
                /// - Image & Name & Edit
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius:const BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                            border: Border.all(
                              width: 2,
                              color: Colors.amber,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),

                              ),
                              child: Image.asset("assets/images/tempuser.gif",height: 100,width: 100,fit: BoxFit.cover,)),
                        ),
                        Positioned(
                          child: SizedBox(
                            width:40,
                            height:40,

                            child: ElevatedButton(
                              onPressed: () {

                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          side: BorderSide(color: Colors.transparent,width: 1)
                                      )
                                  ),
                                  overlayColor: MaterialStateProperty.all(Colors.white30),
                                  elevation:MaterialStateProperty.all(0),
                                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(Colors.black),
                                  foregroundColor: MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                              child: const Icon(Icons.mode_edit_outline_outlined, color: Colors.white,)
                            ),
                          ),
                        ),


                      ],
                    ),
                    Column(
                      children: [
                        Text("ABDULLH", style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons"),color: Colors.amber,fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                        SizedBox(

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
                              child: Text(getTranslated(context, "editProfile")!,style: TextStyle(fontWeight: FontWeight.w400, fontFamily:  getTranslated(context, "fontFamilyBody")!,color: Colors.amber),),


                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 50,),
                 /// - Form
                 Expanded(
                   child: ListView(
                     // physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                      children: [
                        /// - Name
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: EdgeInsets.only(left:10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white30,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:1, child: Text("${getTranslated(context, "name")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const  Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   TextField(
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding:const EdgeInsets.only(left:10, right: 10),
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

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - Phone number
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white30,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "mobileNo")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const  Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   TextField(
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding:const EdgeInsets.only(left:10, right: 10),
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

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - email address
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white30,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:3, child: Text("${getTranslated(context, "emailAddress")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const  Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   TextField(
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding:const EdgeInsets.only(left:10, right: 10),
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

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - date of birth
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white30,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "dateOfBirth")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const  Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   TextField(
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding:const EdgeInsets.only(left:10, right: 10),
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

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - gender
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white30,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "gender")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const  Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   TextField(
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding:const EdgeInsets.only(left:10, right: 10),
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

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - Password
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white30,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "password")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const  Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   TextField(
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding:const EdgeInsets.only(left:10, right: 10),
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

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - refferal code
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white30,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:3, child:
                                Text("${getTranslated(context, "referralCode")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)
                                ),
                                const  Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   TextField(
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding:const EdgeInsets.only(left:10, right: 10),
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
                                        // hintText: '',
                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                         padding: const EdgeInsets.all(18.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                           Text("${getTranslated(context, "uploadId")!}", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),),
                           ElevatedButton(
                               onPressed: () {

                               },
                               style: ButtonStyle(
                                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                       const RoundedRectangleBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(5)),
                                           side: BorderSide(color: Colors.transparent,width: 1)
                                       )
                                   ),
                                   overlayColor: MaterialStateProperty.all(Colors.white30),
                                   elevation:MaterialStateProperty.all(0),
                                   shadowColor: MaterialStateProperty.all(Colors.transparent),
                                   backgroundColor: MaterialStateProperty.all(Colors.green),
                                   foregroundColor: MaterialStateProperty.all(Colors.white),
                                   padding: MaterialStateProperty.all(const EdgeInsets.only(top:10,bottom: 10, right: 30,left: 30)),
                                   textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15))),
                               child: Text("${getTranslated(context, "choose")!}", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white),),
                           ),
                         ],),
                       ),



                      ],
                    ),
                 ),


                /// - Buttons
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 60,
                                // width: 130,
                                child: ElevatedButton(
                                  onPressed: () {

                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              side: BorderSide(color: Colors.white30,width: 1)
                                          )
                                      ),
                                      overlayColor: MaterialStateProperty.all(Colors.black12),
                                      elevation:MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                  child:  Text(getTranslated(context, "oderHistory")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!, color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 60,
                                // width: 130,
                                child: ElevatedButton(
                                  onPressed: () {

                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              side: BorderSide(color: Colors.white30,width: 1)
                                          )
                                      ),
                                      overlayColor: MaterialStateProperty.all(Colors.black12),
                                      elevation:MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                  child:  Text(getTranslated(context, "savedAddress")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 60,
                                // width: 130,
                                child: ElevatedButton(
                                  onPressed: () {

                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              side: BorderSide(color: Colors.white30,width: 1)
                                          )
                                      ),
                                      overlayColor: MaterialStateProperty.all(Colors.black12),
                                      elevation:MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      // padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                  child:  Text(getTranslated(context, "savedCards")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {

                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              side: BorderSide(color: Colors.white30,width: 1)
                                          )
                                      ),
                                      overlayColor: MaterialStateProperty.all(Colors.black12),
                                      elevation:MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                  child:  Text(getTranslated(context, "loyalty")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 60,

                                child: ElevatedButton(
                                  onPressed: () {

                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              side: BorderSide(color: Colors.white30,width: 1)
                                          )
                                      ),
                                      overlayColor: MaterialStateProperty.all(Colors.black12),
                                      elevation:MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                  child:  Text(getTranslated(context, "help")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 60,

                                child: ElevatedButton(
                                  onPressed: () {

                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              side: BorderSide(color: Colors.white30,width: 1)
                                          )
                                      ),
                                      overlayColor: MaterialStateProperty.all(Colors.black12),
                                      elevation:MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                      padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                  child:  Text(getTranslated(context, "sighOut")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300, ),textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                          ),



                        ],
                      ),

                    ],
                  ),
                ),

              ],
            ),

          drawer: DrawerWidget(),

        ),
      ],

    );
  }
}
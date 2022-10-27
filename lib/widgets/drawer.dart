import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerWidget extends StatefulWidget{
  @override
  State<DrawerWidget> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child:SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:30.0, top: 15),
          child: Column(
            children: [

              Row(children:const [
                 ImageIcon(
                  AssetImage("assets/images/icon_menu.png",),
                  size: 35,
                   color: Colors.white,
                ),
                 // FaIcon(FontAwesomeIcons.bars, color: Colors.white,size: 30,),
                SizedBox(width: 15,),
                Text("HI ABDULLH",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.w300,fontSize: 20 ),),

            ],),


              const SizedBox(height: 20,),
              //Home
              const ListTile(
                title: Text("HOME", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                      width: 120,
                      height: 0,
                      child: Divider(color: Colors.white,)),
                ),
              ),
              //Notification
              const ListTile(
                title: Text("NOTIFICATIONS", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                      width: 120,
                      height: 0,
                      child: Divider(color: Colors.white,)),
                ),
              ),
              //Partners
              const  ListTile(
                title: Text("PARTNERS", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                      width: 120,
                      height: 0,
                      child: Divider(color: Colors.white,)),
                ),
              ),
              //Location
              const ListTile(
                title: Text("LOCATIONS", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
              ),
              const  Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                      width: 120,
                      height: 0,
                      child: Divider(color: Colors.white,)),
                ),
              ),
              //Feedback
              const  ListTile(
                title: Text("FEEDBACK", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
              ),
              const  Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                      width: 120,
                      height: 0,
                      child: Divider(color: Colors.white,)),
                ),
              ),
              //Contact us
              const  ListTile(
                title: Text("CONTACT US", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
              ),
              const  Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                      width: 120,
                      height: 0,
                      child: Divider(color: Colors.white,)),
                ),
              ),

              const  Expanded(child: SizedBox(height: 10,)),

              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("FOLLOW US", style: TextStyle(fontFamily: "oldpress",color: Colors.amber,fontSize: 50),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(

                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius:const BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  // border: Border.all(
                                  //   width: 0.5,
                                  //   color: Colors.white,
                                  //   style: BorderStyle.solid,
                                  // ),
                                ),
                                child: Image.asset("assets/images/facebook.png",height: 30,width: 35,),
                              ),

                              new Positioned.fill(
                                  child: new Material(
                                    color: Colors.transparent,
                                    child:  new InkWell(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      splashColor: Colors.black,
                                      overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                      onTap: (){
                                        print("text");
                                      },
                                    ),

                                  )
                              ),

                            ],
                          ),
                          SizedBox(width: 15,),
                          Stack(
                            children: [
                              Container(

                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius:const BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  // border: Border.all(
                                  //   width: 0.5,
                                  //   color: Colors.white,
                                  //   style: BorderStyle.solid,
                                  // ),
                                ),
                                child: Image.asset("assets/images/insta_icon.png",height: 30,width: 35,),
                              ),

                              new Positioned.fill(
                                  child: new Material(
                                    color: Colors.transparent,
                                    child:  new InkWell(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      splashColor: Colors.black,
                                      overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                      onTap: (){
                                        print("text");
                                      },
                                    ),

                                  )
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
              const SizedBox(height: 10,)

            ],
          ),
        ),
      )
    );
  }
}
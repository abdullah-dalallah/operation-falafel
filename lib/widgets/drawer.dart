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
          child: Container(
            child:Column(
              children: [

                 Row(children: [
                   FaIcon(FontAwesomeIcons.bars, color: Colors.white,size: 30,),
                  SizedBox(width: 15,),
                  Text("HI ABDULLH",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.w300,fontSize: 20 ),),

              ],),
                SizedBox(height: 20,),
                //Home
                ListTile(
                  title: Text("HOME", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                ),
                Align(
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
                ListTile(
                  title: Text("NOTIFICATIONS", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                ),
                Align(
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
                ListTile(
                  title: Text("PARTNERS", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                ),
                Align(
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
                ListTile(
                  title: Text("LOCATIONS", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                ),
                Align(
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
                ListTile(
                  title: Text("FEEDBACK", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                ),
                Align(
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
                ListTile(
                  title: Text("CONTACT US", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                        width: 120,
                        height: 0,
                        child: Divider(color: Colors.white,)),
                  ),
                ),
              
                Expanded(child: SizedBox(height: 10,)),
                
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("FOLLOW US", style: TextStyle(fontFamily: "oldpress",color: Colors.amber,fontSize: 50),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.5,left: 1.5),
                                  child: Container(
                                    height:35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade800,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(40),
                                        topLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                      ),

                                    ),

                                  ),
                                ),
                                Container(
                                    height:35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(40),
                                        topLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                      ),
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                      Image.asset("assets/images/facbook icon.png", color: Colors.white,),

                                      // Text(
                                      //   "F",style: TextStyle(fontFamily: "oldpress",color: Colors.white),
                                      // ),
                                    ),
                                  ),
                                new Positioned.fill(
                                    child: new Material(
                                        color: Colors.transparent,
                                        child:  new InkWell(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            splashColor: Colors.black,
                                            overlayColor: MaterialStateProperty.all<Color>(Colors.black),

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
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.5,left: 1.5),
                                  child: Container(
                                    height:35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.brown,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(40),
                                        topLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40),
                                      ),

                                    ),

                                  ),
                                ),
                                Container(
                                  height:35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      topLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                    border: Border.all(
                                      width: 1.5,
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Center(
                                    child:FaIcon(FontAwesomeIcons.instagram,color: Colors.white,)
                                    // Image.asset("assets/images/facbook icon.png", color: Colors.white,),

                                    // Text(
                                    //   "F",style: TextStyle(fontFamily: "oldpress",color: Colors.white),
                                    // ),
                                  ),
                                ),
                                new Positioned.fill(
                                    child: new Material(
                                      color: Colors.transparent,
                                      child:  new InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        splashColor: Colors.black,
                                        overlayColor: MaterialStateProperty.all<Color>(Colors.black),

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
                SizedBox(height: 10,)

              ],
            ),
          ),
        ),
      )
    );
  }
}
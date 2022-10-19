

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
                
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("FOLLOW US", style: TextStyle(fontFamily: "oldpress",color: Colors.amber,fontSize: 50),)),

              ],
            ),
          ),
        ),
      )
    );
  }
}
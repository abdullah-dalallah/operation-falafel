import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test_Rout extends StatefulWidget{
  @override
  State<Test_Rout> createState() => _Test_RoutState();
}

class _Test_RoutState extends State<Test_Rout> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(),
     body:Center(
       child: Container(
         child: Text("Test Page"),
       ),
     ),
   );
  }
}
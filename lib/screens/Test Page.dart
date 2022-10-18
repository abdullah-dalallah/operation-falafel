import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test_Rout extends StatefulWidget{
  @override
  State<Test_Rout> createState() => _Test_RoutState();
}

class _Test_RoutState extends State<Test_Rout> {
  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       Image.asset(
         "assets/images/background.jpeg",
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         fit: BoxFit.cover,
       ),
       Scaffold(
         backgroundColor: Colors.transparent,


         appBar: AppBar(
           backgroundColor: Colors.transparent,
           elevation: 0,
           title: Text("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)

         ),

         body:Center(
           child: Column(
             children: [

               SizedBox(height: 20,),
               Text("!MY O:F CART",style: TextStyle(fontFamily: "oldpress",color: Colors.amber.shade300, fontSize: 50),),
               SizedBox(height: 50,),

               Text("YOUR CART IS EMPITY",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),),
               SizedBox(height: 15,),
               Container(
                 width: 300,
                   height: 40,
                 child: ElevatedButton(
                   onPressed: null,
                   style: ButtonStyle(
                     backgroundColor:  MaterialStateProperty.all<Color>(Colors.green),
                     foregroundColor:
                     MaterialStateProperty.all<Color>(Colors.black),
                     shape: MaterialStateProperty.all(
                         RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(0.0),
                             side: BorderSide(color: Colors.grey.shade200,width: 1.5)
                         )
                     ),


                   ),
                   child: Text("Order Now",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)


                   // Padding(
                   //   padding: const EdgeInsets.all(8.0),
                   //   child: Image.asset("assets/images/text button.png", color: Colors.white,),
                   // ),
                 )
               ),
             ],
           ),
         ),
       ),
     ],
   );
  }
}
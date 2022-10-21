import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart_Screen extends StatefulWidget{
  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey(); // Create a key
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
         key: _drawerKey,
         backgroundColor: Colors.transparent,


         appBar: AppBar(
           leading:IconButton(onPressed: (){
             _drawerKey.currentState?.openDrawer();
           },icon: FaIcon(FontAwesomeIcons.bars,size: 30,),) ,
           backgroundColor: Colors.transparent,
           elevation: 0,
           title: Text("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)

         ),

         body:Center(
           child: Column(
             children: [

               SizedBox(height: 20,),
               Text("MY O:F CART!",style: TextStyle(fontFamily: "oldpress",color: Colors.amber.shade300, fontSize: 50),),
               SizedBox(height: 50,),

               Text("YOUR CART IS EMPITY",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),),
               SizedBox(height: 10,),
               Container(
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
                             borderRadius: BorderRadius.circular(0.0),
                             side: BorderSide(color: Colors.grey.shade200,width: 1.5)
                         )
                     ),


                   ),
                   child: Text("Order Now",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 25),)


                   // Padding(
                   //   padding: const EdgeInsets.all(8.0),
                   //   child: Image.asset("assets/images/text button.png", color: Colors.white,),
                   // ),
                 )
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
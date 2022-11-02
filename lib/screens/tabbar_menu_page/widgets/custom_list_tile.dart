import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/screens/tabbar_menu_page/widgets/image_with_add_button.dart';

class CustomListTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      /// -  Image & add button
      ImageWithAddButton(),

      const SizedBox(width: 5,),
      Expanded(
        flex: 4,
        child: Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
              Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),

              Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w300),),
            ],
          ),
        ),
      ),


    ],
  );
  }

}
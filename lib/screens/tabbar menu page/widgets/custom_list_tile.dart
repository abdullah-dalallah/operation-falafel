import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/widgets/image_with_add_button.dart';

class CustomListTile extends StatelessWidget{
  final String layOut ;
  const CustomListTile({super.key,required this.layOut});

  @override
  Widget build(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      /// -  Image & add button
      ImageWithAddButton(layOut: layOut,),

      const SizedBox(width: 5,),
      Expanded(
        flex: 4,
        child: Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Chicken Fatteh", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
              Text("Chicken topped with rice, fatteh yogurt,fried bread,pine nuts,sumac. parsley and gheee.", style: TextStyle(fontSize: 15, color: Colors.white,fontFamily:getTranslated(context, "fontFamilyBody")!,),),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("AED 44", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                ],
              ),
            ],
          ),
        ),
      ),


    ],
  );
  }

}
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/slider_provider.dart';
import 'package:operation_falafel/widgets/Slider/slider_widget.dart';
import 'package:provider/provider.dart';

class LoyaltyPaymentMethodCheckbox extends StatelessWidget{
  final bool value;

  final String text;
  final bool addOnFlag;
  Color? colorOfBox;
  Color? colorOfText;
  String? fontFamily;
  String? priceText;
  final ValueChanged onChanged;
  final double pointValue;
  LoyaltyPaymentMethodCheckbox({super.key,
    required this.value,
    required this.pointValue,
    required this.text,
    required this.onChanged,
    this.priceText,
    this.colorOfBox,
    this.colorOfText,
    required this.addOnFlag,
    this.fontFamily
  });

  Widget _buildLabel() {
    final bool isSelected = value  ;

    return Container(
      width: 19,
      height: 19,
      decoration:  BoxDecoration(
        color: Colors.transparent,
        borderRadius:const BorderRadius.only(
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: (colorOfBox!=null)?colorOfBox!:Colors.amber,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: isSelected ? Image.asset("assets/images/page2_icon.png", height: 50,width: 50,) :null,
      ),
    );
  }

  Widget _buildMyMyText( BuildContext context) {
    return Row(

      children: [
        Transform.rotate(
            angle: -35 * (pi / 180), // Convert degrees to radians.
            child: MyText("O:F", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color:Colors.white70, fontSize: 20, ),)),
        SizedBox(width: 5,),
        MyText("${text}", style: TextStyle(color:Colors.white70, fontSize: 15,fontFamily: fontFamily),),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: ThemeData.light(),
      child: ExpansionTile(
        onExpansionChanged: (expansionValue) {
          print(expansionValue);
          onChanged(expansionValue);
        },
        iconColor: Colors.white,
        title: Row(
          children: [

            _buildLabel(),
            SizedBox(width: 10,),
            _buildMyMyText(context)


          ],
        ),
        children: [

          Container(
            decoration: const BoxDecoration(
              color: Colors.white24,
              borderRadius:  BorderRadius.only(
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                topLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              // border: Border.all(
              //   width: 1,
              //   color: Colors.amber,
              //   style: BorderStyle.solid,
              // ),
            ),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left:8.0, top: 15, bottom: 15 ,right: 18),
                  child: Row(
                    children: [

                      IconButton(onPressed: (){
                       double tempValue = 0.0;
                       tempValue = Provider.of<SliderProvider>(context, listen: false).selectedPoint;
                        Provider.of<SliderProvider>(context, listen: false).onChangePoint(tempValue-1);

                      }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white70,size:26)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        MyText("${pointValue/10} AED", style: TextStyle(color:Colors.amber,fontSize:17,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            MyText("${pointValue}", style: TextStyle(color:Colors.white54, fontSize: 12,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
                            MyText(" Point", style: TextStyle(color:Colors.white54, fontSize: 12,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
                          ],
                        ),
                      ],),
                      IconButton(onPressed: (){
                        double tempValue = 0.0;
                        tempValue = Provider.of<SliderProvider>(context, listen: false).selectedPoint;
                        Provider.of<SliderProvider>(context, listen: false).onChangePoint(tempValue+1);

                      }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white70,)),
                      Expanded(child: SizedBox(width: 1,)),
                      SizedBox(
                        height: 30,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Provider.of<SliderProvider>(context, listen: false).onChangePoint(200);

                          },
                          child: MyText("All Point", style: TextStyle(color:Colors.amber, fontSize: 12 , fontWeight: FontWeight.normal,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),




                        ),
                      ),
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(left:18.0,right: 18),
                  child: SliderWidget(
                    max: 200,min: 0,
                    fullWidth: true,
                  ),
                ),
                SizedBox(height: 20,),

              ],
            ),
            // margin: EdgeInsets.only(left:18, right:18, top:8, bottom:8),

          ),



        ],
      ),
    );
  }
}
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/Slider/slider_widget.dart';

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

  Widget _buildMyText( BuildContext context) {
    return Row(

      children: [
        Transform.rotate(
            angle: -35 * (pi / 180), // Convert degrees to radians.
            child: Text("O:F", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color:Colors.white70, fontSize: 20, ),)),
        SizedBox(width: 5,),
        Text("${text}", style: TextStyle(color:Colors.white70, fontSize: 15),),
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
            _buildMyText(context)


          ],
        ),
        children: [

          Container(
            decoration:  BoxDecoration(
              color: Colors.white24,
              borderRadius: const BorderRadius.only(
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
                ListTile(
                  contentPadding: EdgeInsets.only(left:28,right:18, ),
                  // dense: true,
                  subtitle:Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${pointValue}", style: TextStyle(color:Colors.white54, fontSize: 12),),
                      Text(" Point", style: TextStyle(color:Colors.white54, fontSize: 12),),
                    ],
                  ),
                  title: Text("${pointValue/10} AED", style: TextStyle(color:Colors.amber,fontSize:20),),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {




                          },
                          child: Text("Change", style: TextStyle(color:Colors.amber, fontSize: 12 , fontWeight: FontWeight.normal),),




                        ),
                      ),
                    ],
                  ),

                ),

                Padding(
                  padding: const EdgeInsets.only(left:18.0,right: 18),
                  child: SliderWidget(
                    max: 150,min: 0,
                    fullWidth: true,
                  ),
                ),
                SizedBox(height: 10,),

              ],
            ),
            // margin: EdgeInsets.only(left:18, right:18, top:8, bottom:8),

          ),



        ],
      ),
    );
  }
}
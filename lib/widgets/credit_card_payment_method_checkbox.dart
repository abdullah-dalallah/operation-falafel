import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class CreditCardPaymentMethodCheckbox extends StatelessWidget{
  final bool value;

  final String text;
  final bool addOnFlag;
  Color? colorOfBox;
  Color? colorOfSelectedBox;
  Color? colorOfText;
  String? fontFamily;
  String? priceText;
  final ValueChanged onChanged;
  CreditCardPaymentMethodCheckbox({super.key,
    required this.value,
    required this.colorOfSelectedBox,
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
          color: (isSelected)?colorOfSelectedBox!:(colorOfBox!=null)?colorOfBox!:Colors.amber,
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
        Icon(Icons.add_card_rounded, size: 20,color:Colors.white70),
        SizedBox(width: 5,),
        MyText("${text}", style: TextStyle(color:Colors.white70, fontSize: 15),),
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
                child: ListTile(
                  contentPadding: EdgeInsets.only(left:28,right:18, bottom: 5),
                  dense: true,
                  title:MyText("Selected Card", style: TextStyle(color:Colors.amber),),
                  subtitle: Row(
                    children: [
                      Image.asset("assets/images/masterCard_logo.png", height: 20,width: 24,color: Colors.white,),
                      SizedBox(width: 5,),
                      MyText("card ending in 4444", style: TextStyle(color:Colors.white54),),
                    ],
                  ),
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
                          child: MyText("Change", style: TextStyle(color:Colors.amber, fontSize: 12 , fontWeight: FontWeight.normal),),




                        ),
                      ),
                    ],
                  ),

                ),
                // margin: EdgeInsets.only(left:18, right:18, top:8, bottom:8),

              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: 30,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {




                  },
                  child: MyText("Add New Card", style: TextStyle(color:Colors.amber),),




                ),
              ),

            ],
          ),
        );
  }
}
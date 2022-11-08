import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxOption extends StatelessWidget{
  final bool value;
  final String label;
  final String text;
  final bool addOnFlag;
  Color? colorOfBox;
  Color? colorOfText;
  String? fontFamily;
  String? priceText;
  final ValueChanged onChanged;
   CheckboxOption({super.key,
    required this.value,
    required this.label,
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
      width: 22,
      height: 22,
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
        child:
        isSelected ? Image.asset("assets/images/page2_icon.png", height: 50,width: 50,)
            :null,
      ),
    );
  }

  Widget _buildText() {
    return Row(

      children: [
        Text(text, style:  TextStyle(color: (colorOfText!=null)?colorOfText!:Colors.green, fontSize: 15,fontWeight: FontWeight.w300, fontFamily: fontFamily),),



      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.grey.withOpacity(0.5),
        child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  _buildLabel(),
                  const SizedBox(width: 10),
                  _buildText(),

                  Expanded(child: SizedBox(width: 10,)),

                  (priceText!=null)?
                  Text(priceText!, style:  TextStyle(color: (colorOfText!=null)?colorOfText!:Colors.green, fontSize: 15,fontWeight: FontWeight.w300, fontFamily: fontFamily),):
                  const SizedBox(width: 1,),
                  const SizedBox(width: 10,),


                ],
              ),




      ),
    );
  }

}
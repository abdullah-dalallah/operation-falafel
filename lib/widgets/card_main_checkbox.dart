import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class CardMainCheckbox extends StatelessWidget{
  final bool value;
  final String label;
  final String text;
  final bool addOnFlag;
  Color? colorOfBox;
  Color? colorOfText;
  String? fontFamily;
  String? priceText;
  final ValueChanged onChanged;
  CardMainCheckbox({super.key,
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

  Widget _buildMyText( BuildContext context) {
    return Row(

      children: [
        // RichMyText(
        //   text: TextSpan(
        //     text: "",
        //     style: TextStyle(color: (widget.colorOfText!=null)?widget.colorOfText!:Colors.green, fontSize: 15,fontWeight: FontWeight.w300, fontFamily: widget.fontFamily),
        //     children: <TextSpan>[
        //
        //       TextSpan(
        //           text: widget.text,
        //           style:const TextStyle(decoration: TextDecoration.underline),
        //           recognizer: TapGestureRecognizer()
        //             ..onTap = () => print('click')),
        //     ],
        //   ),
        // ),

        MyText(getTranslated(context,text)!, style:  TextStyle(color: (colorOfText!=null)?colorOfText!:Colors.green, fontSize: 15,fontWeight: FontWeight.bold, fontFamily: fontFamily,),),



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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            _buildLabel(),
            const SizedBox(width: 10),
           _buildMyText(context),



          ],
        ),




      ),
    );
  }
}
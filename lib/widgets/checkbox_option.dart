import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxOption extends StatelessWidget{
  final bool value;
  final String label;
  final String text;
  final ValueChanged onChanged;
  const CheckboxOption({super.key,
    required this.value,
    required this.label,
    required this.text,
    required this.onChanged,
  });


  Widget _buildLabel() {
    final bool isSelected = value  ;

    return Container(
      width: 25,
      height: 25,
      decoration:  BoxDecoration(
        color: Colors.transparent,
        borderRadius:const BorderRadius.only(
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
          topLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        border: Border.all(
          width: 1,
          color: Colors.amber,
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
    return Text(
      text,
      style: const TextStyle(color: Colors.green, fontSize: 15,fontWeight: FontWeight.w300),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.grey.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              _buildLabel(),
              const SizedBox(width: 10),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }

}
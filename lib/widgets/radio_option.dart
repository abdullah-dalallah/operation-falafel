import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class RadioOption<T> extends StatelessWidget{
  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final ValueChanged<T?> onChanged;

  const RadioOption({super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.text,
    required this.onChanged,
  });


  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 25,
      height: 25,
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
      style:  TextStyle(color: Colors.amber, fontSize: 15,fontWeight: FontWeight.w300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

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
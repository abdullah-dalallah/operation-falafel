import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class LanguageRadioOption<T> extends StatelessWidget{
  final T value;
  final T? groupValue;
  final String label;
  final String name;
  final String iconImage;
  final ValueChanged<T?> onChanged;

  const LanguageRadioOption({super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.name,
    required this.onChanged,
    required this.iconImage
  });


  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 20,
      height: 20,
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
          color: isSelected?Colors.amber:Colors.white,
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

  Widget _buildMyText() {
    final bool isSelected = value == groupValue;
    return MyText(
      name,
      style:  TextStyle(color:isSelected?Colors.amber: Colors.white, fontSize: 15,fontWeight: FontWeight.w300),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(

                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  child: Image.network(iconImage,height: 30,width: 30,fit: BoxFit.cover,)),
              const SizedBox(width: 10),
              // ImageIcon(NetworkImage(iconImage)),
              _buildMyText(),
              Expanded(child: const SizedBox(width: 10)),
              _buildLabel(),


            ],
          ),
        ),
      ),
    );

  }

}
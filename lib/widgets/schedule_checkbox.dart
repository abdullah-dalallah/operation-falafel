import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/schedule_widget.dart';

import '../models/AppThemeModels/DesignPerPage/CartPage/cart_page.dart';
import '../models/AppThemeModels/FontSizes/Language/lang.dart';

class ScheduleCheckbox extends StatefulWidget{
  final bool value;
  final String text;
  Color? colorOfBox;
  Color? colorOfText;
  String? fontFamily;
  final ValueChanged onChanged;
  CartPage? cartPage;
  Language? lng;


  ScheduleCheckbox({
    required this.value,
    required this.text,
    required this.onChanged,
    this.colorOfBox,
    this.colorOfText,
    this.fontFamily,
    this.cartPage,
    this.lng,

    super.key});
  @override
  State<ScheduleCheckbox> createState() => _ScheduleCheckboxState();
}

class _ScheduleCheckboxState extends State<ScheduleCheckbox> {
  Widget _buildLabel() {
    final bool isSelected = widget.value  ;

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
          color: (isSelected)?

          // Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.checkBoxDesgin!.selectedColor!)) :
          (widget.colorOfBox!=null)?widget.colorOfBox!
              :Colors.white:Colors.white,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: isSelected ?
        // (widget.cartPage!=null)?
        // Image.network(widget.cartPage!.body.paymentMethods!.loyaltyCreditPeymantMethodCheckBox!.checkBoxDesgin!.selectedImage!,height: 50,width: 50,) :
        Image.asset("assets/images/page2_icon.png", height: 50,width: 50,)
            :null,
      ),
    );
  }

  Widget _buildMyMyText( BuildContext context) {
    return Row(

      children: [
         MyText("${widget.text}", style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color:Colors.white70, fontSize: 20, ),),
        SizedBox(width: 5,),
        // MyText("${widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.data}", style: TextStyle(color:Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.color!)), fontSize: widget.lng!.header3.size.toDouble(),fontFamily: widget.lng!.header3.textFamily),),
        // MyText("${text}", style: TextStyle(color:Colors.white70, fontSize: 15,fontFamily: fontFamily),),
      ],
    );
  }

  TextEditingController pointController =  TextEditingController();
  final GlobalKey expansionTileKey = GlobalKey();
  void _scrollToSelectedContent({required GlobalKey expansionTileKey}) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        Scrollable.ensureVisible(keyContext,
            duration: Duration(milliseconds: 200));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: ThemeData.light(),
      child: ExpansionTile(
        key: expansionTileKey,
        onExpansionChanged: (expansionValue) {

          print(expansionValue);
          widget.onChanged(expansionValue);
          if (expansionValue) {
            print("scrolling up");
            _scrollToSelectedContent(expansionTileKey: expansionTileKey);
          }
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
          ScheduleWidget()
        ],
      ),
    );
  }
}
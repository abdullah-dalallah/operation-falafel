import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/my_text_form_field.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CartPage/cart_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/slider_provider.dart';
import 'package:operation_falafel/widgets/Slider/slider_widget.dart';
import 'package:provider/provider.dart';

class LoyaltyPaymentMethodCheckbox extends StatefulWidget{
  final bool value;

  final String text;
  final bool addOnFlag;
  Color? colorOfBox;
  Color? colorOfText;
  String? fontFamily;
  String? priceText;
  final ValueChanged onChanged;
  final double pointValue;
  final CartPage? cartPage;
  final Language? lng;
  final TextEditingController pointController;
  LoyaltyPaymentMethodCheckbox({super.key,
    required this.pointController,
    required this.value,
    required this.pointValue,
    required this.text,
    required this.onChanged,
    this.priceText,
    this.colorOfBox,
    this.colorOfText,
    required this.addOnFlag,
    this.fontFamily,
    required this.cartPage,
    required this.lng
  });

  @override
  State<LoyaltyPaymentMethodCheckbox> createState() => _LoyaltyPaymentMethodCheckboxState();
}

class _LoyaltyPaymentMethodCheckboxState extends State<LoyaltyPaymentMethodCheckbox> {
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

          Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.checkBoxDesgin!.selectedColor!))
              :(widget.colorOfBox!=null)?widget.colorOfBox!:Colors.white,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: isSelected ?
        (widget.cartPage!=null)?Image.network(widget.cartPage!.body.paymentMethods!.loyaltyCreditPeymantMethodCheckBox!.checkBoxDesgin!.selectedImage!,height: 50,width: 50,):
        Image.asset("assets/images/page2_icon.png", height: 50,width: 50,)
            :null,
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
        MyText("${widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.data}", style: TextStyle(color:Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.color!)), fontSize: widget.lng!.header3.size.toDouble(),fontFamily: widget.lng!.header3.textFamily),),
        // MyText("${text}", style: TextStyle(color:Colors.white70, fontSize: 15,fontFamily: fontFamily),),
      ],
    );
  }

  TextEditingController pointController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: ThemeData.light(),
      child: ExpansionTile(
        onExpansionChanged: (expansionValue) {
          print(expansionValue);
          widget.onChanged(expansionValue);
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
              color: Colors.black,
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

                // Padding(
                //   padding: const EdgeInsets.only(left:8.0, top: 15, bottom: 15 ,right: 18),
                //   child: Row(
                //     children: [
                //
                //       IconButton(onPressed: (){
                //        double tempValue = 0.0;
                //        tempValue = Provider.of<SliderProvider>(context, listen: false).selectedPoint;
                //         Provider.of<SliderProvider>(context, listen: false).onChangePoint((tempValue>0)?tempValue-1:tempValue);
                //
                //       }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white70,size:int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.minusArrow!.mobileSize).toDouble())),/// <--- Add Icon After deploy the Icon from server
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //         MyText("${widget.pointValue/10} AED", style: TextStyle(color:Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.selectedPriceOfDiscount!.color)),fontSize:widget.lng!.header4.size.toDouble(),fontFamily: widget.lng!.header5.textFamily),),
                //         SizedBox(height: 5,),
                //         Row(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //
                //             MyText("${widget.pointValue}", style: TextStyle(color:Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.selectedAmountOfPoints!.color)), fontSize: widget.lng!.header2.size.toDouble(),fontFamily: widget.lng!.header2.textFamily),),
                //             MyText(" Point",
                //                 style: TextStyle(color:Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.selectedAmountOfPoints!.color)), fontSize: widget.lng!.header2.size.toDouble(),fontFamily: widget.lng!.header2.textFamily)
                //             ),
                //           ],
                //         ),
                //       ],),
                //       IconButton(onPressed: (){
                //         double tempValue = 0.0;
                //         tempValue = Provider.of<SliderProvider>(context, listen: false).selectedPoint;
                //         Provider.of<SliderProvider>(context, listen: false).onChangePoint((tempValue<200)?tempValue+1:tempValue);
                //
                //       }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white70,size:int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.minusArrow!.mobileSize).toDouble())),
                //       Expanded(child: SizedBox(width: 1,)),
                //       SizedBox(
                //         height: 30,
                //         child: TextButton(
                //           style: TextButton.styleFrom(
                //             foregroundColor: Colors.white,
                //           ),
                //           onPressed: () {
                //             Provider.of<SliderProvider>(context, listen: false).onChangePoint(200);
                //
                //           },
                //           child: MyText(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.fullPointButton!.data!, style: TextStyle(color:Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.fullPointButton!.color)), fontSize: widget.lng!.header2.size.toDouble() , fontWeight: FontWeight.normal,fontFamily: widget.lng!.header2.textFamily),),
                //
                //
                //
                //
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Colors.black87,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 1,
                        color: Colors.amber,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                // flex: 1,
                                child:Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,

                                    borderRadius:

                                    (Localizations.localeOf(context).languageCode == 'en') ?
                                    const BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),

                                    ) :
                                    (Localizations.localeOf(context).languageCode == 'ar') ?
                                    const BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ) :
                                    const BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                    ),

                                    // border: Border.all(
                                    //   width: 0,
                                    //   color: Colors.transparent,
                                    //   style: BorderStyle.solid,
                                    // ),
                                  ),
                                  child: Center(
                                    child: MyText(
                                      '${widget.pointValue/10} AED',
                                      style: TextStyle(
                                          fontSize: widget.lng?.header2.size.toDouble(),
                                          fontFamily: widget.lng?.header2.textFamily,
                                          color: Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.selectedPriceOfDiscount!.color!))),),
                                  ),
                                ),
                              ),
                              const  Padding(
                                 padding: const EdgeInsets.only(right: 18.0),
                                 child: SizedBox(
                                   width: 15,
                                     // flex: 1,
                                     child: Divider(color: Colors.amber,thickness: 2,)),
                               ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(

                                  child: MyTextFormField(
                                    controller: widget.pointController,
                                    keyboardType: TextInputType.number,
                                    enabled: true,
                                    autofocus: true,
                                    style:  TextStyle(color: Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.selectedAmountOfPoints!.color!)), fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize: 15),
                                    decoration:  InputDecoration(

                                      filled: true,
                                      fillColor: Colors.black45,
                                      contentPadding: const EdgeInsets.only(left: 10, right: 10),
                                      focusedBorder: OutlineInputBorder(borderRadius:  (Localizations.localeOf(context).languageCode == 'ar') ?

                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),

                                        ) :
                                        (Localizations.localeOf(context).languageCode == 'en') ?
                                        const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ) :
                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderRadius:  (Localizations.localeOf(context).languageCode == 'ar') ?

                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0,),
                                          topLeft: Radius.circular(10.0),

                                        ) :
                                        (Localizations.localeOf(context).languageCode == 'en') ?
                                        const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ) :
                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                        ),

                                        borderSide:const BorderSide(
                                          color: Colors.red,
                                          width: 1.0,),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderRadius:  (Localizations.localeOf(context).languageCode == 'ar') ?

                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0,),
                                          topLeft: Radius.circular(10.0),

                                        ) :
                                        (Localizations.localeOf(context).languageCode == 'en') ?
                                        const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ) :
                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                        ),

                                        borderSide:const BorderSide(
                                          color: Colors.red,
                                          width: 1.0,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        (Localizations.localeOf(context).languageCode == 'ar') ?

                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),

                                        ) :
                                        (Localizations.localeOf(context).languageCode == 'en') ?
                                        const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ) :
                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                        ),

                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 10.0),
                                      ),
                                      disabledBorder:OutlineInputBorder(
                                        borderRadius:
                                        (Localizations.localeOf(context).languageCode == 'ar') ?

                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),

                                        ) :
                                        (Localizations.localeOf(context).languageCode == 'en') ?
                                        const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ) :
                                        const BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                        ),

                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 10.0),
                                      ),
                                      hintText: '${widget.pointValue} ',
                                      hintStyle: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.selectedAmountOfPoints!.color!)), fontSize: 15),
                                      suffixIcon:   SizedBox(
                                        height: 30,
                                        child: TextButton(
                                          style: TextButton.styleFrom(foregroundColor: Colors.white, ),
                                          onPressed: () {

                                            Provider.of<SliderProvider>(context, listen: false).onChangePointController(200);

                                          },
                                          child: MyText(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.fullPointButton!.data!, style: TextStyle(color:Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.fullPointButton!.color)), fontSize: widget.lng!.header2.size.toDouble() , fontWeight: FontWeight.normal,fontFamily: widget.lng!.header2.textFamily),),




                                        ),
                                      ),
                                      prefixIcon: Padding(
                                         padding: const EdgeInsets.only(right: 8.0, top: 14),
                                         child: MyText("pts:", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.selectedAmountOfPoints!.color!)), fontSize: 15),),
                                       ),
                                      // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                    ),
                                    onChanged: (value){
                                      double tempValue = 0.0;
                                      tempValue = Provider.of<SliderProvider>(context, listen: false).selectedPoint;
                                      if(value.isNotEmpty){
                                        double tempValue = double.parse(value);
                                        if(tempValue>200){
                                          tempValue=200;
                                          Provider.of<SliderProvider>(context, listen: false).onChangePointController(tempValue);

                                        }
                                        if(tempValue<=0){
                                          tempValue=0;
                                          Provider.of<SliderProvider>(context, listen: false).onChangePointController(tempValue);
                                        }
                                        Provider.of<SliderProvider>(context, listen: false).onChangePoint(tempValue);

                                      }else{

                                        Provider.of<SliderProvider>(context, listen: false).onChangePoint(0);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),


                        SliderWidget(
                            max: 200,min: 0,
                            fullWidth: true,
                            lng: widget.lng,
                            cartPage: widget.cartPage,
                          ),


                      ],
                    ),
                  ),
                ),

                // SizedBox(height: 20,),

              ],
            ),
            // margin: EdgeInsets.only(left:18, right:18, top:8, bottom:8),

          ),



        ],
      ),
    );
  }
}
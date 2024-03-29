import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/CartPage/cart_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/slider_provider.dart';
import 'package:operation_falafel/widgets/Slider/custom_slider_thumb_circle.dart';
import 'package:provider/provider.dart';


class SliderWidget extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;
  final CartPage? cartPage;
  final Language? lng;
  SliderWidget(
      {this.sliderHeight = 48,
        this.max = 10,
        this.min = 0,
        this.fullWidth = false,
        required this.cartPage,
        required this.lng
      });

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;
  String formatNumberWithK(int number) {
    if (number >= 1000) {
      double result = number / 1000;
      return result.toStringAsFixed(1) + "K";
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return

      Consumer<SliderProvider>(
          builder: (context,SliderProvider, child)
            {
             return Container(
                width: this.widget.fullWidth ? double.infinity : (this.widget.sliderHeight) * 5.5,
                height: (this.widget.sliderHeight),
                decoration: BoxDecoration(
                  color: Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.sliderDesign!.sliderBackGroundColor!)),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular((this.widget.sliderHeight * .2)),
                    bottomLeft: Radius.circular((this.widget.sliderHeight * .2)),
                    // Radius.circular((this.widget.sliderHeight * .3)),
                  ),
                  // gradient:  LinearGradient(
                  //     colors: [
                  //       const Color(0xFF00c6ff),
                  //       const Color(0xFF0072ff),
                  //     ],
                  //     begin: const FractionalOffset(0.0, 0.0),
                  //     end: const FractionalOffset(1.0, 1.00),
                  //     stops: [0.0, 1.0],
                  //     tileMode: TileMode.clamp),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(this.widget.sliderHeight * paddingFactor, 2, this.widget.sliderHeight * paddingFactor, 2),
                  child: Row(
                    children: <Widget>[
                      MyText(
                        '${formatNumberWithK(this.widget.min)} ${widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.sliderDesign!.minPtsTitle!.data!}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: this.widget.sliderHeight * .3,
                            fontWeight: FontWeight.w700,
                            color: Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.sliderDesign!.minPtsTitle!.color)),
                            fontFamily: widget.lng!.header2.textFamily
                        ),
                      ),
                      SizedBox(
                        width: this.widget.sliderHeight * .1,
                      ),
                      Expanded(
                        child: Center(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor:
                              Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.sliderDesign!.acitveTrackColor!)),
                              // Colors.amber.withOpacity(1),
                              inactiveTrackColor:Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.sliderDesign!.inAcitveTrackColor!)),

                              // Colors.white.withOpacity(.5),
                              trackHeight: 4.0,
                              thumbShape: CustomSliderThumbCircle(
                                  thumbRadius: this.widget.sliderHeight * .4,
                                  min: this.widget.min,
                                  max: this.widget.max,
                                  imageProvider: AssetImage(
                                      'assets/images/page2orders_icon.png'),
                                  lng: widget.lng,
                                  cartPage: widget.cartPage
                              ),
                              overlayColor: Colors.white.withOpacity(.4),
                              //valueIndicatorColor: Colors.white,
                              activeTickMarkColor: Colors.white,
                              inactiveTickMarkColor: Colors.red.withOpacity(.7),
                            ),
                            child: Slider(
                                value:getSliderValue(SliderProvider.selectedPoint) ,
                                //_value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });

                                  SliderProvider.onChangePoint(getValue(value).toDouble());
                                  SliderProvider.onChangePointController(getValue(value).toDouble());
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: this.widget.sliderHeight * .1,
                      ),
                      MyText(
                        '${formatNumberWithK(this.widget.max)} ${widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.sliderDesign!.maxPtsTitle!.data!}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: this.widget.sliderHeight * .3,
                            fontWeight: FontWeight.w700,
                            color: Color(int.parse(widget.cartPage!.body.paymentMethods.loyaltyCreditPeymantMethodCheckBox!.selectedPoint!.sliderDesign!.maxPtsTitle!.color)),
                            fontFamily: widget.lng!.header2.textFamily
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
  }

  int getValue(double value) {
    return (widget.min+(widget.max-widget.min)*value).round();
  }
  double getSliderValue(double value){
    return ((value-widget.min)/widget.max-widget.min);
  }


}
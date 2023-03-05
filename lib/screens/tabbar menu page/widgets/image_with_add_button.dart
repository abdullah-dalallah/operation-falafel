import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/screens/item%20details%20page/item_details_sheet.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/widgets/repeat_last_customization_sheet.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/MenuPage/menu_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class ImageWithAddButton extends StatefulWidget{
  final String layOut ;

  const ImageWithAddButton({super.key, required this.layOut});

  @override
  State<ImageWithAddButton> createState() => _ImageWithAddButtonState();
}

class _ImageWithAddButtonState extends State<ImageWithAddButton> {
  bool addFirstTime =true;
  @override
  Widget build(BuildContext context) {
    return Consumer<DemoCartProvider>(
          builder: (context, value, child) {
            bool alreadyExist = value.checkExistInCart("Chicken Fatteh");
            return  Consumer<ThemeProvider>(
                builder: (context, appTheme, child)
            {
              Language? lng = (Localizations
                  .localeOf(context)
                  .languageCode == 'ar')
                  ? appTheme.appTheme.fontSizes?.ar
                  : appTheme
                  .appTheme.fontSizes?.en;
              MenuPage? menuPage = appTheme.appTheme.designPerPage?.menuPage;
              bool loadingDesign = menuPage != null;
             return SizedBox(
                height: 130,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [

                    /// - Image
                    Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),

                          ),
                          color: Colors.transparent,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),

                            ),
                            child: Image.asset(
                              "assets/images/OF Chicken Fatteh.jpg", width: 100,
                              height: 100,))
                    ),

                    /// - Add button
                    Visibility(
                      visible: !alreadyExist,
                      child: Positioned(
                        bottom: 13,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              // border: Border.all(
                              //   width: 0.8,
                              //   color: Colors.white,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [

                                    SizedBox(
                                      width: 80,
                                      height: 30,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            addFirstTime = false;
                                          });
                                          showModalBottomSheet(
                                              useSafeArea: true,
                                              isScrollControlled: true,
                                              // expand: false,
                                              context: context,
                                              backgroundColor: Colors
                                                  .transparent,
                                              builder: (context) =>
                                                  DraggableScrollableSheet(
                                                      initialChildSize: 0.7,
                                                      minChildSize: 0.6,
                                                      maxChildSize: 1,
                                                      expand: true,
                                                      builder: (context,
                                                          scrollController) {
                                                        return ItemDetailsSheet(
                                                            layOut: widget
                                                                .layOut,
                                                            scrollController);
                                                      }

                                                  )

                                          );
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                                const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .all(
                                                        Radius.circular(10)),
                                                    side: BorderSide(
                                                        color: Colors
                                                            .transparent,
                                                        width: 1)
                                                )
                                            ),
                                            overlayColor: MaterialStateProperty
                                                .all(Colors.black12),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            backgroundColor: MaterialStateProperty.all(Color(int.parse(menuPage?.body.itemsList.addButton.backGroundColor as String))),
                                            // backgroundColor: MaterialStateProperty.all(Colors.amber.shade300.withOpacity(0.3)),
                                            foregroundColor: MaterialStateProperty
                                                .all(Colors.black),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(0)),
                                            textStyle: MaterialStateProperty
                                                .all(
                                                const TextStyle(fontSize: 30))),
                                        child:  Text(
                                          menuPage?.body.itemsList.addButton.data as String,
                                          style: TextStyle(
                                              color: Color(int.parse( menuPage?.body.itemsList.addButton.color as String)),
                                              fontSize: lng?.header3.size.toDouble(),
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(Icons.add, size: 10,),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// - Pluse & minuse
                    Visibility(
                      visible: alreadyExist,
                      child: Positioned(
                        bottom: 13,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Color(int.parse(menuPage?.body.itemsList.quantity.backGroundColor as String)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              // border: Border.all(
                              //   width: 0.8,
                              //   color: Colors.white,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,

                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            (Localizations
                                                .localeOf(context)
                                                .languageCode == 'en') ?
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      10),
                                                  topLeft: Radius.circular(10),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.transparent)
                                            ) :
                                            (Localizations
                                                .localeOf(context)
                                                .languageCode == 'ar') ?
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.transparent)
                                            ) :
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      10),
                                                  topLeft: Radius.circular(10),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.transparent)
                                            )
                                        ),
                                        elevation: MaterialStateProperty.all(0),
                                        shadowColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        backgroundColor: MaterialStateProperty.all(Color(int.parse(menuPage?.body.itemsList.plusMinus.backGroundColor as String))),
                                        foregroundColor: MaterialStateProperty
                                            .all(Colors.black),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(0)),
                                        textStyle: MaterialStateProperty.all(
                                            TextStyle(fontSize: 30))),
                                    child:  Icon(Icons.remove, size: 18,color: Color(int.parse(menuPage?.body.itemsList.plusMinus.iconColor as String )),),
                                  ),
                                ),


                                (value.cartItems.isEmpty) ?
                                const SizedBox(width: 30,
                                  child: Text(
                                    "0", textAlign: TextAlign.center,),) :
                                SizedBox(width: 30,
                                  child: Text(
                                      "${value.cartItems[0].itemQuantity}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),),



                                SizedBox(
                                  width: 30,
                                  height: 30,

                                  child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          useSafeArea: true,
                                          isScrollControlled: true,
                                          // expand: false,
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) =>
                                              DraggableScrollableSheet(
                                                  initialChildSize: 0.33,
                                                  minChildSize: 0.3,
                                                  maxChildSize: 0.4,
                                                  expand: true,
                                                  builder: (context,
                                                      scrollController) {
                                                    return RepeatLastCustomizationSheet(
                                                        layOut: widget.layOut,
                                                        scrollController: scrollController);
                                                  }

                                              )
                                      );
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            (Localizations
                                                .localeOf(context)
                                                .languageCode == 'en') ?
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.transparent)
                                            ) :
                                            (Localizations
                                                .localeOf(context)
                                                .languageCode == 'ar') ?
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      10),
                                                  topLeft: Radius.circular(10),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.transparent)
                                            ) :
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.transparent)
                                            )
                                        ),
                                        elevation: MaterialStateProperty.all(0),
                                        shadowColor: MaterialStateProperty.all(
                                            Colors.transparent),
                                        backgroundColor: MaterialStateProperty.all(Color(int.parse(menuPage?.body.itemsList.plusMinus.backGroundColor as String))),
                                        foregroundColor: MaterialStateProperty
                                            .all(Colors.black),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(0)),
                                        textStyle: MaterialStateProperty.all(
                                            TextStyle(fontSize: 30))),
                                    child:  Icon(Icons.add, size: 18,color: Color(int.parse(menuPage?.body.itemsList.plusMinus.iconColor as String )),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              );
            });

          });


  }
}
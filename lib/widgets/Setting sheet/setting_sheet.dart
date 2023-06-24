import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/Setting%20sheet/list_of_languages.dart';

import 'language_setting_sheet.dart';

class SettingSheet extends StatefulWidget{
  ScrollController? scrollController;
  SettingSheet({super.key,this.scrollController});

  @override
  State<SettingSheet> createState() => _SettingSheetState();
}

class _SettingSheetState extends State<SettingSheet> {
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)
                )
            ),
            padding: const EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //     loyaltyPaymentSheet.sheetTile.data,
                      //     style: TextStyle(
                      //         fontFamily: lng?.header3.textFamily,
                      //         fontSize: lng?.header3.size.toDouble(),
                      //         fontWeight: FontWeight.w400,
                      //         color: Color(int.parse(loyaltyPaymentSheet.sheetTile.color))
                      //     )),
                      Text(
                          getTranslated(context, "SettingSheetTitle")!,
                          style: TextStyle(
                              fontFamily: getTranslated(context, "fontFamilyBody")!,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.amber
                          )),

                      // IconButton(
                      //     onPressed: () {
                      //       Navigator.pop(context);
                      //     },
                      //     icon: ImageIcon(
                      //       NetworkImage(loyaltyPaymentSheet.sheetCloseIcon.imageIcon),
                      //       size: double.parse(loyaltyPaymentSheet?.sheetCloseIcon.mobileSize as String),
                      //       color: Colors.white,
                      //     )
                      // ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close, color: Colors.white,)),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey,),
                ListTile(
                  dense: false,
                 onTap: (){

                   showModalBottomSheet(
                     // expand: false,
                       context: context,
                       backgroundColor: Colors
                           .transparent,
                       builder: (context) =>
                           DraggableScrollableSheet(
                               initialChildSize: 0.5,
                               minChildSize: 0.3,
                               maxChildSize: 1,
                               expand: true,
                               builder: (context,
                                   scrollController) {
                                 return LanguageSettingSheet(scrollController: scrollController);
                               }

                           )
                   );

                 },
                  tileColor: Colors.white,
                  title:
                  // Text(loyaltyPaymentSheet.selectPaymentTitle.data,
                  //   style: TextStyle(
                  //       fontSize: lng?.header3.size.toDouble(),
                  //       fontFamily: lng?.header3.textFamily,
                  //       color: Color(int.parse(loyaltyPaymentSheet.selectPaymentTitle.color)),
                  //       fontWeight: FontWeight.bold
                  //   ),),
                  Text(
                    getTranslated(context, "language")!,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: getTranslated(context, "fontFamilyBody")!,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold
                    ),),
                  leading: Icon(Icons.public, color: Colors.white60,),
                  trailing:
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              getTranslated(context, "languageName")!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: getTranslated(context, "fontFamilyBody")!,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold
                              ),),
                            Icon(Icons.arrow_forward_ios, color: Colors.white,),
                          ],
                        ),
                      )

                  // subtitle:Text("perfect for shharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),

                ),




              ],
            ),

          ),
        ),

      );
  }
}
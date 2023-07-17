import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/widgets/image_with_add_button.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/MenuPage/menu_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class CustomListTile extends StatelessWidget{
  final String layOut ;
  const CustomListTile({super.key,required this.layOut});

  @override
  Widget build(BuildContext context) {
  return  Consumer<ThemeProvider>(
        builder: (context, appTheme, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      MenuPage? menuPage = appTheme.appTheme.designPerPage?.menuPage;
      bool loadingDesign = menuPage != null;

            return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          /// -  Image & add button
          ImageWithAddButton(layOut: layOut,),

          const SizedBox(width: 5,),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText("Chicken Fatteh", style: TextStyle(
                      fontFamily: lng?.header5.textFamily,
                      color: Color(int.parse(menuPage?.body.itemsList.itemTitle.color as String)),
                      fontSize: lng?.header5.size.toDouble(),
                      fontWeight: FontWeight.w300),),
                  // MyText("Chicken Fatteh", style: TextStyle(
                  //     fontFamily: getTranslated(context, "fontFamilyBody")!,
                  //     color: Colors.amber,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.w300),),
                  MyText(
                    "Chicken topped with rice, fatteh yogurt,fried bread,pine nuts,sumac. parsley and gheee.",
                    style: TextStyle(
                        fontFamily: lng?.header3.textFamily,
                        color: Color(int.parse(menuPage?.body.itemsList.itemSubTitle.color as String)),
                        fontSize: lng?.header3.size.toDouble(),
                        fontWeight: FontWeight.w300),
                    // TextStyle(
                    //   fontSize: 15,
                    //   color: Colors.white,
                    //   fontFamily: getTranslated(context, "fontFamilyBody")!,),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyText(
                        "AED 44", style: TextStyle(
                          fontFamily: lng?.header5.textFamily,
                          color: Color(int.parse(menuPage?.body.itemsList.totalPrice.color as String)),
                          fontSize: lng?.header5.size.toDouble(),
                          fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


        ],
      );
    });
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

import 'list_of_languages.dart';

class LanguageSettingSheet extends StatelessWidget{
  ScrollController scrollController;

  LanguageSettingSheet({super.key,required this.scrollController});
  @override
  Widget build(BuildContext context) {
       return Container(
         decoration: const BoxDecoration(
             color: Colors.black87,
             borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(8),
                 topRight: Radius.circular(8)
             )
         ),
         padding: const EdgeInsets.all(8),
         height: MediaQuery.of(context).size.height / 3,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             /// - Title
             Padding(
               padding: const EdgeInsets.only(top:8.0, left: 8, right: 8),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                       getTranslated(context, "language")!,
                       style: TextStyle(
                           fontFamily:  getTranslated(context, "fontFamilyBody")!,
                           fontSize: 20,
                           fontWeight: FontWeight.w400,
                           color: Colors.amber
                       )),
                   IconButton(
                       onPressed: () {
                         Navigator.of(context).pop();
                       },
                       icon: Icon(Icons.close, color: Colors.white,)),
                 ],
               ),
             ),



             Padding(
               padding:  EdgeInsets.all(8.0),
               child: Text( getTranslated(context, "selectLanguage")!, style: TextStyle(color: Colors.amber,fontSize: 15, fontWeight: FontWeight.w300,fontFamily:  getTranslated(context, "fontFamilyBody")!),),
             ),

             ListOfLanguages(scrollController: scrollController, selectedLanguage: Localizations.localeOf(context).languageCode.toString()),

           ],
         ),
       );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/my_text_form_field.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class SearchAnchorPage extends StatefulWidget{
  @override
  State<SearchAnchorPage> createState() => _SearchAnchorPageState();
}

class _SearchAnchorPageState extends State<SearchAnchorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900.withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new,color: Colors.grey.shade200,), onPressed: (){Navigator.pop(context);},),
        title: MyTextFormField(
          // controller: profileProvider.nameController,
          // enabled: s,
          autofocus: true,
          style: TextStyle(color: Colors.white, fontFamily: getTranslated(context, "fontFamilyBody")!,),
          cursorColor: Colors.amber,
          decoration: InputDecoration(

            filled: true,
            fillColor: Colors.transparent,
            contentPadding:const EdgeInsets.only(left: 10, right: 10),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              // (Localizations.localeOf(context).languageCode == 'ar') ?

              const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                 topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ) ,
              //     :
              // (Localizations.localeOf(context).languageCode == 'en') ?
              // const BorderRadius.only(
              //   bottomRight: Radius.circular(10),
              //   topRight: Radius.circular(10),
              // ) :
              // const BorderRadius.only(
              //   bottomLeft: Radius.circular(10.0),
              //   topLeft: Radius.circular(10.0),
              // ),
              // borderSide: BorderSide(
              //   color: Colors.transparent,
              //   width: 1.0,),

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
              // (Localizations.localeOf(context).languageCode == 'ar') ?

              const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ) ,
              //     :
              // (Localizations.localeOf(context).languageCode == 'en') ?
              // const BorderRadius.only(
              //   bottomRight: Radius.circular(10),
              //   topRight: Radius.circular(10),
              // ) :
              // const BorderRadius.only(
              //   bottomLeft: Radius.circular(10.0),
              //   topLeft: Radius.circular(10.0),
              // ),
              // borderSide: BorderSide(
              //   color: Colors.transparent,
              //   width: 1.0,),

            ),
            disabledBorder:OutlineInputBorder(
              borderRadius:
              // (Localizations.localeOf(context).languageCode == 'ar') ?

              const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ) ,
              //     :
              // (Localizations.localeOf(context).languageCode == 'en') ?
              // const BorderRadius.only(
              //   bottomRight: Radius.circular(10),
              //   topRight: Radius.circular(10),
              // ) :
              // const BorderRadius.only(
              //   bottomLeft: Radius.circular(10.0),
              //   topLeft: Radius.circular(10.0),
              // ),
              // borderSide: BorderSide(
              //   color: Colors.transparent,
              //   width: 1.0,),

            ),
            hintText: '',

            // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

          ),

          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter Search';
            }
            return null;
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.all(18),
                  itemBuilder: (context , index){

                return
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity(vertical: -4), // to expand
                    contentPadding: EdgeInsets.zero,
                    onTap: (){print("test");},
                    title:MyText("Classic Falafel (4pcs)", style: TextStyle(color: Colors.white70, fontSize: 12, fontFamily: getTranslated(context, "fontFamilyBody")!,),),
                  )


                ;
              }, separatorBuilder: (context, index){
                return Divider(color: Colors.white,);
              }, itemCount: 15)
          ),
        ],
      ),
    );
  }
}
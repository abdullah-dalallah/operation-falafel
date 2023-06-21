import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/AddNewCardPage/add_new_card_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:provider/provider.dart';

class AddNewCard extends StatefulWidget{
  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  @override
  Widget build(BuildContext context) {

    return Consumer2<ThemeProvider, ProfileProvider>(builder: (context, appTheme,profileProvider, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      AddNewCardPage? addNewCardPage = appTheme.appTheme.designPerPage?.addNewCardPage;
      bool loadingDesign = addNewCardPage != null;


      return Stack(
        children: [
          Background(),
          Scaffold(backgroundColor: Colors.transparent,
            appBar:  AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(addNewCardPage!.appBar!.backIcon!.imageIcon),
                  size: double.parse(addNewCardPage.appBar!.backIcon!.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(addNewCardPage!.appBar!.backIcon!.imageIcon),
                  size: double.parse(addNewCardPage?.appBar!.backIcon!.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                addNewCardPage.appBar!.title!.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Form(
              key: _formKey,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 450,),
                  child: Column(
                    children: [
                      Text(
                        addNewCardPage.body!.pageTitle!.data,
                        style: TextStyle(
                            fontFamily:lng?.titleHeader2.textFamily,
                            color: Color(int.parse(addNewCardPage.body!.pageTitle!.color)),
                            fontSize: lng?.titleHeader2.size.toDouble()
                        ),
                      ),

                      Expanded(
                        child: ListView(
                          children: [
                            const SizedBox(height: 15,),
                            Image.network(addNewCardPage.body!.pageImage!, height: 200,),
                            // Image.asset("assets/images/of_logo.png", height: 200,),
                            const SizedBox(height: 15,),
                            /// -  Card Number
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(19),
                                  CardNumberInputFormatter(),
                                ],
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black45,
                                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent, width: 1.0,),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0.0),
                                  ),
                                  hintText: addNewCardPage.body!.form!.cardNumber!.data,
                                  hintStyle: TextStyle(
                                      fontFamily: "${lng?.header3.textFamily}",
                                      color: Color(int.parse(addNewCardPage.body!.form!.cardNumber!.color)),
                                      fontSize:lng?.header3.size.toDouble()
                                  ),


                                ),

                              ),
                            ),

                            /// - Card Holder Name
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                              child: TextFormField(
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black45,
                                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent, width: 1.0,),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 0.0),
                                  ),
                                  hintText: addNewCardPage.body!.form!.cardHolderName!.data,
                                  hintStyle: TextStyle(
                                      fontFamily: "${lng?.header3.textFamily}",
                                      color: Color(int.parse(addNewCardPage.body!.form!.cardNumber!.color)),
                                      fontSize:lng?.header3.size.toDouble()
                                  ),


                                ),

                              ),
                            ),

                            /// CVV & Expiry Date
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: const EdgeInsets.only(left: 10, right: 10),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent, width: 1.0,),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.transparent, width: 0.0),
                                        ),
                                        hintText: addNewCardPage.body!.form!.cvv!.data,
                                        hintStyle: TextStyle(
                                            fontFamily: "${lng?.header3.textFamily}",
                                            color: Color(int.parse(addNewCardPage.body!.form!.cvv!.color)),
                                            fontSize:lng?.header3.size.toDouble()
                                        ),


                                      ),

                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  Expanded(
                                    flex: 3,
                                    child:TextFormField(
                                      keyboardType: TextInputType.datetime,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(5),
                                        CardMonthInputFormatter(),
                                      ],
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: const EdgeInsets.only(left: 10, right: 10),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent, width: 1.0,),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.transparent, width: 0.0),
                                        ),
                                        hintText: addNewCardPage.body!.form!.expiryDate!.data,
                                        hintStyle: TextStyle(
                                            fontFamily: "${lng?.header3.textFamily}",
                                            color: Color(int.parse(addNewCardPage.body!.form!.expiryDate!.color)),
                                            fontSize:lng?.header3.size.toDouble()
                                        ),


                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),

                      /// - Save Card
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18,  bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                      onPressed: () {



                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all<Color>(Colors.amber),
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(Color(int.parse(addNewCardPage.body!.addNewCardButton!.backGroundColor))),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(0.0),
                                                side: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.5)
                                            )
                                        ),
                                      ),
                                      child:Text(addNewCardPage.body!.addNewCardButton!.data,
                                        style: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(addNewCardPage.body!.addNewCardButton!.color)),
                                            fontSize: lng?.header3.size.toDouble()
                                        ),
                                      )

                                  ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),

          ),
        ],
      );
    });
  }




  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerAddressLine = TextEditingController();
  TextEditingController _controllerBuildingName = TextEditingController();
  TextEditingController _controllerFlatNumber = TextEditingController();
}


class CardNumberInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    if(newValue.selection.baseOffset == 0){
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for(var i=0; i<inputData.length;i++){
      buffer.write(inputData[i]);
      int index =i+1;
      if(index%4 == 0 && inputData.length !=index){
        buffer.write("-");
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length)
    );
  }

}


class CardMonthInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    if(newValue.selection.baseOffset == 0){
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for(var i=0; i<inputData.length;i++){
      buffer.write(inputData[i]);
      int index =i+1;
      if(index%2 == 0 && inputData.length !=index){
        buffer.write("/");
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length)
    );
  }

}
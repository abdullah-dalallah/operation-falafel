import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/AddNewCardPage/add_new_card_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:provider/provider.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';

class AddNewCard extends StatefulWidget{
  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {

  var types ="";
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
                                controller: cardNumberController,
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
                                  suffix:  buildCardType(types),

                                ),
                                onChanged: (value){
                                  if(value.isNotEmpty) {
                                    setState(() {
                                      if (detectCCType(value).isNotEmpty) {
                                        print(detectCCType(value)[0].type);
                                        types = detectCCType(value).first.type;
                                      }
                                    });
                                  }else{
                                    setState(() {
                                      types ='';
                                    });
                                  }

                                },
                                validator: (value) {
                                 return _validateCardNumber( value);

                                },
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter card holder name';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            /// CVV & Expiry Date
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                       validator:(value) {
                                        if(!_isValidCVV(value!)){
                                          return 'Invalid CVV number';
                                        }
                                        else{

                                        }
                                       },
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
                                      validator:(value) {
                                       if(_isValidExpiryDate(value!)){

                                       }
                                       else{
                                         return 'Invalid expiry date';

                                       }
                                      },
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

                                        _submitForm();

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



  var separator = '-';
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController cardNumberController = TextEditingController();
  TextEditingController _controllerBuildingName = TextEditingController();
  TextEditingController _controllerFlatNumber = TextEditingController();



  Widget buildCardType(String cardType){
    switch(cardType){
      case "visa":{  return Image.asset("assets/images/visa_logo_card.png", height: 20,color: Colors.white,);}break;
      case "mastercard":{  return Image.asset("assets/images/masterCard_logo.png", height: 20,color: Colors.white,);}break;
      case "discover":{  return Image.asset("assets/images/discover_logo1.png", height: 20,);}break;
      case "american_express":{return Image.asset("assets/images/american_express_logo.png", height: 20,color: Colors.white,);}break;
      case "jcb":{return Image.asset("assets/images/jcb_card.png", height: 20,color: Colors.white,);}break;
      case "unionpay":{return Image.asset("assets/images/unionPay_logo.png", height: 20,color: Colors.white,);}break;

      default:{
        return SizedBox();
      }
    }
  }

  bool validateCardNumber(String cardNumber) {
    print(cardNumber);
    String cleanedNumber = cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), '');
    int sum = 0;
    bool isAlternate = false;

    for (int i = cleanedNumber.length - 1; i >= 0; i--) {
      int? digit = int.tryParse(cleanedNumber[i]);
      if (digit == null) {
        return false;
      }
      if (isAlternate) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
      isAlternate = !isAlternate;
    }
    print(sum % 10 == 0);
    return sum % 10 == 0;
  }
  String? _validateCardNumber(String? value) {
    print(value);

    if (value == null || value.isEmpty || value =='') {
      return 'Please enter a card number';
    }

    // String cleanedNumber = value.replaceAll(RegExp(r'\s+\b|\b\s'), '');
    var cleanCardNumber = value.replaceAll(separator, '');
    bool isValid = _validateLuhn(cleanCardNumber);



    return isValid ? null : 'Invalid card number';
  }

  bool _validateLuhn(String cardNumber) {
    List<int> digits = cardNumber
        .split('')
        .map(int.parse)
        .toList()
        .reversed
        .toList();

    int sum = 0;
    for (int i = 0; i < digits.length; i++) {
      if (i % 2 == 1) {
        int doubled = digits[i] * 2;
        digits[i] = doubled > 9 ? doubled - 9 : doubled;
      }
      sum += digits[i];
    }

    return sum % 10 == 0;
  }
  bool _isValidCVV(String cvv) {
    // Implement your CVV validation logic here
    // Return true if the CVV is valid, false otherwise
    // You can modify this logic according to your requirements
    return cvv.length == 3;
  }

  bool _isValidExpiryDate(String expiryDate) {
    // Implement your expiry date validation logic here
    // Return true if the expiry date is valid, false otherwise
    // You can modify this logic according to your requirements
    RegExp regExp = RegExp(r'^\d{2}/\d{2}$');
    if (!regExp.hasMatch(expiryDate)) {
      return false;
    }
    List<String> parts = expiryDate.split('/');
    int? month = int.tryParse(parts[0]);
    int? year = int.tryParse(parts[1]);
    if (month == null || year == null) {
      return false;
    }
    if (month < 1 || month > 12) {
      return false;
    }

    // Get the current date
    DateTime currentDate = DateTime.now();
    int currentYear = currentDate.year % 100; // Get the last two digits of the year

    // Assuming the current year is 2023, modify this logic accordingly
    if (year < currentYear || (year == currentYear && month < currentDate.month)) {
      return false;
    }

    return true;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform your registration logic here
      // You can use the collected form data to create a new user account or make an API call


    }
  }

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
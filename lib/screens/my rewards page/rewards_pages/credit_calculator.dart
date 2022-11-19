import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class CreditCalculator extends StatefulWidget{
  @override
  State<CreditCalculator> createState() => _CreditCalculatorState();
}

class _CreditCalculatorState extends State<CreditCalculator> {

  TextEditingController amountController =new TextEditingController();
  TextEditingController earnedCreditsController =new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(

          backgroundColor: Colors.transparent,
          appBar:AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:
              (Localizations.localeOf(context).languageCode=='en')?
              const ImageIcon(
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ):
              const ImageIcon(
                AssetImage("assets/images/back_arabic.png",),
                size: 35,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            actions: [],
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(height: 25,),
                        /// - Title
                        Text(getTranslated(context, "creditCalculator")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),textAlign: TextAlign.center,),
                        SizedBox(height: 25,),

                        /// - enterAmount
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  // width: 295,
                                  height: 50,
                                  child:   TextField(
                                    controller: amountController,
                                    keyboardType: TextInputType.number,
                                    autofocus: false,
                                    style:const TextStyle(color: Colors.white70),
                                    decoration:  InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      contentPadding:const EdgeInsets.only(left:10,right: 10 ),
                                      focusedBorder:const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.only(
                                          bottomLeft:  Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomRight:     Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),



                                        borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                      ),
                                      enabledBorder:const OutlineInputBorder(
                                        borderRadius:  const BorderRadius.only(
                                          bottomLeft:  Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomRight:     Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                      ),
                                      hintText: getTranslated(context, "enterAmount")!,
                                      hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

                                    ),
                                   onChanged: (value){
                                      if(value.isNotEmpty){
                                        earnedCreditsController.text = (double.parse(value)*0.15).toString();
                                      }else{
                                        earnedCreditsController.text ="";
                                      }
                                   },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const  SizedBox(height: 25,),
                        Image.asset("assets/images/arrow_down.png", height: 100,),
                        const  SizedBox(height: 25,),
                        /// - earned credits
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  // width: 295,
                                  height: 50,
                                  child:   TextField(
                                    controller: earnedCreditsController,
                                    enabled: false,
                                    keyboardType: TextInputType.number,
                                    autofocus: false,
                                    style:const TextStyle(color: Colors.white70),
                                    decoration:  InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black,
                                      contentPadding:const EdgeInsets.only(left:10,right: 10 ),
                                      border: const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.only(
                                          bottomLeft:  Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomRight:     Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),



                                        borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                      ),
                                      focusedBorder:const OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.only(
                                          bottomLeft:  Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomRight:     Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),



                                        borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:  const BorderRadius.only(
                                          bottomLeft:  Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomRight:     Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                      ),
                                      hintText: getTranslated(context, "earned credits")!,
                                      hintStyle:TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),

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



                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/checkbox_option.dart';
import 'package:operation_falafel/widgets/register_checkbox.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../profile/logged_in_user_profile.dart';

class Register extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const Register(this.onChanged,{super.key,required this.layOut});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  void initState() {
    super.initState();
    // Get the language set as default on the users phone
    // String? systemCountryCode = window.locale.countryCode;
    countryCode= CountryCode(code: "AE",name: "United Arab Emirates",dialCode: "+971" );


  }


  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args, ) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        print("Date range");
        // showDatePicker = false;

      }
      else if (args.value is DateTime) {

        _selectedDate = DateFormat('dd/MM/yyyy').format(args.value).toString();
        // showDatePicker = false;
        print("DateTime");
        birthDateController.text = _selectedDate;
      }
      else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
        // birthDateController.text = _selectedDate;
        // print("List DateTime");
        // showDatePicker = false;
      }
      else {
        _rangeCount = args.value.length.toString();
        // birthDateController.text = _selectedDate;
        // print("default");
        // showDatePicker = false;
      }
    });
  }

  bool showDatePicker = false;

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, __, ___) {
        return Center(
          child: Container(
            height: 450,
            constraints: BoxConstraints(maxWidth: 450, ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: SizedBox.expand(
              child: SfDateRangePicker(
                navigationMode: DateRangePickerNavigationMode.snap,
                allowViewNavigation: true,
                monthViewSettings:const DateRangePickerMonthViewSettings(weekNumberStyle: DateRangePickerWeekNumberStyle(textStyle: TextStyle(color:Colors.white,backgroundColor: Colors.white)),viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: TextStyle(color:Colors.white))),
                showActionButtons: true,
                onSubmit: (value){

                  DateTime tempValue =value as DateTime;
                  if(tempValue!=null){
                    _selectedDate = DateFormat('dd/MM/yyyy').format(tempValue).toString();
                    // showDatePicker = false;
                    print("DateTime");
                    birthDateController.text = _selectedDate;


                    Navigator.pop(context);
                  }},
                onCancel: (){ Navigator.pop(context);},
                backgroundColor: Colors.black,
                todayHighlightColor: Colors.amber,
                startRangeSelectionColor: Colors.amber,
                endRangeSelectionColor: Colors.amber,
                rangeSelectionColor: Colors.amber,
                selectionColor: Colors.amber,
                headerStyle: DateRangePickerHeaderStyle(textStyle: TextStyle(color:Colors.white),backgroundColor: Colors.black,textAlign: TextAlign.center),
                monthCellStyle: DateRangePickerMonthCellStyle(textStyle: TextStyle(color:Colors.white),blackoutDateTextStyle: TextStyle(color:Colors.white), todayTextStyle:TextStyle(color:Colors.white),leadingDatesTextStyle: TextStyle(color:Colors.white),weekendTextStyle:  TextStyle(color:Colors.grey),disabledDatesTextStyle: TextStyle(color:Colors.white),trailingDatesTextStyle: TextStyle(color:Colors.white),specialDatesTextStyle: TextStyle(color:Colors.white),),
                yearCellStyle: DateRangePickerYearCellStyle(textStyle: TextStyle(color:Colors.white),disabledDatesTextStyle: TextStyle(color:Colors.white), todayTextStyle:TextStyle(color:Colors.white),leadingDatesTextStyle: TextStyle(color:Colors.white), ),
                selectionTextStyle: TextStyle(color:Colors.white),
                rangeTextStyle: TextStyle(color:Colors.white),
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.single,
                initialDisplayDate:(_selectedDate!='')?DateFormat('dd/MM/yyyy').parse(_selectedDate):DateTime.now().subtract(const Duration(days: 0)),
                initialSelectedDate: (_selectedDate!='')?DateFormat('dd/MM/yyyy').parse(_selectedDate):DateTime.now().subtract(const Duration(days: 0)),//(_selectedDate!='')?DateFormat('dd/MM/yyyy').parse(_selectedDate):
                // initialSelectedRange: PickerDateRange(DateTime.now().subtract(const Duration(days: 4)), DateTime.now().add(const Duration(days: 3))),
              ),),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        }
        else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }



  TextEditingController birthDateController = new TextEditingController();


  final List<String> gender = [
    "male",
    "female",

  ];
  dynamic? selectedValue;

  bool checkboxBool = false;
  ValueChanged _valueChangedHandler() {
    return (value) => setState(() {
      print(value);

      checkboxBool = true;


    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(image:AssetImage( "assets/images/background.png",),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
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
          // centerTitle: true,
          // title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
          // actions: [],
        ),
        body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(getTranslated(context, "register")!, style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons"),color: Colors.amber,fontSize:double.parse( getTranslated(context, "enterOfTitleSize")!),height: 0.8),textAlign: TextAlign.center,),
                  const SizedBox(height: 25,),
                  /// - Form
                  Expanded(
                    child: ListView(
                      // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        /// - Name
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:0, right: 0),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              // border: Border.all(
                              //   width: 0,
                              //   color: Colors.transparent,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              children: [
                                Expanded( flex:2, child: Text("${getTranslated(context, "name")!}*", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),

                                const  Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   TextField(

                                      autofocus: false,
                                      style:  TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: EdgeInsets.only(left:10, right: 10),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                        ),
                                        hintText: '',
                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),

                        /// - Phone number
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:0, right: 0),

                            decoration:const BoxDecoration(
                              color: Colors.transparent,

                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              // border: Border.all(
                              //   width: 0,
                              //   color: Colors.transparent,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:5, child: Padding(
                                  padding: const EdgeInsets.only(left:0, right: 0),
                                  child: Text("${getTranslated(context, "mobileNo")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),),
                                )),

                                Expanded(
                                  flex:10,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black45,

                                      borderRadius:

                                      (Localizations.localeOf(context).languageCode=='en')?
                                      const BorderRadius.only(
                                        bottomLeft:  Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                      ):
                                      (Localizations.localeOf(context).languageCode=='ar')?
                                      const BorderRadius.only(
                                        bottomRight:     Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ):
                                      const BorderRadius.only(
                                        bottomLeft:  Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0),
                                      ),

                                      // border: Border.all(
                                      //   width: 0,
                                      //   color: Colors.transparent,
                                      //   style: BorderStyle.solid,
                                      // ),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Expanded(
                                            flex:2,
                                            child: Padding(
                                                padding: const EdgeInsets.only(left:0, right:0),
                                                child: IconButton(
                                                  icon:
                                                  countryCode!=null?
                                                  SizedBox(width: 30,height: 30, child: countryCode!.flagImage)
                                                      :const Icon(Icons.flag_outlined),
                                                  padding: EdgeInsets.zero,
                                                  onPressed: () async {

                                                    final code = await countryPicker.showPicker(context: context,initialSelectedLocale: "AE");
                                                    if (code != null) {
                                                      setState((){
                                                        countryCode =code;
                                                      });


                                                    };
                                                  },)
                                            )),
                                        const Expanded(
                                          flex: 8,
                                          child: SizedBox(

                                            child:   TextField(
                                              keyboardType: TextInputType.number,
                                              autofocus: false,
                                              style:  TextStyle(color: Colors.white),
                                              decoration:  InputDecoration(
                                                filled: true,
                                                fillColor: Colors.transparent,
                                                contentPadding: EdgeInsets.only(left:10, right: 10),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius:  BorderRadius.all(
                                                    Radius.circular(0.0),
                                                  ),
                                                  borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius:  BorderRadius.all(
                                                    Radius.circular(0.0),
                                                  ),
                                                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                                ),
                                                hintText: '',

                                                // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                              ),

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Expanded(

                                  flex: 3,
                                  child: SizedBox(
                                      height: 50,
                                      child: Container(
                                        decoration:  BoxDecoration(
                                          borderRadius:

                                          (Localizations.localeOf(context).languageCode=='en')?
                                          const BorderRadius.only(
                                            bottomRight:     Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ):
                                          (Localizations.localeOf(context).languageCode=='ar')?
                                          const BorderRadius.only(
                                            bottomLeft:  Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                          ):
                                          const BorderRadius.only(
                                            bottomRight:     Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),






                                          color: Colors.amber,
                                          // border: Border.all(
                                          //   width: 0.8,
                                          //   color: Colors.white,
                                          //   style: BorderStyle.solid,
                                          // ),
                                        ),
                                        child: Icon(Icons.check, color: Colors.white,),
                                      )
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - email address
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:0, right: 0),
                            decoration:const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              // border: Border.all(
                              //   width: 0,
                              //   color: Colors.transparent,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "emailAddress")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const   Expanded(
                                  flex:5,
                                  child: SizedBox(

                                    child:   TextField(

                                      autofocus: false,
                                      style:  TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: EdgeInsets.only(left:10, right: 10),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                        ),
                                        hintText: '',

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - Password
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:0, right: 0),
                            decoration:const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              // border: Border.all(
                              //   width: 0,
                              //   color: Colors.transparent,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "password")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const Expanded(
                                  flex: 5,
                                  child:  SizedBox(
                                    child:   TextField(
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      autofocus: false,
                                      style:  TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: EdgeInsets.only(left:10, right: 10),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                        ),

                                        hintText: '',
                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - date of birth
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:0, right: 0),
                            decoration:const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              // border: Border.all(
                              //   width: 0,
                              //   color: Colors.transparent,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "dateOfBirth")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(

                                    child:   Stack(
                                      children: [
                                        TextField(
                                          controller: birthDateController,
                                          enabled: false,
                                          autofocus: false,
                                          style: const TextStyle(color: Colors.white),

                                          decoration:  const InputDecoration(
                                            filled: true,
                                            fillColor: Colors.black45,
                                            contentPadding: EdgeInsets.only(left:10, right: 10),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:  BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              // borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:  BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:  BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              // borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                            ),
                                            hintText: '',
                                            // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                          ),

                                        ),
                                        Positioned.fill(
                                            child:  Material(
                                              color: Colors.transparent,
                                              child:  new InkWell(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                splashColor: Colors.black,
                                                overlayColor: MaterialStateProperty.all<Color>(Colors.white60),

                                                onTap: (){

                                                  showCustomDialog(context);

                                                  setState(() {
                                                    // showDatePicker =true;
                                                  });

                                                },
                                              ),

                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - Nationality
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:0, right: 0),
                            decoration:const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              // border: Border.all(
                              //   width: 0,
                              //   color: Colors.transparent,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "nationality")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                const   Expanded(
                                  flex:5,
                                  child: SizedBox(

                                    child:   TextField(

                                      autofocus: false,
                                      style:  TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: EdgeInsets.only(left:10, right: 10),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                        ),
                                        hintText: '',

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        /// - gender
                        Padding(
                          padding: const EdgeInsets.only(left:18.0, right: 18),
                          child: Container(
                            padding: const EdgeInsets.only(left:0, right: 0),
                            decoration:const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              // border: Border.all(
                              //   width: 0,
                              //   color: Colors.transparent,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex:2, child: Text("${getTranslated(context, "gender")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                    child: DropdownButtonFormField2(

                                      scrollbarAlwaysShow: true,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        //Add isDense true and zero Padding.
                                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                        isDense: true,
                                        fillColor: Colors.black45,
                                        filled: true,
                                        contentPadding: EdgeInsets.only(),
                                        // border: OutlineInputBorder(
                                        //   borderSide: const BorderSide(color: Colors.green, width: 40.0, style: BorderStyle.solid ),
                                        //   borderRadius: BorderRadius.circular(10),
                                        //
                                        // ),
                                        focusColor: Colors.transparent,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 2.0, ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:  BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                                        ),

                                        //Add more decoration as you want here
                                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                      ),
                                      isExpanded: true,
                                      hint:  Text(
                                        getTranslated(context, "selectGender")!,
                                        style: TextStyle(fontSize: 16, color: Colors.white60 ,fontFamily: getTranslated(context, "fontFamilyBody")!),
                                      ),

                                      icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                      // const Icon(
                                      //   Icons.arrow_drop_down,
                                      //   color: Colors.white60,
                                      // ),
                                      iconSize: 30,
                                      buttonHeight: (selectedValue!=null)?50:50,
                                      buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                                      dropdownDecoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      itemHeight: 30,

                                      items: gender
                                          .map((gender) =>
                                          DropdownMenuItem<dynamic>(
                                            value: gender,
                                            child:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Row(
                                                  children: [

                                                    (selectedValue!=null)?
                                                    (selectedValue==gender)?
                                                    Image.asset("assets/images/page2_icon.png", height: 15,width: 15,) :SizedBox(width: 15,):SizedBox(width: 15,),
                                                    SizedBox(width: 5,),
                                                    Text(getTranslated(context, gender)!, style:  TextStyle(fontSize: 13,color: Colors.white, fontFamily: getTranslated(context, "fontFamilyBody")!),
                                                    ),
                                                  ],
                                                ),




                                              ],
                                            ),





                                          ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select gender.';
                                        }
                                      },
                                      onChanged: (value) {
                                        //Do something when changing the item if you want.
                                        setState((){
                                          selectedValue = value;
                                        });

                                      },
                                      onSaved: (value) {
                                        setState((){
                                          selectedValue = value;
                                        });
                                      },
                                    ),




                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: RegisterCheckbox(
                            value: checkboxBool,
                            onChanged:_valueChangedHandler(),
                            label: '1',
                            text: "accpetterms",
                            addOnFlag: false,
                            colorOfBox: Colors.white,
                            colorOfText: Colors.white,
                          ),
                        ),

                        /// - Submit button
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration:const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  // border: Border.all(
                                  //   width: 0.5,
                                  //   color: Colors.white,
                                  //   style: BorderStyle.solid,
                                  // ),
                                ),
                                child:const Icon(Icons.check, color:Colors.white,),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration:const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  // border: Border.all(
                                  //   width: 0.5,
                                  //   color: Colors.white,
                                  //   style: BorderStyle.solid,
                                  // ),
                                ),
                                // child:Icon(Icons.check, color:Colors.white,),
                              ),
                              Positioned(
                                bottom:8,
                                right:9,

                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:const BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      topLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child:const Icon(Icons.check, color:Colors.white,size: 30,),
                                ),
                              ),

                               Positioned.fill(
                                  child:  Material(
                                    color: Colors.transparent,
                                    child:   InkWell(
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      splashColor: Colors.black45,
                                      overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                      onTap: (){
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: LoggedInUserProfile(layOut: widget.layOut,(value) {widget.onChanged(value);}),
                                          withNavBar: true, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                        );
                                      },
                                    ),

                                  )
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
    );
  }
}
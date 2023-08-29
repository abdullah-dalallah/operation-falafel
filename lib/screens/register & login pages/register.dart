import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/my_text_form_field.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/data/strings.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/widgets/checkbox_option.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:operation_falafel/widgets/register_checkbox.dart';
import 'package:operation_falafel/widgets/verify_user_by_otp_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../../models/AppThemeModels/DesignPerPage/RegisterPage/register_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../widgets/background.dart';
import '../profile/logged_in_user_profile.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const Register(this.onChanged,{super.key,required this.layOut});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();





  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  void initState() {
    super.initState();
    // Get the language set as default on the users phone
    // String? systemCountryCode = window.locale.countryCode;
    countryCode= CountryCode(code: "AE",name: "United Arab Emirates",dialCode: "+971" );
    getAllNationalities ();

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
      barrierDismissible: false,
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
  dynamic? selectedGenderValue;


   List<dynamic> nationalities =[];
  dynamic? selectedNationalValue;

  bool checkboxBool = false;
  bool validatTermsCheckbox =false;
  ValueChanged _valueChangedHandler() {
    return (value) => setState(() {
      print(value);
       if(value==true)
      checkboxBool = false;
       else
         checkboxBool =true;


    });
  }




  bool verifyUser= false;
  final _formKey = GlobalKey<FormState>();

  bool _validatePaassword =false;

  void _togglePasswordVisibility() {
    print(_obscureText);
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      RegisterPage? registerPage = appTheme.appTheme.designPerPage?.registerPage;
      bool loadingDesign = registerPage != null;


      return (loadingDesign)?
      Stack(
        children: [
          Background(),
          Scaffold(
              backgroundColor: Colors.transparent,

              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:
                  (Localizations
                      .localeOf(context)
                      .languageCode == 'en') ?
                  const ImageIcon(
                    AssetImage("assets/images/back_new.png",),
                    size: 35,
                  ) :
                  const ImageIcon(
                    AssetImage("assets/images/back_arabic.png",),
                    size: 35,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                // centerTitle: true,
                // title:MyText(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
                // actions: [],
              ),
              body: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 450,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(registerPage.pageTile.data,
                        style: TextStyle(
                          fontFamily: lng?.titleHeader2.textFamily,
                          color: Color(int.parse(registerPage.pageTile.color)),
                          fontSize: double.parse(getTranslated(context, "enterOfTitleSize")!),
                          height: 0.8), textAlign: TextAlign.center,),
                      // MyText(getTranslated(context, "register")!, style: TextStyle(
                      //     fontFamily: getTranslated(context, "fontFamilyButtons"),
                      //     color: Colors.amber,
                      //     fontSize: double.parse(
                      //         getTranslated(context, "enterOfTitleSize")!),
                      //     height: 0.8), textAlign: TextAlign.center,),
                      const SizedBox(height: 25,),

                      /// - Form
                      Visibility(
                        visible: !verifyUser,
                        child: Expanded(
                          child: Form(
                            key: _formKey,
                            child: ListView(
                              // physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [

                                /// - Name
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
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
                                        Expanded(flex: 2,
                                            child:
                                            MyText(
                                              "${registerPage.form.name.data}*",
                                              style: TextStyle(
                                                  fontFamily: lng?.header2.textFamily,
                                                  color: Color(int.parse(registerPage.form.name.color))
                                              ),)
                                        // MyText(
                                        //       "${getTranslated(context, "name")!}*",
                                        //       style: TextStyle(
                                        //           fontFamily: getTranslated(
                                        //               context, "fontFamilyBody")!,
                                        //           color: Colors.amber),)
                                        ),

                                         Expanded(
                                          flex: 5,
                                          child: SizedBox(

                                            child: MyTextFormField(
                                             controller: nameController,
                                              autofocus: false,
                                              style:const TextStyle(color: Colors.white),
                                              decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: Colors.black45,
                                                contentPadding: EdgeInsets.only(left: 10, right: 10),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                errorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                focusedErrorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                hintText: '',
                                                // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter your name';
                                                }
                                                return null;
                                              },
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
                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 0, right: 0),

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
                                        Expanded(flex: 5, child: Padding(
                                          padding: const EdgeInsets.only(left: 0, right: 0),
                                          child: MyText(
                                            "${registerPage.form.phoneNumber.data}*",
                                            style: TextStyle(
                                                fontFamily: lng?.header2.textFamily,
                                                color: Color(int.parse(registerPage.form.phoneNumber.color))
                                            ),)
                                        )),

                                        Expanded(
                                          flex: 12,
                                          child: Container(
                                            // height: 50,
                                            // decoration:const BoxDecoration(
                                            //   color: Colors.black45,
                                            //
                                            //   borderRadius:
                                            //
                                            //
                                            //    BorderRadius.only(
                                            //     bottomLeft: Radius.circular(10.0),
                                            //     topLeft: Radius.circular(10.0),
                                            //      topRight: Radius.circular(10.0),
                                            //      bottomRight: Radius.circular(10.0),
                                            //   ),
                                            //
                                            //   // border: Border.all(
                                            //   //   width: 0,
                                            //   //   color: Colors.transparent,
                                            //   //   style: BorderStyle.solid,
                                            //   // ),
                                            // ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      height: 48,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black45,

                                                        borderRadius:

                                                        (Localizations.localeOf(context).languageCode == 'en') ?
                                                        const BorderRadius.only(
                                                          bottomLeft: Radius.circular(10.0),
                                                          topLeft: Radius.circular(10.0),

                                                        ) :
                                                        (Localizations.localeOf(context).languageCode == 'ar') ?
                                                        const BorderRadius.only(
                                                          bottomRight: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                        ) :
                                                        const BorderRadius.only(
                                                          bottomLeft: Radius.circular(10.0),
                                                          topLeft: Radius.circular(10.0),
                                                        ),

                                                        // border: Border.all(
                                                        //   width: 0,
                                                        //   color: Colors.transparent,
                                                        //   style: BorderStyle.solid,
                                                        // ),
                                                      ),
                                                      child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 0, right: 0),
                                                          child: IconButton(
                                                            icon:
                                                            countryCode != null ?
                                                            SizedBox(width: 30,
                                                                height: 30,
                                                                child: countryCode!
                                                                    .flagImage)
                                                                : const Icon(
                                                                Icons.flag_outlined),
                                                            padding: EdgeInsets.zero,
                                                            onPressed: () async {
                                                              final code = await countryPicker
                                                                  .showPicker(
                                                                  context: context,
                                                                  initialSelectedLocale: "AE");
                                                              if (code != null) {
                                                                setState(() {
                                                                  countryCode = code;
                                                                });
                                                              };
                                                            },)
                                                      ),
                                                    )),
                                                Expanded(
                                                  flex: 8,
                                                  child: SizedBox(

                                                    child: MyTextFormField(
                                                      maxLength: 9,
                                                     controller: mobileController,
                                                      keyboardType: TextInputType.number,
                                                      autofocus: false,
                                                      style: TextStyle(color: Colors.white),
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: Colors.black45,
                                                        contentPadding: EdgeInsets.only(left: 10, right: 10, ),
                                                        focusedErrorBorder:UnderlineInputBorder(
                                                          borderRadius:  (Localizations.localeOf(context).languageCode == 'ar') ?

                                                          const BorderRadius.only(
                                                            bottomLeft: Radius.circular(10.0),
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
                                                          borderSide:  BorderSide(color: Colors.red, width: 2.0,),

                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius:  (Localizations.localeOf(context).languageCode == 'ar') ?

                                                          const BorderRadius.only(
                                                            bottomLeft: Radius.circular(10.0),
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
                                                          borderSide: BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1.0,),
                                                        ),
                                                        errorBorder: UnderlineInputBorder(
                                                          borderRadius:  (Localizations.localeOf(context).languageCode == 'ar') ?

                                                          const BorderRadius.only(
                                                            bottomLeft: Radius.circular(10.0),
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
                                                          borderSide:  BorderSide(color: Colors.red, width: 2.0,),

                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                          (Localizations.localeOf(context).languageCode == 'ar') ?

                                                          const BorderRadius.only(
                                                            bottomLeft: Radius.circular(10.0),
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

                                                          borderSide: BorderSide(
                                                              color: Colors.transparent,
                                                              width: 10.0),
                                                        ),
                                                        hintText: '',
                                                        counterText: '',
                                                        // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                                      ),
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter your phone number';
                                                        } else if (value!.length != 9) {
                                                          return 'must be 9 digits';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Expanded(
                                        //
                                        //   flex: 3,
                                        //   child: SizedBox(
                                        //       height: 50,
                                        //       child: Container(
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //
                                        //           (Localizations
                                        //               .localeOf(context)
                                        //               .languageCode == 'en') ?
                                        //           const BorderRadius.only(
                                        //             bottomRight: Radius.circular(10),
                                        //             topRight: Radius.circular(10),
                                        //           ) :
                                        //           (Localizations
                                        //               .localeOf(context)
                                        //               .languageCode == 'ar') ?
                                        //           const BorderRadius.only(
                                        //             bottomLeft: Radius.circular(10.0),
                                        //             topLeft: Radius.circular(10.0),
                                        //           ) :
                                        //           const BorderRadius.only(
                                        //             bottomRight: Radius.circular(10),
                                        //             topRight: Radius.circular(10),
                                        //           ),
                                        //
                                        //
                                        //           color: Color(int.parse(registerPage.form.phoneNumber.verifiedButton.backGroundColor)),
                                        //           // border: Border.all(
                                        //           //   width: 0.8,
                                        //           //   color: Colors.white,
                                        //           //   style: BorderStyle.solid,
                                        //           // ),
                                        //         ),
                                        //         child:
                                        //         //Image.network(registerPage.form.phoneNumber.verifiedButton.imageIcon,height: 2,width: 2,)
                                        //         Icon(Icons.check, color: Colors.white,),
                                        //       )
                                        //   ),
                                        // ),


                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),

                                /// - email address
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
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
                                        Expanded(flex: 2,
                                            child:  MyText(
                                              "${registerPage.form.email.data}*",
                                              style: TextStyle(
                                                  fontFamily: lng?.header2.textFamily,
                                                  color: Color(int.parse(registerPage.form.email.color))
                                              ),)
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: SizedBox(

                                            child: MyTextFormField(
                                                controller: emailController,
                                              autofocus: false,
                                              style:const  TextStyle(color: Colors.white),
                                              decoration:const  InputDecoration(
                                                filled: true,
                                                fillColor: Colors.black45,
                                                contentPadding: EdgeInsets.only(left: 10, right: 10),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                hintText: '',
                                                errorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                focusedErrorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter your email address';
                                                } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                                    .hasMatch(value)) {
                                                  return 'Please enter a valid email address';
                                                }
                                                return null;
                                              },
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
                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.only(
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
                                        Expanded(flex: 2,
                                            child:  MyText(
                                              "${registerPage.form.password.data}*",
                                              style: TextStyle(
                                                  fontFamily: lng?.header2.textFamily,
                                                  color: Color(int.parse(registerPage.form.password.color))
                                              ),)
                                        ),
                                         Expanded(
                                          flex: 5,
                                          child: SizedBox(
                                            child: MyTextFormField(
                                              controller: passwordController,
                                              obscureText: _obscureText,
                                              enableSuggestions: false,
                                              autocorrect: false,
                                              autofocus: false,
                                              style: const TextStyle(color: Colors.white),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.black45,
                                                contentPadding:const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 15),
                                                focusedBorder:const OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,),
                                                ),
                                                errorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                focusedErrorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                enabledBorder:const OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                suffixIcon:GestureDetector(
                                                  onTap: _togglePasswordVisibility,
                                                  child:
                                                  !_obscureText ? Icon(Icons.visibility_rounded , color: Colors.grey,): Icon(Icons.visibility_off_rounded, color:Colors.grey),
                                                ),
                                                  hintText: '',

                                                // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter a password';
                                                } else if (!RegExp(r'^[\w!@#$%^&*()]{6,30}$').hasMatch(value)) {
                                                  setState(() {
                                                    _validatePaassword = true;
                                                  });
                                                  return '';
                                                }
                                                setState(() {
                                                  _validatePaassword = false;
                                                });
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _validatePaassword,
                                  child: Row(
                                    children: [
                                      Expanded(child: SizedBox(width: 10,)),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Image.asset("assets/images/page2orders_icon.png", height: 10,),
                                                SizedBox(width: 5,),
                                                MyText("Password must be 6-30 characters",style: TextStyle(color: Colors.red),)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Image.asset("assets/images/page2orders_icon.png", height: 10,),
                                                SizedBox(width: 5,),
                                                MyText("Password must be contain only letters",style: TextStyle(color: Colors.red),)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Image.asset("assets/images/page2orders_icon.png", height: 10,),
                                                SizedBox(width: 5,),
                                                MyText("Password must be contain numbers",style: TextStyle(color: Colors.red),)
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Image.asset("assets/images/page2orders_icon.png", height: 10,),
                                                SizedBox(width: 5,),
                                                MyText("Password must be contain \nspecial characters (!@#\$%^&*())", style: TextStyle(color: Colors.red),)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),



                                const SizedBox(height: 10,),

                                /// - date of birth
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
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
                                        Expanded(flex: 2,
                                            child:  MyText(
                                              "${registerPage.form.dateOfBirth.data}:",
                                              style: TextStyle(
                                                  fontFamily: lng?.header2.textFamily,
                                                  color: Color(int.parse(registerPage.form.dateOfBirth.color))
                                              ),)),
                                        Expanded(
                                          flex: 5,
                                          child: SizedBox(

                                            child: Stack(
                                              children: [
                                                MyTextFormField(
                                                  controller: birthDateController,
                                                  enabled: true,
                                                  autofocus: false,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.black45,
                                                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),

                                                      ),
                                                      borderSide: BorderSide(color: Colors.transparent, width: 0.0, ),
                                                    ),
                                                    errorBorder: UnderlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 2.0,),
                                                    ),
                                                    focusedErrorBorder: UnderlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 2.0,),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                                    ),
                                                    hintText: '',
                                                    // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter your date of birth';
                                                    }
                                                    // You can add more advanced date validation here if needed
                                                    return null;
                                                  },

                                                ),
                                                Positioned.fill(
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: new InkWell(
                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                        splashColor: Colors.black,
                                                        overlayColor: MaterialStateProperty.all<Color>(Colors.white60),

                                                        onTap: () {
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
                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
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
                                        Expanded(flex: 2,
                                            child:  MyText(
                                              "${registerPage.form.nationality.data}:",
                                              style: TextStyle(
                                                  fontFamily: lng?.header2.textFamily,
                                                  color: Color(int.parse(registerPage.form.nationality.color))
                                              ),)),
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
                                                errorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                focusedErrorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2.0,),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2.0),
                                                ),

                                                //Add more decoration as you want here
                                                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                              ),
                                              isExpanded: true,
                                              hint: MyText(

                                                registerPage.form.nationality.dropDownWidget.labelText.data,
                                                style: TextStyle(
                                                  fontSize: lng?.header3.size.toDouble(),
                                                  color:Colors.white38,
                                                  // Color(int.parse(registerPage.form.nationality.color)),
                                                  fontFamily: lng?.header3.textFamily,
                                                ),
                                              ),


                                              icon: const ImageIcon(AssetImage("assets/images/down.png"),),

                                              iconSize: 30,
                                              buttonHeight: (selectedNationalValue != null)
                                                  ? 50
                                                  : 50,
                                              buttonPadding: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              dropdownDecoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              itemHeight: 30,

                                              items: nationalities
                                                  .map((item) =>

                                                  DropdownMenuItem<dynamic>(
                                                    value: item,
                                                    child:
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [

                                                        Row(
                                                          children: [

                                                            (selectedNationalValue != null)
                                                                ?
                                                            (selectedNationalValue == item)
                                                                ?
                                                             Image.network(
                                                               // "https://sqlvas774pizbiy4km.blob.core.windows.net/liveenvironment/mobile/assest/imag/falafel.png",
                                                               registerPage.form.nationality.dropDownWidget.selectedIcon.imageIcon,
                                                                height: 15, width: 15,)

                                                                : const SizedBox(width: 15,)
                                                                : const SizedBox(width: 15,),
                                                           // const  SizedBox(width: 5,),
                                                            Expanded(

                                                              child: MyText(item["name"]!,
                                                                style: TextStyle(
                                                                  fontSize: lng?.header2.size.toDouble(),
                                                                  color: Color(int.parse(registerPage.form.nationality.dropDownWidget.itemsTitle.color)),
                                                                  fontFamily: lng?.header2.textFamily,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),


                                                      ],
                                                    ),


                                                  )

                                              )
                                                  .toList(),
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Please select gender.';
                                                }
                                              },
                                              onChanged: (value) {
                                                //Do something when changing the item if you want.
                                                setState(() {
                                                  selectedNationalValue = value;
                                                });
                                              },
                                              onSaved: (value) {
                                                setState(() {
                                                  selectedNationalValue = value;
                                                });
                                              },
                                            ),


                                          ),
                                        ),



                                        // const Expanded(
                                        //   flex: 5,
                                        //   child: SizedBox(
                                        //
                                        //     child: TextField(
                                        //
                                        //       autofocus: false,
                                        //       style: TextStyle(color: Colors.white),
                                        //       decoration: InputDecoration(
                                        //         filled: true,
                                        //         fillColor: Colors.black45,
                                        //         contentPadding: EdgeInsets.only(left: 10, right: 10),
                                        //         focusedBorder: OutlineInputBorder(
                                        //           borderRadius: BorderRadius.all(
                                        //             Radius.circular(10.0),
                                        //           ),
                                        //           borderSide: BorderSide(
                                        //             color: Colors.transparent,
                                        //             width: 1.0,),
                                        //         ),
                                        //         enabledBorder: OutlineInputBorder(
                                        //           borderRadius: BorderRadius.all(
                                        //             Radius.circular(10.0),
                                        //           ),
                                        //           borderSide: BorderSide(
                                        //               color: Colors.transparent,
                                        //               width: 0.0),
                                        //         ),
                                        //         hintText: '',
                                        //         // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),
                                        //
                                        //       ),
                                        //
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),

                                /// - gender
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 0, right: 0),
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.only(
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
                                        Expanded(flex: 2,
                                            child: MyText(
                                              "${registerPage.form.gender.data}:",
                                              style: TextStyle(
                                                  fontFamily: lng?.header2.textFamily,
                                                  color: Color(int.parse(registerPage.form.gender.color))
                                              ),)
                                        ),
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
                                                errorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                focusedErrorBorder: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2.0,),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2.0,),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2.0),
                                                ),

                                                //Add more decoration as you want here
                                                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                              ),
                                              isExpanded: true,
                                              hint:
                                              MyText(
                                                registerPage.form.gender.dropDownWidget.labelText.data,
                                                style: TextStyle(
                                                    fontSize: lng?.header3.size.toDouble(),
                                                    color: Color(int.parse(registerPage.form.gender.dropDownWidget.labelText.color)),
                                                    fontFamily: lng?.header3.textFamily,
                                                ),
                                              ),
                                              // MyText(
                                              //   getTranslated(context, "selectGender")!,
                                              //   style: TextStyle(fontSize: 16,
                                              //       color: Colors.white60,
                                              //       fontFamily: getTranslated(
                                              //           context, "fontFamilyBody")!),
                                              // ),

                                              icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                              // const Icon(
                                              //   Icons.arrow_drop_down,
                                              //   color: Colors.white60,
                                              // ),
                                              iconSize: 30,
                                              buttonHeight: (selectedGenderValue != null)
                                                  ? 50
                                                  : 50,
                                              buttonPadding: const EdgeInsets.only(
                                                  left: 20, right: 20),
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
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [

                                                        Row(
                                                          children: [

                                                            (selectedGenderValue != null)
                                                                ?
                                                            (selectedGenderValue == gender)
                                                                ?
                                                            Image.network(
                                                              registerPage.form.gender.dropDownWidget.selectedIcon.imageIcon,
                                                              height: 15, width: 15,)
                                                            // Image.asset(
                                                            //   "assets/images/page2_icon.png",
                                                            //   height: 15, width: 15,)

                                                                : SizedBox(width: 15,)
                                                                : SizedBox(width: 15,),
                                                            SizedBox(width: 5,),
                                                            MyText(getTranslated(
                                                                context, gender)!,
                                                              style: TextStyle(
                                                                fontSize: lng?.header2.size.toDouble(),
                                                                color: Color(int.parse(registerPage.form.gender.dropDownWidget.itemsTitle.color)),
                                                                fontFamily: lng?.header2.textFamily,
                                                              ),
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
                                                setState(() {
                                                  selectedGenderValue = value;
                                                });
                                              },
                                              onSaved: (value) {
                                                setState(() {
                                                  selectedGenderValue = value;
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

                                Visibility(
                                  visible: registerPage.termsCheckBox.visibility=='true',
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: RegisterCheckbox(
                                      value: checkboxBool,
                                      onChanged: _valueChangedHandler(),
                                      label: '1',
                                      text: "accpetterms",
                                      addOnFlag: false,
                                      colorOfBox: (validatTermsCheckbox==false)?Colors.white:Colors.red,
                                      colorOfText: Color(int.parse(registerPage.termsCheckBox.title.color)),
                                    ),
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
                                        decoration: const BoxDecoration(
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
                                        child: const Icon(
                                          Icons.check, color: Colors.white,),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
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
                                        bottom: 8,
                                        right: 9,

                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: const BorderRadius.only(
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
                                          child: const Icon(
                                            Icons.check, color: Colors.white,
                                            size: 30,),
                                        ),
                                      ),

                                      Positioned.fill(
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              splashColor: Colors.black45,
                                              overlayColor: MaterialStateProperty.all<
                                                  Color>(Colors.black54),

                                              onTap: () {

                                                _submitForm();



                                                // PersistentNavBarNavigator.pushNewScreen(
                                                //   context,
                                                //   screen: LoggedInUserProfile(
                                                //       layOut: widget.layOut, (value) {
                                                //     widget.onChanged(value);
                                                //   }),
                                                //   withNavBar: true,
                                                //   // OPTIONAL VALUE. True by default.
                                                //   pageTransitionAnimation: PageTransitionAnimation
                                                //       .cupertino,
                                                // );
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
                        ),
                      ),
                      Visibility(
                          visible: verifyUser,
                          child: Expanded(child: VerifyUserByOtpWidget(  verifyPurpose: Strings.registrationPurpose,layOut: widget.layOut, (value) {
                            widget.onChanged(value);
                          })))

                    ],
                  ),
                ),
              ),

            ),
        ],
      )

      :LoadingPage();
    });
  }


  Future<Response<dynamic>> getAllNationalities () async {
    var url = '${Strings.baseAppAuthUrl}nationalities';


    var dio = Dio();
    try {

      var response = await dio.get(url,);// options: Options(headers: header)

      if(response.statusCode==200){
        setState(() {
          nationalities= response.data["body"];
        });

      }






      return response;
    } on DioError catch (e) {
      print(e.response);
      return e.response!;

    }
  }



  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform your registration logic here
      // You can use the collected form data to create a new user account or make an API call

         print(nameController.text);
         print(mobileController.text);
         print(countryCode!.dialCode);
         String fullMobileNumber ="${countryCode!.dialCode.substring(1,countryCode!.dialCode.length)}${mobileController.text}";
         print(fullMobileNumber);/// - Done

         print(emailController.text);
         print(passwordController.text);
         print(birthDateController.text);
         print(selectedNationalValue);
         print(selectedNationalValue["id"]);


         print(selectedGenderValue);

      if(checkboxBool ==false){
        setState(() {
          validatTermsCheckbox =true;
        });
        SnackbarGenerator(context).snackBarGeneratorToast("Please accept terms & conditions",);
      }
      else{
        setState(() {
          validatTermsCheckbox =false;
        });
        Provider.of<AuthProvider>(context, listen: false).userRegistration(
            name: nameController.text,
            mobile: fullMobileNumber,
            email: emailController.text,
            dateOfBirth: birthDateController.text,
            password: passwordController.text,
            nationalityId: "${selectedNationalValue["id"]}",
            gender: selectedGenderValue

        ).then((res) {
          if(res.statusCode==200){
            SnackbarGenerator(context).snackBarGeneratorToast("Registration Successful!",);
            Provider.of<ProfileProvider>(context, listen: false).getUserInfo(res.data[Keys.bodyKey][Keys.tokenKey],);
            Provider.of<LoyaltyProvider>(context, listen: false).getLoyaltyTotalPoint(userToken: res.data[Keys.bodyKey][Keys.tokenKey],).then((value) {});
            Provider.of<AuthProvider>(context, listen: false).verifyingUserByRequestingOTP(userToken: Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!
            ).then((res) {
              if(res.statusCode ==200){
                // clearForm();
                setState(() {
                  verifyUser= true;
                });
              }
            });



          }
          else {
            if(res.data[Keys.messageKey]!=null){
              SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.messageKey]}",);
            }
            SnackbarGenerator(context).snackBarGeneratorToast("Registration Failed!",);
          }
        });
      }





      // print('Registration Successful!');
      // print('Name: $_name');
      // print('Phone Number: $_phoneNumber');
      // print('Email: $_email');
      // print('Password: $_password');
      // print('Date of Birth: $_dateOfBirth');
      // print('Nationality: $_nationality');
      // print('Gender: $_gender');
    }
  }

  clearForm() {
    setState(() {
      nameController.clear();
      mobileController.clear();
      emailController.clear();
      passwordController.clear();
      birthDateController.clear();
      selectedNationalValue.clear();
      selectedGenderValue ='';

    });
  }

}
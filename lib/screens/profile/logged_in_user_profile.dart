import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/strings.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/providers/parsistent_tabview_provider.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/my_rewards.dart';
import 'package:operation_falafel/screens/profile/profile_pages/help_page.dart';
import 'package:operation_falafel/screens/profile/profile_pages/order_history.dart';
import 'package:operation_falafel/screens/profile/profile_pages/saved_address.dart';
import 'package:operation_falafel/screens/profile/profile_pages/saved_cards.dart';
import 'package:operation_falafel/screens/rest%20password/reset_your_password.dart';
import 'package:operation_falafel/screens/verify_user_screen.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:operation_falafel/widgets/warning_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../data/snackBarGenerator.dart';
import '../../models/AppThemeModels/DesignPerPage/ProfilePage/profile_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../providers/AuthProvider/auth_provider.dart';

class LoggedInUserProfile extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const LoggedInUserProfile(this.onChanged,{super.key,required this.layOut});
  @override
  State<LoggedInUserProfile> createState() => _LoggedInUserProfileState();
}

class _LoggedInUserProfileState extends State<LoggedInUserProfile> {


  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
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
  dynamic? selectedValue = "Male";


  bool loadingVerifyingButton =false;
  final GlobalKey<FormState> _formKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
    return Consumer3<ThemeProvider, AuthProvider,ProfileProvider>(builder: (context, appTheme,authProvider,profileProvider, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      ProfilePage? profilePage = appTheme.appTheme.designPerPage?.profilePage;
      bool loadingDesign = profilePage != null;



          return
            Stack(
              children: [
                Background(),
                SafeArea(
                  child: Image.asset(
                    "assets/images/profile_back.png",
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    fit: BoxFit.cover,
                  ),
                ),
                (loadingDesign)?
                Scaffold(
                  resizeToAvoidBottomInset: false,

                  key: _drawerKey,
                  backgroundColor: Colors.transparent,
                  appBar:  AppBar(
                    // toolbarHeight: 40,
                      leading:Visibility(
                        visible: (widget.layOut=="Mobile")?true:false,
                        child: IconButton(
                          onPressed: (){
                            _drawerKey.currentState?.openDrawer();
                          },
                          icon:  ImageIcon(
                            NetworkImage("${profilePage?.appBar.drawerIcon.imageIcon}",),
                            size: double.parse(profilePage?.appBar.drawerIcon.mobileSize as String),
                          ),
                        ),
                      ) ,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: true,
                      actions: [

                      ],
                      title: Text(
                        profilePage?.appBar.title.data as String,
                        // getTranslated(context, "operationFalafelLogo")!,
                        style: TextStyle(
                            fontFamily: lng?.logoTitle.textFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: lng?.logoTitle.size.toDouble()
                        ),)
                  ),
                  body: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 450,),
                      child:  ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width,
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          child:  Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ///- verify user
                                Visibility(
                                visible:
                                (profileProvider.userInfoModel!=null)?
                                (profileProvider.userInfoModel!.body!.verified==0)?true:false:false,
                                  child: ListTile(

                                    tileColor: Colors.amber.withOpacity(0.2),
                                    title: Text("${getTranslated(context, "verifyYourIdentity")}", style: TextStyle(
                                        fontFamily: getTranslated(context, "fontFamilyBody"),
                                        color:  Colors.amber,
                                        fontSize: double.parse(getTranslated(context, "cartpageHeader2")!),
                                        fontWeight: FontWeight.bold),),
                                    subtitle:  Text("${getTranslated(context, "verifyYourIdentityMsg")}", style: TextStyle(
                                        fontFamily: getTranslated(context, "fontFamilyBody"),
                                        color:  Colors.white54,
                                        fontSize: double.parse(getTranslated(context, "cartpageHeader3")!),
                                        fontWeight: FontWeight.w300),maxLines: 1,
                                      textAlign: TextAlign.left,),
                                    trailing:
                                    (!loadingVerifyingButton)?
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          loadingVerifyingButton =true;
                                        });
                                        authProvider.verifyingUserByRequestingOTP(userToken: authProvider.loggedInUser!.token!).then((res) {
                                          if(res.statusCode == 200){
                                            SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.bodyKey]}",);
                                            PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen: VerifyUserScreen(
                                                statusString:"${res.data[Keys.bodyKey]}" ,
                                                layOut: widget.layOut, (value) {
                                                widget.onChanged(value);
                                              },
                                                verifyPurpose: Strings.registrationPurpose,

                                              ),
                                              withNavBar: true,
                                              // OPTIONAL VALUE. True by default.
                                              pageTransitionAnimation: PageTransitionAnimation
                                                  .cupertino,
                                            );
                                          }
                                          else{

                                          }

                                          setState(() {
                                            loadingVerifyingButton =false;
                                          });
                                        });



                                      },
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.amber,
                                        backgroundColor: Colors.transparent,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 0.0,
                                          horizontal: 0.0,
                                        ),),
                                      child: const Text(
                                        'Verify',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ):
                                    const  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.amber,
                                        strokeWidth: 2,
                                      ),
                                    )
                                    ,
                                  ),
                                ),



                                /// - Image & Name & Edit
                                const SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0, right:18),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      /// - Picture
                                      Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(0),
                                            width: 110,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.4),
                                              borderRadius: const BorderRadius.only(
                                                topRight: Radius.circular(100),
                                                bottomLeft: Radius.circular(100),
                                                topLeft: Radius.circular(100),
                                                bottomRight: Radius.circular(100),
                                              ),
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.amber,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(100),
                                                  topRight: Radius.circular(100),
                                                  bottomLeft: Radius.circular(100),
                                                  bottomRight: Radius.circular(100),

                                                ),
                                                child: Image.asset(
                                                  "assets/images/tempuser.gif", height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,)),
                                          ),
                                          Positioned(
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,

                                              child: ElevatedButton(
                                                  onPressed: () {

                                                  },
                                                  style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(100)),
                                                              side: BorderSide(
                                                                  color: Colors.transparent,
                                                                  width: 1)
                                                          )
                                                      ),
                                                      overlayColor: MaterialStateProperty.all(Colors.white30),
                                                      elevation: MaterialStateProperty.all(0),
                                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                                      backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.avatarImage.editButton.backGroundColor as String))),
                                                      // backgroundColor: MaterialStateProperty.all(Colors.black),
                                                      foregroundColor: MaterialStateProperty.all(Colors.white),
                                                      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                                  child:
                                                  Image.network(profilePage?.body.avatarImage.editButton.imageIcon as String)
                                                // ImageIcon(NetworkImage(profilePage?.body.avatarImage.editButton.imageIcon as String)  )
                                                // const Icon(
                                                //   Icons.mode_edit_outline_outlined,
                                                //   color: Colors.white,)
                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                      Expanded(
                                        child: Column  (
                                          children: [
                                            (profileProvider.userInfoModel!=null)?
                                            Text("${profileProvider.userInfoModel!.body!.name}", style: TextStyle(
                                                fontFamily:lng?.titleHeader1.textFamily,

                                                color: Color(int.parse(profilePage?.body.name.color as String)),
                                                fontSize: lng?.titleHeader1.size.toDouble()
                                            ),maxLines: 1)
                                            : const  SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.amber,
                                                strokeWidth: 2,
                                              ),
                                            ),

                                            SizedBox(
                                              child: DecoratedBox(
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(color: Colors.white),
                                                  ),
                                                ),
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    if(startEdit== true){
                                                      _submitForm();
                                                    }
                                                    setState(() {
                                                      startEdit = !startEdit;
                                                    });

                                                  },
                                                  child: (!updateLoading)?(startEdit)?
                                                  Text("SAVE PROFILE",
                                                    style: TextStyle(
                                                        fontFamily:lng?.header2.textFamily,
                                                        color: Color(int.parse(profilePage?.body.editProfileButton.color as String)),
                                                        fontSize: lng?.header2.size.toDouble()
                                                    ),
                                                  ):
                                                  Text(
                                                    profilePage?.body.editProfileButton.data as String,
                                                    style: TextStyle(
                                                        fontFamily:lng?.header2.textFamily,
                                                        color: Color(int.parse(profilePage?.body.editProfileButton.color as String)),
                                                        fontSize: lng?.header2.size.toDouble()
                                                    ),
                                                  ):const  SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: CircularProgressIndicator(
                                                      color: Colors.amber,
                                                      strokeWidth: 2,
                                                    ),
                                                  )
                                                  ,


                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10,),

                                /// - Form
                                Form(
                                    key: _formKey,
                                    child: Expanded(
                                      child: ListView(

                                          physics: ScrollPhysics(),
                                          shrinkWrap: true,
                                          children: [

                                            /// - Name
                                            Padding(
                                              padding: const EdgeInsets.only(left: 18.0,
                                                  right: 18),
                                              child:  Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: [
                                                    Expanded(flex: 1,
                                                        child:
                                                        Container(
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
                                                          child: Center(
                                                            child: Text(
                                                              profilePage?.body.form.name.data as String,
                                                              style: TextStyle(
                                                                  fontSize: lng?.header2.size.toDouble(),
                                                                  fontFamily: lng?.header2.textFamily,
                                                                  color: Color(int.parse(profilePage?.body.form.name.color as String))),),
                                                          ),
                                                        )
                                                      // Text(
                                                      //       "${getTranslated(context, "name")!} :",
                                                      //       style: TextStyle(fontSize: 13,
                                                      //           fontFamily: getTranslated(
                                                      //               context, "fontFamilyBody")!,
                                                      //           color: Colors.amber),)
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: SizedBox(

                                                        child: TextFormField(
                                                          controller: profileProvider.nameController,
                                                          enabled: startEdit,
                                                          autofocus: false,
                                                          style:const TextStyle(color: Colors.white),
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.black45,
                                                            contentPadding:const EdgeInsets.only(left: 10, right: 10),
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
                                                            errorBorder: OutlineInputBorder(
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
                                                            disabledBorder:OutlineInputBorder(
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
                                                            // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

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
                                            const SizedBox(height: 10,),

                                            /// - Phone number
                                            Padding(
                                              padding: const EdgeInsets.only(left: 18.0, right: 18),
                                              child:  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(flex: 2, child: Container(
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
                                                          padding: const EdgeInsets.only(left: 10, right: 10),
                                                          child:
                                                          Center(
                                                            child: Text(
                                                              profilePage?.body.form.phoneNumber.data as String,
                                                              style: TextStyle(
                                                                  fontSize: lng?.header2.size.toDouble(),
                                                                  fontFamily: lng?.header2.textFamily,
                                                                  color: Color(int.parse(profilePage?.body.form.phoneNumber.color as String))),),
                                                          )
                                                        // Text("${getTranslated(
                                                        //     context, "mobileNo")!} :",
                                                        //   style: TextStyle(
                                                        //       fontFamily: getTranslated(
                                                        //           context, "fontFamilyBody")!,
                                                        //       color: Colors.amber),),
                                                      ),
                                                    )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                            height: 48,
                                                          decoration:const  BoxDecoration(
                                                            color: Colors.black45,

                                                            borderRadius: const BorderRadius.only(
                                                              bottomLeft: Radius.circular(0.0),
                                                              topLeft: Radius.circular(0.0),
                                                              bottomRight: Radius.circular(0.0),
                                                              topRight: Radius.circular(0.0),

                                                            )



                                                          ),
                                                          child: Padding(
                                                              padding: const EdgeInsets.only(left: 0, right: 0),
                                                              child: IconButton(
                                                                icon:
                                                                countryCode != null ?
                                                                SizedBox(width: 30,
                                                                    height: 30,
                                                                    child: countryCode!.flagImage)
                                                                    : const Icon(Icons.flag_outlined),
                                                                padding: EdgeInsets.zero,
                                                                onPressed: () async {
                                                                  if(startEdit) {
                                                                    final code = await countryPicker
                                                                        .showPicker(
                                                                        context: context,
                                                                        initialSelectedLocale: "AE");
                                                                    if (code !=
                                                                        null) {
                                                                      setState(() {
                                                                        countryCode =
                                                                            code;
                                                                      });
                                                                    };
                                                                  }
                                                                },)
                                                          ),
                                                        )),
                                                    Expanded(
                                                      flex: 7,
                                                      child: SizedBox(

                                                        child: TextFormField(
                                                          controller: profileProvider.mobileController,
                                                          maxLength: 9,
                                                          enabled: startEdit,
                                                          keyboardType: TextInputType.number,
                                                          autofocus: false,
                                                          style:const TextStyle(color: Colors.white),
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.black45,
                                                            contentPadding:const EdgeInsets.only(left: 10, right: 10),
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
                                                            errorBorder: OutlineInputBorder(
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
                                                            disabledBorder:OutlineInputBorder(
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
                                                             counterText: ''
                                                            // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

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
                                            const SizedBox(height: 10,),

                                            /// - email address
                                            Padding(
                                              padding: const EdgeInsets.only(left: 18.0, right: 18),
                                              child: Row(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(flex: 1,
                                                        child:Container(
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
                                                          child: Center(
                                                            child: Text(
                                                                profilePage?.body.form.email.data as String,
                                                                style: TextStyle(
                                                                    fontSize: lng?.header2.size.toDouble(),
                                                                    fontFamily: lng?.header2.textFamily,
                                                                    color: Color(int.parse(profilePage?.body.form.email.color as String))),),
                                                          ),
                                                        ),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: SizedBox(

                                                        child: TextFormField(
                                                          controller: profileProvider.emailController,
                                                          enabled: startEdit,
                                                          autofocus: false,
                                                          style: const TextStyle(
                                                              color: Colors.white),
                                                          decoration:  InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.black45,
                                                            contentPadding: const EdgeInsets.only(
                                                                left: 10, right: 10),
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
                                                            errorBorder: OutlineInputBorder(
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
                                                            disabledBorder:OutlineInputBorder(
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

                                                            // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

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
                                            const SizedBox(height: 10,),

                                            /// - date of birth
                                            Padding(
                                              padding: const EdgeInsets.only(left: 18.0, right: 18),
                                              child:  Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(flex: 2,
                                                        child:      Container(
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
                                                          child: Center(
                                                            child: Text(
                                                              profilePage?.body.form.dateOfBirth.data as String,
                                                              style: TextStyle(
                                                                  fontSize: lng?.header2.size.toDouble(),
                                                                  fontFamily: lng?.header2.textFamily,
                                                                  color: Color(int.parse(profilePage?.body.form.dateOfBirth.color as String))),),
                                                          ),
                                                        )),
                                                    Expanded(
                                                      flex: 5,
                                                      child: SizedBox(

                                                        child: Stack(
                                                          children: [
                                                            TextFormField(
                                                              controller: profileProvider.birthDateController,
                                                              enabled: startEdit,
                                                              autofocus: false,
                                                              style: const TextStyle(color: Colors.white),
                                                              decoration:  InputDecoration(
                                                                filled: true,
                                                                fillColor: Colors.black45,
                                                                contentPadding:const EdgeInsets.only(
                                                                    left: 10, right: 10),
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
                                                                errorBorder: OutlineInputBorder(
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
                                                                disabledBorder:OutlineInputBorder(
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

                                                                // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

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
                                                                child:  Material(
                                                                  color: Colors.transparent,
                                                                  child:  InkWell(
                                                                    borderRadius: BorderRadius.all(Radius.circular(0)),
                                                                    splashColor: Colors.black,
                                                                    overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                                                    onTap: () {
                                                                      if(startEdit)
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
                                            const SizedBox(height: 10,),
                                            /// - gender
                                            Padding(
                                              padding: const EdgeInsets.only(left:18.0, right: 18),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        flex:2, child: Container(
                                                        height: 50,
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
                                                        child: Center(child: Text("${getTranslated(context, "gender")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)))),
                                                    Expanded(
                                                      flex: 7,
                                                      child: SizedBox(
                                                        child: DropdownButtonFormField2(

                                                          scrollbarAlwaysShow: true,
                                                          style: const TextStyle(color: Colors.white),
                                                          decoration:  InputDecoration(
                                                            //Add isDense true and zero Padding.
                                                            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                                            isDense: true,
                                                            fillColor: Colors.black45,
                                                            filled: true,
                                                            contentPadding:const EdgeInsets.only(),

                                                            focusColor: Colors.transparent,
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
                                                            errorBorder: OutlineInputBorder(
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
                                                            disabledBorder:OutlineInputBorder(
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

                                                            //Add more decoration as you want here
                                                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                                          ),
                                                          isExpanded: true,
                                                          hint: Text(
                                                            profilePage?.body.form.gender.dropDownWidget.labelText.data as String,
                                                            style: TextStyle(
                                                                fontSize: lng?.header3.size.toDouble(),
                                                                fontFamily: lng?.header3.textFamily,
                                                                color: Color(int.parse(profilePage?.body.form.gender.dropDownWidget.labelText.color as String))),),
                                                          icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                                          iconDisabledColor: Colors.grey,
                                                          iconEnabledColor: Colors.white70,
                                                          disabledHint: (profileProvider.selectedGenderValue != null) ?Row(
                                                            children: [
                                                              Image.network(profilePage?.body.form.gender.dropDownWidget.selectedIcon.imageIcon as String,
                                                                height:double.parse(profilePage?.body.form.gender.dropDownWidget.selectedIcon.height as String) ,
                                                                width: double.parse(profilePage?.body.form.gender.dropDownWidget.selectedIcon.width as String),),
                                                              SizedBox(width: 5,),
                                                              Text("${profileProvider.selectedGenderValue}",style: TextStyle(
                                                                  fontSize: lng?.header3.size.toDouble(),
                                                                  fontFamily: lng?.header3.textFamily,
                                                                  color: Color(int.parse(profilePage?.body.form.gender.dropDownWidget.labelText.color as String))),),
                                                            ],
                                                          ):Text("Disabled", style: TextStyle(color: Colors.grey),),
                                                          iconSize: 30,
                                                          buttonHeight: (profileProvider.selectedGenderValue != null) ? 50 : 50,
                                                          buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                                                          dropdownDecoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius: BorderRadius.circular(
                                                                10),
                                                          ),
                                                          itemHeight: 30,
                                                          value: profileProvider.selectedGenderValue,
                                                          items:
                                                          (startEdit)?
                                                          gender.map((gender) => DropdownMenuItem<dynamic>(
                                                                value: gender,
                                                                child:
                                                                Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [

                                                                    Row(
                                                                      children: [

                                                                        (profileProvider.selectedGenderValue != null)
                                                                            ?
                                                                        (profileProvider.selectedGenderValue == gender)
                                                                            ?
                                                                        Image.network(profilePage?.body.form.gender.dropDownWidget.selectedIcon.imageIcon as String,
                                                                          height:double.parse(profilePage?.body.form.gender.dropDownWidget.selectedIcon.height as String) ,
                                                                          width: double.parse(profilePage?.body.form.gender.dropDownWidget.selectedIcon.width as String),)
                                                                        // Image.asset("assets/images/page2_icon.png", height: 15, width: 15,)
                                                                            : SizedBox(width: 15,)
                                                                            : SizedBox(
                                                                          width: 15,),
                                                                        SizedBox(width: 5,),


                                                                        Text(
                                                                          getTranslated(context, gender)!,
                                                                          style: TextStyle(
                                                                              fontSize: lng?.header3.size.toDouble(),
                                                                              fontFamily: lng?.header3.textFamily,
                                                                              color: Color(int.parse(profilePage?.body.form.gender.dropDownWidget.labelText.color as String))),
                                                                        ),
                                                                      ],
                                                                    ),


                                                                  ],
                                                                ),


                                                              )).toList():null,
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return 'Please select gender.';
                                                            }
                                                          },
                                                          onChanged: (value) {
                                                            //Do something when changing the item if you want.

                                                              profileProvider.updateGender(value);

                                                          },
                                                          onSaved: (value) {
                                                            profileProvider.updateGender(value);

                                                          },
                                                        ),


                                                      ),
                                                    ),
                                                  ],
                                                ),

                                            ),
                                            const SizedBox(height: 10,),

                                            /// - Password
                                            Padding(
                                              padding: const EdgeInsets.only(left: 18.0,
                                                  right: 18),
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                decoration: BoxDecoration(
                                                  color: Colors.black45,
                                                  borderRadius: const BorderRadius.only(
                                                    topRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                    topLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                  ),
                                                  border: Border.all(
                                                    width: 0,
                                                    color: Colors.transparent,
                                                    style: BorderStyle.solid,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(flex: 2,
                                                        child:      Text(
                                                          profilePage?.body.form.password.data as String,
                                                          style: TextStyle(
                                                              fontSize: lng?.header2.size.toDouble(),
                                                              fontFamily: lng?.header2.textFamily,
                                                              color: Color(int.parse(profilePage?.body.form.password.color as String))),)),
                                                    Expanded(
                                                      flex: 5,
                                                      child: SizedBox(

                                                        child: Stack(
                                                          children: [
                                                            const TextField(
                                                              obscureText: true,
                                                              enableSuggestions: false,
                                                              autocorrect: false,
                                                              autofocus: false,
                                                              style: const TextStyle(
                                                                  color: Colors.white),
                                                              decoration: InputDecoration(

                                                                filled: true,
                                                                fillColor: Colors.transparent,
                                                                contentPadding: EdgeInsets.only(
                                                                    left: 10, right: 10),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.all(
                                                                    Radius.circular(0.0),
                                                                  ),
                                                                  borderSide: BorderSide(
                                                                    color: Colors.transparent,
                                                                    width: 1.0,),
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.all(
                                                                    Radius.circular(0.0),
                                                                  ),
                                                                  borderSide: BorderSide(
                                                                      color: Colors.transparent,
                                                                      width: 0.0),
                                                                ),
                                                                hintText: 'Tap to Edit',
                                                                hintStyle: TextStyle(color: Colors.white60)
                                                                // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                                              ),

                                                            ),
                                                            Positioned.fill(
                                                                child:  Material(
                                                                  color: Colors.transparent,
                                                                  child:  InkWell(
                                                                    borderRadius:const  BorderRadius.all(Radius.circular(0)),
                                                                    splashColor: Colors.black,
                                                                    overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                                                    onTap: () {
                                                                      PersistentNavBarNavigator.pushNewScreen(
                                                                        context,
                                                                        screen: ForgetPassword(
                                                                          forgetOrUpdateFlag: Strings.updatePassword,

                                                                        ),
                                                                        withNavBar: true,
                                                                        // OPTIONAL VALUE. True by default.
                                                                        pageTransitionAnimation: PageTransitionAnimation
                                                                            .cupertino,
                                                                      );
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

                                            /// - refferal code
                                            // Padding(
                                            //   padding: const EdgeInsets.only(left:18.0, right: 18),
                                            //   child: Container(
                                            //     padding: const EdgeInsets.only(left:10, right: 10),
                                            //     decoration: BoxDecoration(
                                            //       color: Colors.black45,
                                            //       borderRadius:const BorderRadius.only(
                                            //         topRight: Radius.circular(10),
                                            //         bottomLeft: Radius.circular(10),
                                            //         topLeft: Radius.circular(10),
                                            //         bottomRight: Radius.circular(10),
                                            //       ),
                                            //       border: Border.all(
                                            //         width: 0,
                                            //         color: Colors.transparent,
                                            //         style: BorderStyle.solid,
                                            //       ),
                                            //     ),
                                            //     child: Row(
                                            //       children: [
                                            //         Expanded(flex:3, child:
                                            //         Text("${getTranslated(context, "referralCode")!} :", style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.amber),)
                                            //         ),
                                            //         const Expanded(
                                            //           flex: 5,
                                            //           child: SizedBox(
                                            //
                                            //             child:   TextField(
                                            //
                                            //               autofocus: false,
                                            //               style:  TextStyle(color: Colors.white),
                                            //               decoration:  InputDecoration(
                                            //                 filled: true,
                                            //                 fillColor: Colors.transparent,
                                            //                 contentPadding: EdgeInsets.only(left:10, right: 10),
                                            //                 focusedBorder: OutlineInputBorder(
                                            //                   borderRadius:  BorderRadius.all(
                                            //                     Radius.circular(0.0),
                                            //                   ),
                                            //                   borderSide: BorderSide(color: Colors.transparent, width: 1.0, ),
                                            //                 ),
                                            //                 enabledBorder: OutlineInputBorder(
                                            //                   borderRadius:  BorderRadius.all(
                                            //                     Radius.circular(0.0),
                                            //                   ),
                                            //                   borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                                            //                 ),
                                            //                 // hintText: '',
                                            //                 // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),
                                            //
                                            //               ),
                                            //
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            // ),
                                            const SizedBox(height: 10,),
                                            Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    profilePage?.body.form.uploadId.data as String,
                                                    style: TextStyle(
                                                        fontSize: lng?.header3.size.toDouble(),
                                                        fontFamily: lng?.header3.textFamily,
                                                        color: Color(int.parse(profilePage?.body.form.uploadId.color as String))),),
                                                  ElevatedButton(
                                                      onPressed: () {

                                                      },
                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                              const RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.all(
                                                                      Radius.circular(5)),
                                                                  side: BorderSide(
                                                                      color: Colors.transparent,
                                                                      width: 1)
                                                              )
                                                          ),
                                                          overlayColor: MaterialStateProperty.all(
                                                              Colors.white30),
                                                          elevation: MaterialStateProperty.all(0),
                                                          shadowColor: MaterialStateProperty.all(
                                                              Colors.transparent),
                                                          backgroundColor: MaterialStateProperty
                                                              .all(Colors.amber),
                                                          foregroundColor: MaterialStateProperty
                                                              .all(Colors.white),
                                                          padding: MaterialStateProperty.all(
                                                              const EdgeInsets.only(top: 10,
                                                                  bottom: 10,
                                                                  right: 30,
                                                                  left: 30)),
                                                          textStyle: MaterialStateProperty.all(
                                                              const TextStyle(fontSize: 15))),
                                                      child:      Text(
                                                        profilePage?.body.form.uploadId.chooseButton.data as String,
                                                        style: TextStyle(
                                                            fontSize: lng?.header3.size.toDouble(),
                                                            fontFamily: lng?.header3.textFamily,
                                                            color: Color(int.parse(profilePage?.body.form.uploadId.chooseButton.color as String))),)
                                                  ),
                                                ],),
                                            ),


                                          ],
                                        ),
                                    ),
                                  ),





                                if(!isKeyboardVisible)const SizedBox(height: 140,),

                                /// - Buttons


                                // Visibility(
                                //   visible:true,
                                //   // !isKeyboardVisible,
                                //   child: Container(
                                //       color:Colors.green,
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       child: Column(
                                //         mainAxisAlignment: MainAxisAlignment.end,
                                //         children: [
                                //           Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Expanded(
                                //                 child: Padding(
                                //                   padding: const EdgeInsets.all(3.0),
                                //                   child: SizedBox(
                                //                     height: 60,
                                //                     // width: 130,
                                //                     child: ElevatedButton(
                                //                       onPressed: () {
                                //                         PersistentNavBarNavigator.pushNewScreen(
                                //                           context,
                                //                           screen: OrderHistory(),
                                //                           withNavBar: true,
                                //                           // OPTIONAL VALUE. True by default.
                                //                           pageTransitionAnimation: PageTransitionAnimation
                                //                               .cupertino,
                                //                         );
                                //                       },
                                //                       style: ButtonStyle(
                                //                           shape: MaterialStateProperty.all<
                                //                               RoundedRectangleBorder>(
                                //                               const RoundedRectangleBorder(
                                //                                   borderRadius: BorderRadius
                                //                                       .all(
                                //                                       Radius.circular(10)),
                                //                                   side: BorderSide(
                                //                                       color: Colors
                                //                                           .transparent,
                                //                                       width: 1)
                                //                               )
                                //                           ),
                                //                           overlayColor: MaterialStateProperty.all(Colors.white12),
                                //                           elevation: MaterialStateProperty.all(0),
                                //                           shadowColor: MaterialStateProperty.all(Colors.transparent),
                                //                           backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),
                                //                           // backgroundColor: MaterialStateProperty.all(Colors.black),
                                //                           foregroundColor: MaterialStateProperty.all(Colors.black),
                                //                           padding: MaterialStateProperty.all(
                                //                               const EdgeInsets.only(
                                //                                 top: 10, bottom: 10,)),
                                //                           textStyle: MaterialStateProperty.all(
                                //                               const TextStyle(fontSize: 30))),
                                //                       child: Text(
                                //                         profilePage?.body.buttons.orderHistory.data as String ,
                                //                         style: TextStyle(
                                //                           fontFamily: getTranslated(context, "fontFamilyBody")!,
                                //                           color: Color(int.parse(profilePage?.body.buttons.orderHistory.color as String)),
                                //                           fontSize: lng?.header3.size.toDouble(),
                                //                           fontWeight: FontWeight.w300,),
                                //                         textAlign: TextAlign.center,),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //               Expanded(
                                //                 child: Padding(
                                //                   padding: const EdgeInsets.all(3.0),
                                //                   child: SizedBox(
                                //                     height: 60,
                                //                     // width: 130,
                                //                     child: ElevatedButton(
                                //                       onPressed: () {
                                //                         PersistentNavBarNavigator
                                //                             .pushNewScreen(
                                //                           context,
                                //                           screen: SavedAddress(),
                                //                           withNavBar: true,
                                //                           // OPTIONAL VALUE. True by default.
                                //                           pageTransitionAnimation: PageTransitionAnimation
                                //                               .cupertino,
                                //                         );
                                //                       },
                                //                       style: ButtonStyle(
                                //                           shape: MaterialStateProperty.all<
                                //                               RoundedRectangleBorder>(
                                //                               const RoundedRectangleBorder(
                                //                                   borderRadius: BorderRadius
                                //                                       .all(
                                //                                       Radius.circular(10)),
                                //                                   side: BorderSide(
                                //                                       color: Colors
                                //                                           .transparent,
                                //                                       width: 1)
                                //                               )
                                //                           ),
                                //                           overlayColor: MaterialStateProperty
                                //                               .all(Colors.white12),
                                //                           elevation: MaterialStateProperty
                                //                               .all(0),
                                //                           shadowColor: MaterialStateProperty
                                //                               .all(Colors.transparent),
                                //                           backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),
                                //
                                //                           foregroundColor: MaterialStateProperty
                                //                               .all(Colors.black),
                                //                           padding: MaterialStateProperty.all(
                                //                               const EdgeInsets.only(
                                //                                 top: 10, bottom: 10,)),
                                //                           textStyle: MaterialStateProperty
                                //                               .all(
                                //                               const TextStyle(fontSize: 30))),
                                //                       child: Text(
                                //                         profilePage?.body.buttons.savedAddress.data as String ,
                                //                         style: TextStyle(
                                //                           fontFamily: getTranslated(context, "fontFamilyBody")!,
                                //                           color: Color(int.parse(profilePage?.body.buttons.savedAddress.color as String)),
                                //                           fontSize: lng?.header3.size.toDouble(),
                                //                           fontWeight: FontWeight.w300,),
                                //                         textAlign: TextAlign.center,),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //               Expanded(
                                //                 child: Padding(
                                //                   padding: const EdgeInsets.all(3.0),
                                //                   child: SizedBox(
                                //                     height: 60,
                                //                     // width: 130,
                                //                     child: ElevatedButton(
                                //                       onPressed: () {
                                //                         PersistentNavBarNavigator
                                //                             .pushNewScreen(
                                //                           context,
                                //                           screen: SavedCards(),
                                //                           withNavBar: true,
                                //                           // OPTIONAL VALUE. True by default.
                                //                           pageTransitionAnimation: PageTransitionAnimation
                                //                               .cupertino,
                                //                         );
                                //                       },
                                //                       style: ButtonStyle(
                                //                           shape: MaterialStateProperty.all<
                                //                               RoundedRectangleBorder>(
                                //                               const RoundedRectangleBorder(
                                //                                   borderRadius: BorderRadius
                                //                                       .all(
                                //                                       Radius.circular(10)),
                                //                                   side: BorderSide(
                                //                                       color: Colors
                                //                                           .transparent,
                                //                                       width: 1)
                                //                               )
                                //                           ),
                                //                           overlayColor: MaterialStateProperty
                                //                               .all(Colors.white12),
                                //                           elevation: MaterialStateProperty
                                //                               .all(0),
                                //                           shadowColor: MaterialStateProperty
                                //                               .all(Colors.transparent),
                                //                           backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),
                                //
                                //                           foregroundColor: MaterialStateProperty
                                //                               .all(Colors.black),
                                //                           // padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                //                           textStyle: MaterialStateProperty
                                //                               .all(
                                //                               const TextStyle(fontSize: 30))),
                                //                       child: Text(
                                //                         profilePage?.body.buttons.savedCards.data as String ,
                                //                         style: TextStyle(
                                //                           fontFamily: getTranslated(context, "fontFamilyBody")!,
                                //                           color: Color(int.parse(profilePage?.body.buttons.savedCards.color as String)),
                                //                           fontSize: lng?.header3.size.toDouble(),
                                //                           fontWeight: FontWeight.w300,),
                                //                         textAlign: TextAlign.center,),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //           Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Expanded(
                                //                 child: Padding(
                                //                   padding: const EdgeInsets.all(3.0),
                                //                   child: SizedBox(
                                //                     height: 60,
                                //                     child: ElevatedButton(
                                //                       onPressed: () {
                                //                         PersistentNavBarNavigator
                                //                             .pushNewScreen(
                                //                           context,
                                //                           screen: MyRewards(
                                //                               layOut: widget.layOut),
                                //                           withNavBar: true,
                                //                           // OPTIONAL VALUE. True by default.
                                //                           pageTransitionAnimation: PageTransitionAnimation
                                //                               .cupertino,
                                //                         );
                                //                       },
                                //                       style: ButtonStyle(
                                //                           shape: MaterialStateProperty.all<
                                //                               RoundedRectangleBorder>(
                                //                               const RoundedRectangleBorder(
                                //                                   borderRadius: BorderRadius
                                //                                       .all(
                                //                                       Radius.circular(10)),
                                //                                   side: BorderSide(
                                //                                       color: Colors
                                //                                           .transparent,
                                //                                       width: 1)
                                //                               )
                                //                           ),
                                //                           overlayColor: MaterialStateProperty
                                //                               .all(Colors.white12),
                                //                           elevation: MaterialStateProperty
                                //                               .all(0),
                                //                           shadowColor: MaterialStateProperty
                                //                               .all(Colors.transparent),
                                //                           backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),
                                //
                                //                           foregroundColor: MaterialStateProperty
                                //                               .all(Colors.black),
                                //                           padding: MaterialStateProperty.all(
                                //                               const EdgeInsets.only(
                                //                                   top: 10, bottom: 10)),
                                //                           textStyle: MaterialStateProperty
                                //                               .all(
                                //                               const TextStyle(fontSize: 30))),
                                //                       child: Text(
                                //                         profilePage?.body.buttons.loyalty.data as String ,
                                //                         style: TextStyle(
                                //                           fontFamily: getTranslated(context, "fontFamilyBody")!,
                                //                           color: Color(int.parse(profilePage?.body.buttons.signOut.color as String)),
                                //                           fontSize: lng?.header3.size.toDouble(),
                                //                           fontWeight: FontWeight.w300,),
                                //                         textAlign: TextAlign.center,),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //               Expanded(
                                //                 child: Padding(
                                //                   padding: const EdgeInsets.all(3.0),
                                //                   child: SizedBox(
                                //                     height: 60,
                                //
                                //                     child: ElevatedButton(
                                //                       onPressed: () {
                                //                         PersistentNavBarNavigator
                                //                             .pushNewScreen(
                                //                           context,
                                //                           screen: HelpPage(),
                                //                           withNavBar: true,
                                //                           // OPTIONAL VALUE. True by default.
                                //                           pageTransitionAnimation: PageTransitionAnimation
                                //                               .cupertino,
                                //                         );
                                //                       },
                                //                       style: ButtonStyle(
                                //                           shape: MaterialStateProperty.all<
                                //                               RoundedRectangleBorder>(
                                //                               const RoundedRectangleBorder(
                                //                                   borderRadius: BorderRadius
                                //                                       .all(
                                //                                       Radius.circular(10)),
                                //                                   side: BorderSide(
                                //                                       color: Colors
                                //                                           .transparent,
                                //                                       width: 1)
                                //                               )
                                //                           ),
                                //                           overlayColor: MaterialStateProperty
                                //                               .all(Colors.white12),
                                //                           elevation: MaterialStateProperty
                                //                               .all(0),
                                //                           shadowColor: MaterialStateProperty
                                //                               .all(Colors.transparent),
                                //                           backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),
                                //
                                //                           foregroundColor: MaterialStateProperty
                                //                               .all(Colors.black),
                                //                           padding: MaterialStateProperty.all(
                                //                               const EdgeInsets.only(
                                //                                 top: 10, bottom: 10,)),
                                //                           textStyle: MaterialStateProperty
                                //                               .all(
                                //                               const TextStyle(fontSize: 30))),
                                //                       child: Text(
                                //                         profilePage?.body.buttons.help.data as String ,
                                //                         style: TextStyle(
                                //                           fontFamily: getTranslated(context, "fontFamilyBody")!,
                                //                           color: Color(int.parse(profilePage?.body.buttons.help.color as String)),
                                //                           fontSize: lng?.header3.size.toDouble(),
                                //                           fontWeight: FontWeight.w300,),
                                //                         textAlign: TextAlign.center,),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //               Expanded(
                                //                 child: Padding(
                                //                   padding: const EdgeInsets.all(3.0),
                                //                   child: SizedBox(
                                //                     height: 60,
                                //
                                //                     child: ElevatedButton(
                                //                       onPressed: () {
                                //                         Provider.of<AuthProvider>(context, listen: false).logOutUserDetailsLocally().then((value) {
                                //                           SnackbarGenerator(context).snackBarGeneratorToast("User Logged out successfully",);
                                //
                                //                         });
                                //                       },
                                //                       style: ButtonStyle(
                                //                           shape: MaterialStateProperty.all<
                                //                               RoundedRectangleBorder>(
                                //                               const RoundedRectangleBorder(
                                //                                   borderRadius: BorderRadius
                                //                                       .all(
                                //                                       Radius.circular(10)),
                                //                                   side: BorderSide(
                                //                                       color: Colors
                                //                                           .transparent,
                                //                                       width: 1)
                                //                               )
                                //                           ),
                                //                           overlayColor: MaterialStateProperty
                                //                               .all(Colors.black12),
                                //                           elevation: MaterialStateProperty
                                //                               .all(0),
                                //                           shadowColor: MaterialStateProperty
                                //                               .all(Colors.transparent),
                                //                           backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),
                                //
                                //                           foregroundColor: MaterialStateProperty
                                //                               .all(Colors.black),
                                //                           padding: MaterialStateProperty.all(
                                //                               const EdgeInsets.only(
                                //                                 top: 10, bottom: 10,)),
                                //                           textStyle: MaterialStateProperty
                                //                               .all(
                                //                               const TextStyle(fontSize: 30))),
                                //                       child: Text(
                                //                         profilePage?.body.buttons.signOut.data as String ,
                                //                         style: TextStyle(
                                //                           fontFamily: getTranslated(context, "fontFamilyBody")!,
                                //                           color: Color(int.parse(profilePage?.body.buttons.signOut.color as String)),
                                //                           fontSize: lng?.header3.size.toDouble(),
                                //                           fontWeight: FontWeight.w300,),
                                //                         textAlign: TextAlign.center,),
                                //
                                //                       // Text(
                                //                       //   getTranslated(context, "sighOut")!,
                                //                       //   style: TextStyle(
                                //                       //     fontFamily: getTranslated(
                                //                       //         context, "fontFamilyBody")!,
                                //                       //     color: Colors.white,
                                //                       //     fontSize: 17,
                                //                       //     fontWeight: FontWeight.w300,),
                                //                       //   textAlign: TextAlign.center,),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ),
                                //
                                //
                                //             ],
                                //           ),
                                //
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),

                              ],
                            ),

                        ),



                    ),
                  ),


                  extendBody: true,

                  drawer: DrawerWidget(layOut: widget.layOut, onChanged: (value) {
                    widget.onChanged(value);
                  },),
                  bottomSheet:Visibility(
                    visible:!isKeyboardVisible,
                    child: Container(
                      height: 150,
                      color:Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                      height: 60,
                                      // width: 130,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: OrderHistory(),
                                            withNavBar: true,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
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
                                            overlayColor: MaterialStateProperty.all(Colors.white12),
                                            elevation: MaterialStateProperty.all(0),
                                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                                            backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),
                                            // backgroundColor: MaterialStateProperty.all(Colors.black),
                                            foregroundColor: MaterialStateProperty.all(Colors.black),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.only(
                                                  top: 10, bottom: 10,)),
                                            textStyle: MaterialStateProperty.all(
                                                const TextStyle(fontSize: 30))),
                                        child: Text(
                                          profilePage?.body.buttons.orderHistory.data as String ,
                                          style: TextStyle(
                                            fontFamily: getTranslated(context, "fontFamilyBody")!,
                                            color: Color(int.parse(profilePage?.body.buttons.orderHistory.color as String)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300,),
                                          textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                      height: 60,
                                      // width: 130,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: SavedAddress(),
                                            withNavBar: true,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
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
                                                .all(Colors.white12),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),

                                            foregroundColor: MaterialStateProperty
                                                .all(Colors.black),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.only(
                                                  top: 10, bottom: 10,)),
                                            textStyle: MaterialStateProperty
                                                .all(
                                                const TextStyle(fontSize: 30))),
                                        child: Text(
                                          profilePage?.body.buttons.savedAddress.data as String ,
                                          style: TextStyle(
                                            fontFamily: getTranslated(context, "fontFamilyBody")!,
                                            color: Color(int.parse(profilePage?.body.buttons.savedAddress.color as String)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300,),
                                          textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                      height: 60,
                                      // width: 130,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: SavedCards(),
                                            withNavBar: true,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
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
                                                .all(Colors.white12),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),

                                            foregroundColor: MaterialStateProperty
                                                .all(Colors.black),
                                            // padding: MaterialStateProperty.all(const EdgeInsets.only(top:10, bottom:10,)),
                                            textStyle: MaterialStateProperty
                                                .all(
                                                const TextStyle(fontSize: 30))),
                                        child: Text(
                                          profilePage?.body.buttons.savedCards.data as String ,
                                          style: TextStyle(
                                            fontFamily: getTranslated(context, "fontFamilyBody")!,
                                            color: Color(int.parse(profilePage?.body.buttons.savedCards.color as String)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300,),
                                          textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: MyRewards(
                                                layOut: widget.layOut),
                                            withNavBar: true,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
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
                                                .all(Colors.white12),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),

                                            foregroundColor: MaterialStateProperty
                                                .all(Colors.black),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.only(
                                                    top: 10, bottom: 10)),
                                            textStyle: MaterialStateProperty
                                                .all(
                                                const TextStyle(fontSize: 30))),
                                        child: Text(
                                          profilePage?.body.buttons.loyalty.data as String ,
                                          style: TextStyle(
                                            fontFamily: getTranslated(context, "fontFamilyBody")!,
                                            color: Color(int.parse(profilePage?.body.buttons.signOut.color as String)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300,),
                                          textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                      height: 60,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: HelpPage(),
                                            withNavBar: true,
                                            // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation
                                                .cupertino,
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
                                                .all(Colors.white12),
                                            elevation: MaterialStateProperty
                                                .all(0),
                                            shadowColor: MaterialStateProperty
                                                .all(Colors.transparent),
                                            backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),

                                            foregroundColor: MaterialStateProperty
                                                .all(Colors.black),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.only(
                                                  top: 10, bottom: 10,)),
                                            textStyle: MaterialStateProperty
                                                .all(
                                                const TextStyle(fontSize: 30))),
                                        child: Text(
                                          profilePage?.body.buttons.help.data as String ,
                                          style: TextStyle(
                                            fontFamily: getTranslated(context, "fontFamilyBody")!,
                                            color: Color(int.parse(profilePage?.body.buttons.help.color as String)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300,),
                                          textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: SizedBox(
                                      height: 60,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          showLogOutDialog(context, profilePage,lng!);


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
                                            backgroundColor: MaterialStateProperty.all(Color(int.parse(profilePage?.body.buttons.orderHistory.backGroundColor as String))),

                                            foregroundColor: MaterialStateProperty
                                                .all(Colors.black),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.only(
                                                  top: 10, bottom: 10,)),
                                            textStyle: MaterialStateProperty
                                                .all(
                                                const TextStyle(fontSize: 30))),
                                        child: Text(
                                          profilePage?.body.buttons.signOut.data as String ,
                                          style: TextStyle(
                                            fontFamily: getTranslated(context, "fontFamilyBody")!,
                                            color: Color(int.parse(profilePage?.body.buttons.signOut.color as String)),
                                            fontSize: lng?.header3.size.toDouble(),
                                            fontWeight: FontWeight.w300,),
                                          textAlign: TextAlign.center,),

                                        // Text(
                                        //   getTranslated(context, "sighOut")!,
                                        //   style: TextStyle(
                                        //     fontFamily: getTranslated(
                                        //         context, "fontFamilyBody")!,
                                        //     color: Colors.white,
                                        //     fontSize: 17,
                                        //     fontWeight: FontWeight.w300,),
                                        //   textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                )

                    : WarningPage(),




                Visibility(
                  visible: showDatePicker,
                  child: Positioned(
                    left: 50,
                    top: 180,
                    right: 50,
                    bottom: 180,
                    child: SfDateRangePicker(
                      confirmText: "Okay",
                      cancelText: "Canecl",

                      onSubmit: (value) {
                        if (value != null) {
                          showDatePicker = false;
                        }
                      },

                      backgroundColor: Colors.white,
                      onSelectionChanged: _onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.single,
                      initialSelectedDate: DateTime.now().subtract(const Duration(
                          days: 4)), //(_selectedDate!='')?DateFormat('dd/MM/yyyy').parse(_selectedDate):
                      // initialSelectedRange: PickerDateRange(DateTime.now().subtract(const Duration(days: 4)), DateTime.now().add(const Duration(days: 3))),
                    ),
                  ),
                )
              ],

            );




    });


  }

  bool startEdit = false;

  bool updateLoading =false;


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform your registration logic here
      // You can use the collected form data to create a new user account or make an API call
      String name = Provider.of<ProfileProvider>(context, listen: false).nameController.text;
      String email = Provider.of<ProfileProvider>(context, listen: false).emailController.text;
      String mobile = Provider.of<ProfileProvider>(context, listen: false).mobileController.text;
      String fullMobileNumber ="${countryCode!.dialCode.substring(1,countryCode!.dialCode.length)}${mobile}";
      String dateOfBirth = Provider.of<ProfileProvider>(context, listen: false).birthDateController.text;
      String? selectedGender = Provider.of<ProfileProvider>(context, listen: false).selectedGenderValue;

      print(name);
      print(email);
      print(fullMobileNumber);
      print(dateOfBirth);
      print(selectedGender!);
      String userToken  =  Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
      setState(() {
        updateLoading = true;
      });

      Provider.of<ProfileProvider>(context, listen: false).updateUserInfo(userToken: userToken, name: name , email: email, gender: selectedGender, dateOfBirth: dateOfBirth,mobile: fullMobileNumber ).then((res) {
        if(res.statusCode==200)
        {
          SnackbarGenerator(context).snackBarGeneratorToast("User info updated Successful!",);
        }
        else {

          if (res.data is List) {
            SnackbarGenerator(context).snackBarGeneratorToast("${res.data[0][Keys.messageKey]}",);
          }
          else if (res.data is Map<String, dynamic>) {
            if(res.data[Keys.messageKey]!=null){
              SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.messageKey]}",);
            }
          }
          SnackbarGenerator(context).snackBarGeneratorToast("User info updated Failed!",);
        }
        setState(() {
          updateLoading =false;
        });
      });




    }
  }



  void showLogOutDialog(BuildContext context,ProfilePage profilePage , Language lng) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, __, ___) {
        return Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 190,
                    constraints:const BoxConstraints(maxWidth: 450, ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding:const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(40)),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,

                      body:Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            Align(child:Text("${profilePage.body.logoutDialog.dialogTitle!.data}",
                              style: TextStyle(
                                fontFamily: "${lng.titleHeader1.textFamily}",
                                  color: Color(int.parse(profilePage?.body.logoutDialog.dialogTitle!.color as String)),
                                  fontSize: lng?.titleHeader1.size.toDouble(),

                              ),),),


                            const SizedBox(height: 10,),
                            Text(profilePage.body.logoutDialog.dialogBodyTitle!.data,
                              style: TextStyle(
                              fontFamily: "${lng.header3.textFamily}",
                              color: Color(int.parse(profilePage?.body.logoutDialog.dialogBodyTitle!.color as String)),
                              fontSize: lng?.header3.size.toDouble(),

                            ),

                            ),
                            const SizedBox(height: 10,),

                            ElevatedButton(

                              onPressed: () {
                                String userToken = Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
                                String email = Provider.of<AuthProvider>(context, listen: false).email!;
                                String password = Provider.of<AuthProvider>(context, listen: false).password!;
                                Provider.of<AuthProvider>(context, listen: false).logoutFromAllDevices(userToken:userToken,  email:email,   password:password).then((res) {
                                  if(res.statusCode==200){
                                    Provider.of<AuthProvider>(context, listen: false).logOutUserDetailsLocally().then((value) {
                                      Navigator.pop(context);
                                      SnackbarGenerator(context).snackBarGeneratorToast("User Logged out successfully",);
                                    });

                                  }
                                  else{
                                    SnackbarGenerator(context).snackBarGeneratorToast("Try Again!",);
                                  }
                                });
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                                  overlayColor: MaterialStateProperty.all(Colors.black12),
                                  elevation: MaterialStateProperty.all(0),
                                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(Colors.amber),

                                  foregroundColor: MaterialStateProperty.all(Colors.black),
                                  padding: MaterialStateProperty.all(const EdgeInsets.only(top: 10, bottom: 10,right: 10, left: 10)),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 12))),
                              child: Text(
                                profilePage.body.logoutDialog.logoutAllDevices!.data,
                                style:

                                TextStyle(
                                  fontFamily: "${lng.header2.textFamily}",
                                  color: Color(int.parse(profilePage?.body.logoutDialog.logoutAllDevices!.color as String)),
                                  fontSize: lng?.header2.size.toDouble(),

                                ),
                                // TextStyle(
                                //   fontFamily: getTranslated(context, "fontFamilyBody")!,
                                //   color: Colors.white,
                                //   fontWeight: FontWeight.w300,),


                                textAlign: TextAlign.center,),


                            ),

                            ElevatedButton(

                              onPressed: () {
                                Provider.of<AuthProvider>(context, listen: false).logOutUserDetailsLocally().then((value) {
                                  Navigator.pop(context);
                                  SnackbarGenerator(context).snackBarGeneratorToast("User Logged out successfully",);
                                });
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                                  overlayColor: MaterialStateProperty.all(Colors.black12),
                                  elevation: MaterialStateProperty.all(0),
                                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                                  backgroundColor: MaterialStateProperty.all(Colors.amber),

                                  foregroundColor: MaterialStateProperty.all(Colors.black),
                                  padding: MaterialStateProperty.all(const EdgeInsets.only(top: 10, bottom: 10,right: 10, left: 10)),
                                  textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 12))),
                              child: Text(
                                profilePage.body.logoutDialog.logoutOnDevice!.data,
                                style:  TextStyle(
                                  fontFamily: "${lng.header2.textFamily}",
                                  color: Color(int.parse(profilePage?.body.logoutDialog.logoutOnDevice!.color as String)),
                                  fontSize: lng?.header2.size.toDouble(),

                                ),
                                textAlign: TextAlign.center,),

                              // Text(
                              //   getTranslated(context, "sighOut")!,
                              //   style: TextStyle(
                              //     fontFamily: getTranslated(
                              //         context, "fontFamilyBody")!,
                              //     color: Colors.white,
                              //     fontSize: 17,
                              //     fontWeight: FontWeight.w300,),
                              //   textAlign: TextAlign.center,),
                            ),

                          ],

                        ),
                      ),
                    )
                ),
              ),
              Positioned(
                top: 1,
                right: 20,
                child:  SizedBox(
                  width:40,
                  height:40,

                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);

                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  side: BorderSide(color: Colors.transparent,width: 1)
                              )
                          ),
                          overlayColor: MaterialStateProperty.all(Colors.white30),
                          elevation:MaterialStateProperty.all(0),
                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                      child: const Icon(Icons.close, color: Colors.white,)
                  ),
                ),),
            ],
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

}
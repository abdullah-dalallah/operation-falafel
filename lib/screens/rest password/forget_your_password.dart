import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/data/strings.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/screens/rest%20password/reset_your_password.dart';
import 'package:operation_falafel/screens/verify_user_screen.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../models/AppThemeModels/DesignPerPage/ForgetPasswordPage/forget_password_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';

class ResetYourPassword extends StatefulWidget{
  static const routeName = '/ResetYourPassword';
   ValueChanged? onChanged;
   String? layOut ;
   ResetYourPassword({super.key, this.layOut,this.onChanged,});
  @override
  State<ResetYourPassword> createState() => _ResetYourPasswordState();
}

class _ResetYourPasswordState extends State<ResetYourPassword> {

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  TextEditingController mobileController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    // Get the language set as default on the users phone
    // String? systemCountryCode = window.locale.countryCode;
    countryCode= CountryCode(code: "AE",name: "United Arab Emirates",dialCode: "+971" );


  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      ForgetPasswordPage? forgetPasswordPage = appTheme.appTheme.designPerPage?.forgetPasswordPage;
      bool loadingDesign = forgetPasswordPage != null;

      return
        (loadingDesign)?

            Stack(
               children: [
                 Background(),
                 Scaffold(
                    resizeToAvoidBottomInset: false, // Prevents resizing when the keyboard appears
                    backgroundColor: Colors.transparent,
                   extendBodyBehindAppBar: true,
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
                      // title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
                      // actions: [],
                    ),
                    body: Center(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 450,),
                            child: Form(
                              key: _formKey,
                              child: Column(

                                children: [
                                  // const SizedBox(height: 50,),
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Image.asset(
                                            "assets/images/forget_graphic.png",
                                            height: 280,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(height: 30,),
                                        Text(
                                          forgetPasswordPage.pageTile.data,
                                          style: TextStyle(
                                              fontFamily: lng?.titleHeader2.textFamily,
                                              color: Color(int.parse(forgetPasswordPage.pageTile.color)),
                                              fontSize: double.parse(
                                                  getTranslated(context, "welcomeBackTitle")!),
                                              height: 1
                                          ),
                                          textAlign: TextAlign.center,),
                                        // Text(getTranslated(context, "resetYourPassword")!,
                                        //   style: TextStyle(fontFamily: getTranslated(
                                        //       context, "fontFamilyButtons"),
                                        //       color: Colors.amber,
                                        //       fontSize: double.parse(
                                        //           getTranslated(context, "welcomeBackTitle")!),
                                        //       height: 1), textAlign: TextAlign.center,),

                                        const SizedBox(height: 30,),

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
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                /// - Phone number Textfield title
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 8, right: 8, bottom: 5),
                                                  child:

                                                  Text(
                                                    forgetPasswordPage.form.phoneNumber.data,
                                                    style: TextStyle(
                                                        fontFamily: lng?.header2.textFamily,
                                                        color: Color(int.parse(forgetPasswordPage.form.phoneNumber.color))),),
                                                  // Text(
                                                  //   "${getTranslated(context, "mobileNo")!} :",
                                                  //   style: TextStyle(fontFamily: getTranslated(
                                                  //       context, "fontFamilyBody")!,
                                                  //       color: Colors.amber),),
                                                ),
                                                /// - Phone number Textfield  ---- Should be separate widget
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex:2,
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
                                                                        padding: const EdgeInsets.only(left: 0, right: 0),
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


                                                          ),
                                                    ),
                                                    Expanded(
                                                      flex: 8,
                                                      child: SizedBox(

                                                        child: TextFormField(
                                                          maxLength: 9,
                                                          controller: mobileController,
                                                          keyboardType: TextInputType.number,
                                                          autofocus: false,
                                                          style: const TextStyle(color: Colors.white),
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.black45,
                                                            contentPadding: EdgeInsets.only(left: 10, right: 10, ),
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




                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10,),


                                        const SizedBox(height: 10,),

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
                                                      borderRadius:const BorderRadius.all(
                                                          Radius.circular(100)),
                                                      splashColor: Colors.black45,
                                                      overlayColor: MaterialStateProperty.all<
                                                          Color>(Colors.black54),

                                                      onTap: () {
                                                            _submitForm();


                                                        // PersistentNavBarNavigator.pushNewScreen(
                                                        //   context,
                                                        //   screen: ForgetPassword(),
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


                                ],
                              ),
                            ),
                          ),
                        ),

                  ),
               ],
             )

            :LoadingPage();
    });

  }

  final _formKey = GlobalKey<FormState>();



  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform your registration logic here
      // You can use the collected form data to create a new user account or make an API call


      print(mobileController.text);
      print(countryCode!.dialCode);
      String fullMobileNumber ="${countryCode!.dialCode.substring(1,countryCode!.dialCode.length)}${mobileController.text}";
      print(fullMobileNumber);/// - Done



      print("sending request!");
      Provider.of<AuthProvider>(context, listen: false).forgetPasswordRequestOTP(mobileNumber: fullMobileNumber).then((res) {
        if(res.statusCode ==200){
          SnackbarGenerator(context).snackBarGeneratorToast("OTP Sent Successfully!",);
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: VerifyUserScreen(
              statusString:"${res.data[Keys.bodyKey]}" ,
         phoneNumber: fullMobileNumber,
              layOut: widget.layOut!, (value) {
              widget.onChanged!(value);
            },
              verifyPurpose: Strings.resetPasswordPurpose,

            ),
            withNavBar: true,
            // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation
                .cupertino,
          );
        }else{
              if(res.data[Keys.messageKey]!=null){
                SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.messageKey]}",);
              }
              SnackbarGenerator(context).snackBarGeneratorToast("Failed Try again!",);
        }



      });




      // Provider.of<AuthProvider>(context, listen: false).userRegistration(
      //     name: nameController.text,
      //     mobile: fullMobileNumber,
      //     email: emailController.text,
      //     dateOfBirth: birthDateController.text,
      //     password: passwordController.text,
      //     nationalityId: "${selectedNationalValue["id"]}",
      //     gender: selectedGenderValue
      //
      // ).then((res) {
      //   if(res.statusCode==200){
      //     SnackbarGenerator(context).snackBarGeneratorToast("Registration Successful!",);
      //     Provider.of<AuthProvider>(context, listen: false).verifyingUserByRequestingOTP(
      //         userToken: Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!
      //     ).then((res) {
      //       if(res.statusCode ==200){
      //         // clearForm();
      //         setState(() {
      //           verifyUser= true;
      //         });
      //       }
      //     });
      //
      //
      //
      //   }
      //   else {
      //     if(res.data[Keys.messageKey]!=null){
      //       SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.messageKey]}",);
      //     }
      //     SnackbarGenerator(context).snackBarGeneratorToast("Registration Failed!",);
      //   }
      // });






      // print('Gender: $_gender');
    }
  }

}
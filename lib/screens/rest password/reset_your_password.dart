import 'package:flutter/material.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/data/strings.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/models/AppThemeModels/DesignPerPage/ResetPasswordPage/reset_password_page.dart';
import 'package:operation_falafel/models/AppThemeModels/FontSizes/Language/lang.dart';
import 'package:operation_falafel/providers/AppTheme/theme_provider.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget{
  String? otp ;
  final String forgetOrUpdateFlag ;
  String? phoneNumber ;
  ForgetPassword({super.key, this.otp, required this.forgetOrUpdateFlag,  this.phoneNumber});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  TextEditingController currentPasswordController = new TextEditingController();
  bool _validateCurrentPaassword =false;
  bool _validateNewPaassword =false;
  bool _validateConfrimNewPaassword =false;
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController confirmNewPasswordController = new TextEditingController();

  bool _obscureTextcurrentPassword = true;
  void _toggleCurrentPasswordVisibility() {
    print(_obscureTextcurrentPassword);
    setState(() {
      _obscureTextcurrentPassword = !_obscureTextcurrentPassword;
    });
  }
  bool _obscureTextNewPassword = true;
  void _toggleNewPasswordVisibility() {
    print(_obscureTextNewPassword);
    setState(() {
      _obscureTextNewPassword = !_obscureTextNewPassword;
    });
  }
  bool _obscureTextConfirmNewPassword = true;
  void _toggleConfirmNewPasswordVisibility() {
    print(_obscureTextConfirmNewPassword);
    setState(() {
      _obscureTextConfirmNewPassword = !_obscureTextConfirmNewPassword;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      ResetPasswordPage? resetPasswordPage = appTheme.appTheme.designPerPage?.resetPasswordPage;
      bool loadingDesign = resetPasswordPage != null;

      return
        (loadingDesign)?
        Stack(
        children: [
          Background(),
          Scaffold(
            // resizeToAvoidBottomInset: false,
            // Prevents resizing when the keyboard appears
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
              // title: Text("${widget.otp}/  ${widget.phoneNumber}")
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

                            /// - Title
                            Center(
                              child: Stack(

                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 45.0, right: 20, left: 20),
                                    child: Text("${resetPasswordPage.pageTile!.data!}",
                                      style: TextStyle(
                                          fontFamily: getTranslated(context, "fontFamilyButtons"),
                                          color: Colors.amber,
                                          fontSize: 55,
                                          height: 1),
                                      textAlign: TextAlign.center,),
                                  ),
                                  Positioned(left: 1, top: 1,
                                    child: RotationTransition(
                                      turns: const AlwaysStoppedAnimation(
                                          -15 / 150),
                                      child: Image.asset(
                                        "assets/images/arrow_down.png",
                                        height: 45,
                                        color: Colors.white,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),),
                                  Positioned(
                                    right: 1, bottom: 1,
                                    child: RotationTransition(
                                      turns: const AlwaysStoppedAnimation(
                                          -15 / 600),
                                      child: Image.asset(
                                        "assets/images/swirl_new.png",
                                        height: 60,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30,),


                            /// - current Password
                            Visibility(
                              visible: (widget.forgetOrUpdateFlag==Strings.forgetPassword)?false:true,
                              child: Column(
                                children: [
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, bottom: 5),
                                            child:

                                            Text(
                                              "${resetPasswordPage.form!.currentPassword!.data}*",
                                              style: TextStyle(
                                                  fontFamily: lng?.header2.textFamily,
                                                  color: Color(int.parse( resetPasswordPage.form!.currentPassword!.color))),),
                                            // Text(
                                            //   "Current Password*",
                                            //   style: TextStyle(
                                            //       fontFamily: getTranslated(
                                            //           context, "fontFamilyBody")!,
                                            //       color: Colors.amber),),
                                          ),

                                          TextFormField(
                                            controller: currentPasswordController,
                                            obscureText: _obscureTextcurrentPassword,
                                            enableSuggestions: false,
                                            autocorrect: false,
                                            autofocus: false,
                                            style: const TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.black45,
                                              contentPadding: const EdgeInsets.only(
                                                  left: 10, right: 10,  bottom: 0,top: 13),
                                              focusedBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,),
                                              ),
                                              enabledBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              suffixIcon: GestureDetector(
                                                onTap: _toggleCurrentPasswordVisibility,
                                                child:
                                                !_obscureTextcurrentPassword ? Icon(
                                                  Icons.visibility_rounded,
                                                  color: Colors.grey,) : Icon(
                                                    Icons.visibility_off_rounded,
                                                    color: Colors.grey),
                                              ),
                                              hintText: '',

                                              // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter a password';
                                              } else
                                              if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()\-+=<>?]).{6,30}$')
                                                  .hasMatch(value)) {
                                                setState(() {
                                                  _validateCurrentPaassword = true;
                                                });
                                                return '';
                                              }
                                              setState(() {
                                                _validateCurrentPaassword = false;
                                              });
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Visibility(
                                    visible: _validateCurrentPaassword,
                                    child: Row(
                                      children: [
                                        Expanded(child: SizedBox(width: 10,)),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/page2orders_icon.png",
                                                    height: 10,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    "Password must be 6-30 characters",
                                                    style: TextStyle(
                                                        color: Colors.red),)
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/page2orders_icon.png",
                                                    height: 10,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    "Password must be contain only letters",
                                                    style: TextStyle(
                                                        color: Colors.red),)
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/page2orders_icon.png",
                                                    height: 10,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    "Password must be contain numbers",
                                                    style: TextStyle(
                                                        color: Colors.red),)
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/page2orders_icon.png",
                                                    height: 10,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    "Password must be contain \nspecial characters (!@#\$%^&*())",
                                                    style: TextStyle(
                                                        color: Colors.red),)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                ],
                              ),
                            ),


                            /// - new password
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0,
                                  right: 18),
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

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 5),
                                      child:

                                      Text(
                                        "${resetPasswordPage.form!.newPassword!.data}*",
                                        style: TextStyle(
                                            fontFamily: lng?.header2.textFamily,
                                            color: Color(int.parse(resetPasswordPage.form!.newPassword!.color))),),

                                    ),

                                    TextFormField(
                                      controller: newPasswordController,
                                      obscureText: _obscureTextNewPassword,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: const EdgeInsets.only(
                                            left: 10, right: 10,  bottom: 0,top: 13),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0),
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: _toggleNewPasswordVisibility,
                                          child:
                                          !_obscureTextNewPassword ? Icon(
                                            Icons.visibility_rounded,
                                            color: Colors.grey,) : Icon(
                                              Icons.visibility_off_rounded,
                                              color: Colors.grey),
                                        ),
                                        hintText: '',

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter New password';
                                        } else
                                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()\-+=<>?]).{6,30}$')
                                            .hasMatch(value)) {
                                          setState(() {
                                            _validateNewPaassword = true;
                                          });
                                          return '';
                                        }
                                        setState(() {
                                          _validateNewPaassword = false;
                                        });
                                        return null;
                                      },
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Visibility(
                              visible: _validateNewPaassword,
                              child: Row(
                                children: [
                                  const  Expanded(child: SizedBox(width: 10,)),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              "assets/images/page2orders_icon.png",
                                              height: 10,),
                                            SizedBox(width: 5,),
                                            Text(
                                              "Password must be 6-30 characters",
                                              style: TextStyle(
                                                  color: Colors.red),)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              "assets/images/page2orders_icon.png",
                                              height: 10,),
                                            SizedBox(width: 5,),
                                            Text(
                                              "Password must be contain only letters",
                                              style: TextStyle(
                                                  color: Colors.red),)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              "assets/images/page2orders_icon.png",
                                              height: 10,),
                                            SizedBox(width: 5,),
                                            Text(
                                              "Password must be contain numbers",
                                              style: TextStyle(
                                                  color: Colors.red),)
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              "assets/images/page2orders_icon.png",
                                              height: 10,),
                                            SizedBox(width: 5,),
                                            Text(
                                              "Password must be contain \nspecial characters (!@#\$%^&*())",
                                              style: TextStyle(
                                                  color: Colors.red),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            /// - confirm new password
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0,
                                  right: 18),
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

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 5),
                                      child:

                                      Text(
                                      "${ resetPasswordPage.form!.confirmPassword!.data}*",
                                        style: TextStyle(
                                            fontFamily: lng?.header2.textFamily,
                                            color: Color(int.parse(resetPasswordPage.form!.confirmPassword!.color))),),
                                      // Text(
                                      //   "Confirm Password*",
                                      //   style: TextStyle(
                                      //       fontFamily: getTranslated(
                                      //           context, "fontFamilyBody")!,
                                      //       color: Colors.amber),),
                                    ),

                                    TextFormField(
                                      controller: confirmNewPasswordController,
                                      obscureText: _obscureTextConfirmNewPassword,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 0,top: 13),
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0),
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: _toggleConfirmNewPasswordVisibility,
                                          child:
                                          !_obscureTextConfirmNewPassword ? const Icon(
                                            Icons.visibility_rounded,
                                            color: Colors.grey,) : const Icon(
                                              Icons.visibility_off_rounded,
                                              color: Colors.grey),
                                        ),
                                        hintText: '',

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Confirm password';
                                        } else
                                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()\-+=<>?]).{6,30}$').hasMatch(value)) {
                                          setState(() {
                                            _validateConfrimNewPaassword = true;
                                          });
                                          return '';
                                        }
                                        else if (value != newPasswordController.text){

                                          return 'Confirm Password not match New password!';
                                        }
                                        setState(() {
                                          _validateConfrimNewPaassword = false;
                                        });
                                        return null;
                                      },
                                    ),


                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Visibility(
                              visible: _validateConfrimNewPaassword,
                              child: Row(
                                children: [
                                  Expanded(child: SizedBox(width: 10,)),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              "assets/images/page2orders_icon.png",
                                              height: 10,),
                                            SizedBox(width: 5,),
                                            Text(
                                              "Password must be 6-30 characters",
                                              style: TextStyle(
                                                  color: Colors.red),)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              "assets/images/page2orders_icon.png",
                                              height: 10,),
                                            SizedBox(width: 5,),
                                            Text(
                                              "Password must be contain only letters",
                                              style: TextStyle(
                                                  color: Colors.red),)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              "assets/images/page2orders_icon.png",
                                              height: 10,),
                                            SizedBox(width: 5,),
                                            Text(
                                              "Password must be contain numbers",
                                              style: TextStyle(
                                                  color: Colors.red),)
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset(
                                              "assets/images/page2orders_icon.png",
                                              height: 10,),
                                            SizedBox(width: 5,),
                                            Text(
                                              "Password must be contain \nspecial characters (!@#\$%^&*())",
                                              style: TextStyle(
                                                  color: Colors.red),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100)),
                                          splashColor: Colors.black45,
                                          overlayColor: MaterialStateProperty.all<
                                              Color>(Colors.black54),

                                          onTap: () {
                                            _submitForm();
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform your registration logic here
      // You can use the collected form data to create a new user account or make an API call

      if(widget.phoneNumber!= null){print(widget.phoneNumber);}
      if(widget.otp!= null){print(widget.otp);}
      print(currentPasswordController.text);
      print(newPasswordController.text);
      print(confirmNewPasswordController.text);


      if(widget.forgetOrUpdateFlag==Strings.forgetPassword){
        Provider.of<AuthProvider>(context, listen: false).resetPasswordByOTP(mobileNumber:widget.phoneNumber!, OTP: widget.otp!,newPassword: newPasswordController.text, confirmPassword: confirmNewPasswordController.text )
            .then((res) {
          if(res.statusCode ==200){
            SnackbarGenerator(context).snackBarGeneratorToast("Password reset Successfully!",);
            Navigator.of(context)
              ..pop()
              ..pop()
              ..pop();

          }else{

            if (res.data is List) {
              SnackbarGenerator(context).snackBarGeneratorToast("Failed Try again!",);
            } else if (res.data is Map<String, dynamic>) {
              if(res.data[Keys.messageKey]!=null){
                SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.messageKey]}",);
                if( res.data[Keys.messageKey]== "OTP Not Correct. Kindly check and try again"){
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                }
              }
            }


          }



        });
      }
      else if(widget.forgetOrUpdateFlag ==Strings.updatePassword)
      {
        var authInfo = Provider.of<AuthProvider>(context, listen: false);
        Provider.of<AuthProvider>(context, listen: false).resetPasswordByOldPassword(userToken: authInfo.loggedInUser!.token!,newPassword: newPasswordController.text, confirmPassword: confirmNewPasswordController.text,oldPassword:currentPasswordController.text )
            .then((res) {
          if(res.statusCode ==200){
            SnackbarGenerator(context).snackBarGeneratorToast("Password reset Successfully!",);
            Navigator.of(context).pop();

          }else{

            if (res.data is List) {
              SnackbarGenerator(context).snackBarGeneratorToast("Failed Try again!",);
            } else if (res.data is Map<String, dynamic>) {
              if(res.data[Keys.messageKey]!=null){
                SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.messageKey]}",);
                if( res.data[Keys.messageKey]== "OTP Not Correct. Kindly check and try again"){
                  Navigator.of(context).pop();
                }
              }
            }


          }



        });
      }






    }
  }


}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/data/strings.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/screens/profile/logged_in_user_profile.dart';
import 'package:operation_falafel/screens/rest%20password/reset_your_password.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyUserByOtpWidget extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  final String verifyPurpose;
  String? phoneNumber;
  String? statusString;
  VerifyUserByOtpWidget(this.onChanged,{super.key,required this.layOut, required this.verifyPurpose , this.phoneNumber, this.statusString});

  @override
  State<VerifyUserByOtpWidget> createState() => _VerifyUserByOtpWidgetState();
}

class _VerifyUserByOtpWidgetState extends State<VerifyUserByOtpWidget> {



   TextEditingController _otpControllers  = new TextEditingController();



  void _verifyOTP() {

    String otp = _otpControllers.text;
    // Perform your verification logic here
    // You can check if the entered OTP matches the expected OTP or make an API call to verify it
    if (otp.isNotEmpty) {
      var authProvider =  Provider.of<AuthProvider>(context, listen: false);

      authProvider.verifyingUserBySendingOTP(userToken:authProvider.loggedInUser!.token!,  OTP:otp).then((res) {

        if(res.statusCode == 200){
          // OTP is correct, perform desired action

          SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.bodyKey]}",);
          print('OTP Verified!');

          if(widget.verifyPurpose == Strings.registrationPurpose) {
            Provider.of<ProfileProvider>(context, listen: false).getUserInfo(authProvider.loggedInUser!.token!, authProvider!.email!, authProvider!.password!).then((res){
            if(res.statusCode==200) {
              SnackbarGenerator(context).snackBarGeneratorToast("User Verified successfully",);
              Navigator.pop(context);
            }
          });
          }
          else{
            Navigator.pop(context);
          }



          // PersistentNavBarNavigator.pushNewScreen(
          //   context,
          //
          //   screen: LoggedInUserProfile(
          //       layOut: widget.layOut, (value) {
          //     widget.onChanged(value);
          //   }),
          //   withNavBar: true,
          //   // OPTIONAL VALUE. True by default.
          //   pageTransitionAnimation: PageTransitionAnimation
          //       .cupertino,
          // );

        }else{
          SnackbarGenerator(context).snackBarGeneratorToast("Please Try Again!",);
        }

      });



      // TODO: Implement your logic here
    } else {
      // OTP is incorrect, show an error message or perform an action
      print('Invalid OTP!');
      // TODO: Implement your logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);

    return  Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${getTranslated(context, "verifyYourIdentity")}", style: TextStyle(
                fontFamily: getTranslated(context, "fontFamilyBody"),
                color:  Colors.amber,
                fontSize: double.parse(getTranslated(context, "cartpageHeader2")!),
                fontWeight: FontWeight.w300),),
            const SizedBox(height: 20,),
            Text("${getTranslated(context, "verifyYourIdentityMsg")}", style: TextStyle(
                fontFamily: getTranslated(context, "fontFamilyBody"),
                color:  Colors.white54,
                fontSize: double.parse(getTranslated(context, "cartpageHeader3")!),
                fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            Text("${widget.statusString}", style: TextStyle(
                fontFamily: getTranslated(context, "fontFamilyBody"),
                color:  Colors.amber,
                fontSize: double.parse(getTranslated(context, "cartpageHeader3")!),
                fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            PinCodeTextField(

              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              backgroundColor:Colors.transparent,
              keyboardType:TextInputType.number ,

              pinTheme: PinTheme(

                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.black38,
                selectedFillColor: Colors.black38,
                  errorBorderColor: Colors.red,
                  inactiveColor:Colors.black38,
                activeColor: Colors.amber,
                selectedColor: Colors.amber,
                inactiveFillColor: Colors.grey.withOpacity(0.5),
                disabledColor: Colors.amber

              ),
              animationDuration: Duration(milliseconds: 300),
              enabled: (widget.statusString!="OTP limit reached. Try tomorrow")?true:false,

              enableActiveFill: true,
              textStyle: TextStyle(color: Colors.white60),
              controller: _otpControllers,
              onCompleted: (value) {

                print("Completed");
                if(widget.verifyPurpose==Strings.resetPasswordPurpose){
                  String otp = _otpControllers.text;
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: ForgetPassword(otp: "${otp}", forgetOrUpdateFlag: Strings.forgetPassword, phoneNumber: widget.phoneNumber!),
                    withNavBar: true,
                    // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation
                        .cupertino,
                  );
                }
                else if(widget.verifyPurpose == Strings.registrationPurpose){
                  _verifyOTP();
                }

              },
              onChanged: (value) {
                print(value);
                setState(() {

                });
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),

            const SizedBox(height: 16.0),
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
                    decoration:  BoxDecoration(
                      color: (widget.statusString!="OTP limit reached. Try tomorrow")?Colors.amber:Colors.grey,
                      borderRadius:const BorderRadius.only(
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

                            if(widget.statusString!="OTP limit reached. Try tomorrow") {
                              print("Completed");
                              if(widget.verifyPurpose==Strings.resetPasswordPurpose){
                            String otp = _otpControllers.text;
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ForgetPassword(otp: "${otp}", forgetOrUpdateFlag: Strings.forgetPassword , phoneNumber: widget.phoneNumber!,),
                              withNavBar: true,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation
                                  .cupertino,
                            );
                          }
                          else if(widget.verifyPurpose == Strings.registrationPurpose){
                            _verifyOTP();
                          }
                            }else{
                              print("Not Completed");
                            }

                          },
                        ),

                      )
                  ),

                ],
              ),
            ),


          ],
        ),
      )
   ;

  }
}
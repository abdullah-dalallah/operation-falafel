import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/reset_your_password.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../data/keys.dart';
import '../../data/snackBarGenerator.dart';
import '../../data/strings.dart';
import '../../localization/localization_constants.dart';
import '../../models/AppThemeModels/DesignPerPage/LoginPage/login_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../providers/AuthProvider/auth_provider.dart';
import '../profile/logged_in_user_profile.dart';
import 'package:email_validator/email_validator.dart';


class Login extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const Login(this.onChanged,{super.key,required this.layOut});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _securePassword = true;

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoginPage? loginPage = appTheme.appTheme.designPerPage?.loginPage;
      bool loadingDesign = loginPage != null;

      return
        (loadingDesign)?
        Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png",),
              fit: BoxFit.cover,
            )
        ),
        child: Scaffold(
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
            // title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            // actions: [],
          ),
          body: Form(
            key: _formKey,
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 450,),
                child: Column(

                  children: [
                    // const SizedBox(height: 50,),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Image.asset(
                              "assets/images/page4_image_new.png",
                              height: 280,
                              // fit: BoxFit.cover,
                            ),
                          ),

                          Text(
                            loginPage.pageTile.data,
                            style: TextStyle(
                                fontFamily: lng?.titleHeader2.textFamily,
                                color: Color(int.parse(loginPage.pageTile.color)),
                                fontSize: double.parse(getTranslated(context, "welcomeBackTitle")!),
                                height: 1
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Text(getTranslated(context, "welcomeBack")!,
                          //   style: TextStyle(fontFamily: getTranslated(
                          //       context, "fontFamilyButtons"),
                          //       color: Colors.amber,
                          //       fontSize: double.parse(
                          //           getTranslated(context, "welcomeBackTitle")!),
                          //       height: 1), textAlign: TextAlign.center,),


                          const SizedBox(height: 30,),

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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, bottom: 5),
                                    child:
                                    Text(
                                      loginPage.form.email.data,
                                      style: TextStyle(
                                          fontFamily: lng?.header2.textFamily,
                                          color: Color(int.parse(loginPage.form.email.color))),),
                                    // Text("${getTranslated(context, "emailAddress")!} :",
                                    //   style: TextStyle(fontFamily: getTranslated(
                                    //       context, "fontFamilyBody")!,
                                    //       color: Colors.amber),),
                                  ),
                                  SizedBox(

                                    child: TextFormField(
                                      controller: _controllerEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email';
                                        } else if (!EmailValidator.validate(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                      autofocus: false,
                                      style:const TextStyle(color: Colors.white),
                                      decoration:const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding: EdgeInsets.only(
                                            left: 10, right: 10),
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

                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, bottom: 5),
                                    child:        Text(
                                      loginPage.form.password.data,
                                      style: TextStyle(
                                          fontFamily: lng?.header2.textFamily,
                                          color: Color(int.parse(loginPage.form.password.color))),),
                                  ),
                                   SizedBox(
                                    child: TextFormField(
                                      controller: _controllerPassword,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your password';
                                        } else if (value!.length < 6 || value!.length>10) {
                                          return 'The Password should be between 6 and 10 digits';
                                        }
                                        return null;
                                      },
                                      obscureText: _securePassword,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      autofocus: false,
                                      style: const TextStyle(color: Colors.white),
                                      decoration:  InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black45,
                                        contentPadding:const EdgeInsets.only(left: 10, right: 10,top: 13),
                                        focusedBorder:const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,),
                                        ),
                                        enabledBorder:const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 0.0),
                                        ),
                                        suffixIcon: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: (){
                                          setState(() {
                                            if(_securePassword==true){
                                              _securePassword =false;
                                            }
                                            else
                                             {
                                               _securePassword =true;
                                             }

                                                  });
                                          }, icon: Icon( _securePassword ? Icons.visibility : Icons.visibility_off, color: Colors.amber,)),
                                        hintText: '',
                                        // label: Text(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                      ),

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 18.0, left: 18),
                                child: RichText(
                                  text: TextSpan(
                                    text: "",
                                    style: TextStyle(color: Colors.amber,
                                        fontSize: lng?.header3.size.toDouble(),
                                        fontWeight: FontWeight.w300,
                                        fontFamily: lng?.header3.textFamily
                                    ),
                                        // fontFamily: getTranslated(context, "fontFamilyBody")),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: loginPage.form.forgetPassword.data,
                                        // text: getTranslated(context, "forgetPassword"),
                                        style: const TextStyle(decoration: TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            PersistentNavBarNavigator
                                                .pushNewScreen(
                                              context,
                                              screen: ResetYourPassword(
                                                  layOut: widget.layOut, (value) {
                                                widget.onChanged(value);
                                              }),
                                              withNavBar: true,
                                              // OPTIONAL VALUE. True by default.
                                              pageTransitionAnimation: PageTransitionAnimation
                                                  .cupertino,
                                            );
                                          }

                                    ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                                        splashColor: Colors.black45,
                                        overlayColor: MaterialStateProperty.all<
                                            Color>(Colors.black54),

                                        onTap: () {
                                          if (!_formKey.currentState!.validate()) {

                                            // Invalid!
                                            return;
                                          }


                                          _formKey.currentState!.save();




                                          if(_controllerPassword.text.isNotEmpty && _controllerEmail.text.isNotEmpty){
                                            Provider.of<AuthProvider>(context, listen: false).userLogin(_controllerEmail.text,_controllerPassword.text).then((response) {
                                              if(response.statusCode==200){

                                                SnackbarGenerator(context).snackBarGeneratorToast("User Logged in successfully",);
                                                Navigator.pop(context);


                                              }else{
                                                SnackbarGenerator(context).snackBarGeneratorToast(response.data[Keys.bodyKey],);
                                              }
                                            });
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
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      )
      :const LoadingPage();
    });

  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/my_text_form_field.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import '../../../models/AppThemeModels/DesignPerPage/Loyalty-SendAsGiftPage/loyalty_send_as_gift_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';
import '../../register & login pages/login.dart';

class GiftFriend extends StatefulWidget{
  static const routeName = 'GiftsFriend';
  @override
  State<GiftFriend> createState() => _GiftFriendState();
}

class _GiftFriendState extends State<GiftFriend> {



  final _formKey = GlobalKey<FormState>();
  final countryPicker = const FlCountryCodePicker();
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  CountryCode? countryCode;


  @override
  void initState() {
    super.initState();
    // Get the language set as default on the users phone
    // String? systemCountryCode = window.locale.countryCode;
    countryCode= CountryCode(code: "AE",name: "United Arab Emirates",dialCode: "+971" );


  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Consumer2<ThemeProvider, AuthProvider>(builder: (context, appTheme, authProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      LoyaltySendAsGiftPage? loyaltySendAsGiftPage = appTheme.appTheme.designPerPage?.loyaltySendAsGiftPage;
      bool loadingDesign = loyaltySendAsGiftPage != null;


      return
        (loadingDesign)?
        Stack(
        children: [
          Background(),
          // Image.asset(
          //   "assets/images/background.png",
          //   height: MediaQuery
          //       .of(context)
          //       .size
          //       .height,
          //   width: MediaQuery
          //       .of(context)
          //       .size
          //       .width,
          //   fit: BoxFit.cover,
          // ),
          Scaffold(
            key: _drawerKey,
            backgroundColor: Colors.transparent,
            appBar:  AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(loyaltySendAsGiftPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltySendAsGiftPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(loyaltySendAsGiftPage.appBar.backIcon.imageIcon),
                  size: double.parse(loyaltySendAsGiftPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: MyText(
                loyaltySendAsGiftPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 450,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network("${loyaltySendAsGiftPage.body.pageImage}", height: 60, width: 60,),
                        // Image.asset("assets/images/gift.png", height: 60, width: 60,),
                        SizedBox(width: 15,),

                        MyText(
                          loyaltySendAsGiftPage.body.pageTitle.data,
                          style: TextStyle(
                              fontFamily: lng?.titleHeader1.textFamily,
                              color: Color(int.parse(loyaltySendAsGiftPage.body.pageTitle.color)),
                              fontSize: lng?.titleHeader1.size.toDouble()),
                        ),

                        // MyText(
                        //   getTranslated(context, "giftfriend")!,
                        //   style: TextStyle(
                        //       fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                        //       color: Colors.white,
                        //       fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),
                        // ),

                        SizedBox(width: 15,),

                        Image.network("${loyaltySendAsGiftPage.body.pageImage}", height: 60, width: 60,),

                      ],
                    ),

                    const SizedBox(height: 50,),

                    Expanded(
                      child: Form(
                        key:_formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ListView(
                            children: [

                              /// - Name
                              MyTextFormField(
                                controller: nameController,
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(filled: true,
                                  fillColor: Colors.black45,
                                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
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
                                        color: Colors.transparent,
                                        width: 0.0),
                                  ),
                                  hintText: loyaltySendAsGiftPage.body.form.name.data,
                                  hintStyle: TextStyle(
                                      fontFamily: lng?.header3.textFamily,
                                      color: Color(int.parse(loyaltySendAsGiftPage.body.form.name.color)),
                                      fontSize: lng?.header3.size.toDouble()),

                                  // hintText: getTranslated(context, "name")!,
                                  // hintStyle: TextStyle(fontFamily: getTranslated(
                                  //     context, "fontFamilyBody")!,
                                  //     color: Colors.white38),

                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20,),



                              /// - Phone number
                              Container(
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
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 8, right: 8, bottom: 5),
                                      //   child:
                                      //
                                      //   MyText(
                                      //     forgetPasswordPage.form.phoneNumber.data,
                                      //     style: TextStyle(
                                      //         fontFamily: lng?.header2.textFamily,
                                      //         color: Color(int.parse(forgetPasswordPage.form.phoneNumber.color))),),
                                      //   // MyText(
                                      //   //   "${getTranslated(context, "mobileNo")!} :",
                                      //   //   style: TextStyle(fontFamily: getTranslated(
                                      //   //       context, "fontFamilyBody")!,
                                      //   //       color: Colors.amber),),
                                      // ),
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

                                              child: MyTextFormField(
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
                                                    borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1.0,),
                                                  ),
                                                  focusedErrorBorder: UnderlineInputBorder(
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
                                                  hintText: loyaltySendAsGiftPage.body.form.phoneNumber.data,
                                                  hintStyle: TextStyle(
                                                      fontFamily: lng?.header3.textFamily,
                                                      color: Color(int.parse(loyaltySendAsGiftPage.body.form.phoneNumber.color)),
                                                      fontSize: lng?.header3.size.toDouble()),
                                                  counterText: '',
                                                  // label: MyText(getTranslated(context, "sepecial instructions")!, style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!, color: Colors.white38),),

                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter phone number';
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


                              const SizedBox(height: 20,),

                              /// - Email Address
                              MyTextFormField(
                                controller: emailController,
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(

                                  filled: true,
                                  fillColor: Colors.black45,
                                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
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
                                          color: Colors.transparent,
                                          width: 0.0),
                                    ),
                                  hintText: loyaltySendAsGiftPage.body.form.email.data,
                                  hintStyle: TextStyle(
                                        fontFamily: lng?.header3.textFamily,
                                        color: Color(int.parse(loyaltySendAsGiftPage.body.form.email.color)),
                                        fontSize: lng?.header3.size.toDouble())

                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter email address';
                                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20,),

                              /// - Add Notes
                              MyTextFormField(

                                controller: noteController,
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(

                                  filled: true,
                                  fillColor: Colors.black45,
                                  contentPadding: const EdgeInsets.only(
                                      left: 10, right: 10),
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
                                          color: Colors.transparent,
                                          width: 0.0),
                                    ),
                                  hintText: loyaltySendAsGiftPage.body.form.addNotes.data,
                                  hintStyle: TextStyle(
                                        fontFamily: lng?.header3.textFamily,
                                        color: Color(int.parse(loyaltySendAsGiftPage.body.form.addNotes.color)),
                                        fontSize: lng?.header3.size.toDouble())

                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your message';
                                  }
                                  return null;
                                },
                              ),

                            ],
                          ),
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
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: const BorderRadius.only(
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
                            child: Icon(Icons.check, color: Colors.white,),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: const BorderRadius.only(
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
                              child: Icon(
                                Icons.check, color: Colors.white, size: 30,),
                            ),
                          ),

                           Positioned.fill(
                              child:  Material(
                                color: Colors.transparent,
                                child:  InkWell(
                                  borderRadius:const BorderRadius.all(Radius.circular(100)),
                                  splashColor: Colors.black45,
                                  overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                  onTap: () {
                                    // (authProvider.loggedInUser?.token !=null)?
                                    (submitionLoading!=true)? _submitForm() :null;
                                        // :
                                    // PersistentNavBarNavigator.pushNewScreen(
                                    //   context,
                                    //   screen: Login(layOut: widget.layOut,(value) {widget.onChanged(value);}),
                                    //   withNavBar: true, // OPTIONAL VALUE. True by default.
                                    //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    // );
                                  },
                                ),

                              )
                          ),

                        ],
                      ),
                    ),
                    // Stack(
                    //    children: [
                    //      Container(
                    //        width: 50,
                    //        height: 50,
                    //        decoration: BoxDecoration(
                    //          color: Colors.transparent,
                    //          borderRadius:const BorderRadius.only(
                    //            topRight: Radius.circular(40),
                    //            bottomLeft: Radius.circular(40),
                    //            topLeft: Radius.circular(40),
                    //            bottomRight: Radius.circular(40),
                    //          ),
                    //          // border: Border.all(
                    //          //   width: 0.5,
                    //          //   color: Colors.white,
                    //          //   style: BorderStyle.solid,
                    //          // ),
                    //        ),
                    //        child: Image.asset("assets/images/page4_confirm_button.png",height: 60,width: 60,),
                    //      ),
                    //
                    //      new Positioned.fill(
                    //          child: new Material(
                    //            color: Colors.transparent,
                    //            child:  new InkWell(
                    //              borderRadius: BorderRadius.all(Radius.circular(100)),
                    //              splashColor: Colors.black,
                    //              overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                    //
                    //              onTap: (){
                    //
                    //              },
                    //            ),
                    //
                    //          )
                    //      ),
                    //
                    //    ],
                    //  ),

                    const SizedBox(height: 15,),
                  ],
                ),
              ),
            ),


          )
        ],
      )
      :const LoadingPage()
      ;

    });
  }


  bool submitionLoading= false;
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform your registration logic here
      // You can use the collected form data to create a new user account or make an API call
      setState(() {
        submitionLoading=true;
      });
      String fullMobileNumber ="${countryCode!.dialCode.substring(1,countryCode!.dialCode.length)}${mobileController.text}";

      // print(nameController.text);
      // print(mobileController.text);
      // print(countryCode!.dialCode);
      // print(fullMobileNumber);
      // print(emailController.text);
      // print(messageController.text);
      // print(selectedrecentOrdersValue);


      String token=  Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
      // Provider.of<ContactProvider>(context, listen: false).contactUS(userToken: token,email: emailController.text,name:nameController.text ,contact_reason_id:selectedrecentOrdersValue["id"] ,message: messageController.text,phone: fullMobileNumber).then((res) {
      //
      //   if(res.statusCode ==200){
      //     SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.bodyKey][Keys.messageKey]} has been sent Successfully!",);
      //     clearForm();
      //   }
      //   else{
      //     SnackbarGenerator(context).snackBarGeneratorToast("Failed try again!",);
      //   }
      //
      //   setState(() {
      //     submitionLoading=false;
      //   });
      // });



    }
  }
  clearForm() {
    setState(() {
      nameController.clear();
      mobileController.clear();
      emailController.clear();
      noteController.clear();


    });
  }

}
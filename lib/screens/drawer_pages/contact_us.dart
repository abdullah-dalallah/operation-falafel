

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/contact_provider.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/login.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../models/AppThemeModels/DesignPerPage/Drawer-ContactUsPage/drawer_content_us_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../widgets/loading_page.dart';

class ContactUs extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const ContactUs(this.onChanged,{super.key,required this.layOut});
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {


  List<dynamic> listOfReasons  = [];
  dynamic? selectedrecentOrdersValue;


  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Consumer2<ThemeProvider, AuthProvider>(builder: (context, appTheme,authProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      DrawerContactUsPage? drawerContactUsPage = appTheme.appTheme.designPerPage?.drawerContactUsPage;
      bool loadingDesign = drawerContactUsPage != null;

      return

        (loadingDesign)?
        Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                 ImageIcon(
                  NetworkImage(drawerContactUsPage.appBar.backIcon.imageIcon),
                  size: double.parse(drawerContactUsPage?.appBar.backIcon.mobileSize as String),
                ) :
                 ImageIcon(
                  NetworkImage(drawerContactUsPage.appBar.backIcon.imageIcon),
                  size: double.parse(drawerContactUsPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                drawerContactUsPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Container(
                constraints:const BoxConstraints(maxWidth: 450,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    /// - Title
                    Text(
                      drawerContactUsPage.body.pageTitle.data,
                      style: TextStyle(
                          fontFamily: lng?.titleHeader2.textFamily,
                          color: Color(int.parse(drawerContactUsPage.body.pageTitle.color)),
                          fontSize: lng?.titleHeader2.size.toDouble()

                      ),),
                    // Text(
                    //   getTranslated(context, "contactUsTitle")!,
                    //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                    //       color: Colors.amber,
                    //       fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          drawerContactUsPage.body.promotTitle.data,
                          style: TextStyle(
                              fontFamily: lng?.header5.textFamily,
                              color: Color(int.parse(drawerContactUsPage.body.promotTitle.color)),
                              fontSize: lng?.header5.size.toDouble()
                          ), textAlign: TextAlign.center,
                        ),
                        // Text(getTranslated(context, "pleaseFillTheFormBelow")!,
                        //   style: TextStyle(fontFamily: "${getTranslated(
                        //       context, "fontFamilyBody")!}",
                        //       color: Colors.amber,
                        //       fontSize: 20), textAlign: TextAlign.center,),




                        const SizedBox(width: 10,),
                        (Localizations.localeOf(context).languageCode == 'en') ?
                        Image.asset(
                          "assets/images/page7_right_icon.png", height: 50,) :
                        Image.asset(
                          "assets/images/page7_left_icon.png", height: 50,)
                      ],
                    ),
                    const SizedBox(height: 10,),

                    Expanded(
                        child:
                        Form(
                          key:_formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ListView(
                              children: [

                                /// - Name
                                SizedBox(
                                  // width: 400,
                                  // height: 40,
                                  child: TextFormField(
                                    controller: nameController,
                                    autofocus: false,
                                    style: const TextStyle(color: Colors.white70),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    //Normal textInputField will be displayed
                                    maxLines: 4,
                                    // scrollPadding: EdgeInsets.only(bottom:40),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      //amber.withOpacity(0.1),
                                      contentPadding: const EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          bottom: 10,
                                          right: 10),
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


                                      // getTranslated(context, "name")!,
                                      hintText: drawerContactUsPage.body.form.name.data,
                                      hintStyle: TextStyle(
                                          fontFamily: lng?.header3.textFamily,
                                          // getTranslated(context, "fontFamilyBody")!,
                                          color: Color(int.parse(drawerContactUsPage.body.form.name.color))
                                          // color: Colors.white38

                                      ),

                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),


                                const SizedBox(height: 10,),

                                /// - Email
                                SizedBox(
                                  // width: 400,
                                  // height: 40,
                                  child: TextFormField(
                                    controller: emailController,
                                    autofocus: false,
                                    style: TextStyle(color: Colors.white70),
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    //Normal textInputField will be displayed
                                    maxLines: 4,
                                    // scrollPadding: EdgeInsets.only(bottom:40),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      //amber.withOpacity(0.1),
                                      contentPadding: const EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          bottom: 10,
                                          right: 10),
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
                                      hintText: drawerContactUsPage.body.form.email.data,
                                      hintStyle: TextStyle(
                                          fontFamily: lng?.header3.textFamily,
                                          // getTranslated(context, "fontFamilyBody")!,
                                          color: Color(int.parse(drawerContactUsPage.body.form.name.color))
                                        // color: Colors.white38

                                      ),

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
                                const SizedBox(height: 10,),

                                /// - Phone Number
                               Row(
                                    children: [
                                      Padding(
                                              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
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
                                      Expanded(
                                        child: TextFormField(
                                          controller: mobileController,
                                          autofocus: false,
                                          style: const TextStyle(color: Colors.white70),
                                          keyboardType: TextInputType.number,
                                          maxLength: 9,
                                          minLines: 1,
                                          //Normal textInputField will be displayed
                                          maxLines: 4,
                                          // scrollPadding: EdgeInsets.only(bottom:40),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.black45,
                                            //amber.withOpacity(0.1),
                                            contentPadding: const EdgeInsets.only(
                                                left: 10,
                                                top: 10,
                                                bottom: 10,
                                                right: 10),
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
                                            // hintText: getTranslated(
                                            //     context, "mobileNo")!,
                                            hintText: drawerContactUsPage.body.form.phoneNumber.data,
                                            hintStyle: TextStyle(
                                                fontFamily: lng?.header3.textFamily,
                                                // getTranslated(context, "fontFamilyBody")!,
                                                color: Color(int.parse(drawerContactUsPage.body.form.name.color))
                                              // color: Colors.white38

                                            ),

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
                                    ],
                                  ),

                                const SizedBox(height: 10,),

                                /// - Type of inquiry
                                DropdownButtonFormField2(

                                  scrollbarAlwaysShow: true,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    //Add isDense true and zero Padding.
                                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                    isDense: true,
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    contentPadding: EdgeInsets.only(),
                                    // border: OutlineInputBorder(
                                    //   borderSide: const BorderSide(color: Colors.green, width: 40.0, style: BorderStyle.solid ),
                                    //   borderRadius: BorderRadius.circular(10),
                                    //
                                    // ),
                                    focusColor: Colors.amber,

                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.amber, width: 2.0,),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white60, width: 2.0),
                                    ),

                                    //Add more decoration as you want here
                                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                  ),
                                  isExpanded: true,
                                  hint: Text(
                                    drawerContactUsPage.body.form.inquiryTypeDropDown.labelText.data,
                                    style: TextStyle(
                                        fontSize: lng?.header3.size.toDouble(),
                                        color: Color(int.parse(drawerContactUsPage.body.form.inquiryTypeDropDown.labelText.color)),
                                        fontFamily: lng?.header3.textFamily
                                    ),
                                  ),
                                  // Text(
                                  //   getTranslated(context, "typeOfInquiry")!,
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
                                  buttonHeight: (selectedrecentOrdersValue != null) ? 50 : 50,
                                  buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                                  dropdownDecoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  itemHeight: 30,

                                  items: listOfReasons
                                      .map((reason) =>
                                      DropdownMenuItem<dynamic>(
                                        value: reason,
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Row(
                                              children: [

                                                (selectedrecentOrdersValue != null) ?
                                                (selectedrecentOrdersValue == reason) ?
                                                Image.network(
                                                  drawerContactUsPage.body.form.inquiryTypeDropDown.selectedIcon.imageIcon,
                                                  height:  double.parse(drawerContactUsPage.body.form.inquiryTypeDropDown.selectedIcon.height), width:  double.parse(drawerContactUsPage.body.form.inquiryTypeDropDown.selectedIcon.width),)
                                                    : SizedBox(width: 15,)
                                                    : SizedBox(width: 15,),
                                                SizedBox(width: 5,),
                                                Text(reason[Keys.nameKey],
                                                  style: TextStyle(
                                                      fontSize:lng?.header3.size.toDouble(),
                                                      color: Color(int.parse(drawerContactUsPage.body.form.inquiryTypeDropDown.itemsTitle.color)),
                                                      fontFamily: lng?.header3.textFamily,
                                                  )
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
                                      selectedrecentOrdersValue = value;
                                    });


                                    print(selectedrecentOrdersValue.keys.elementAt(0));
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      selectedrecentOrdersValue = value;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10,),

                                /// - Message
                                TextFormField(
                                 controller: messageController,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 14.0,
                                    color: Colors.white,
                                    fontFamily: getTranslated(context, "fontFamilyBody")!,),
                                  maxLength: 1000,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black45,
                                    //amber.withOpacity(0.1),
                                    contentPadding: const EdgeInsets.only(
                                        left: 10, top: 10, bottom: 10, right: 10),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent, width: 1.0,),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 0.0),
                                    ),
                                    hintText: drawerContactUsPage.body.form.yourmessage.data,
                                    hintStyle: TextStyle(
                                        fontFamily: lng?.header3.textFamily,
                                        color: Color(int.parse(drawerContactUsPage.body.form.yourmessage.color))),
                                    // hintText: getTranslated(context, "message")!,
                                    // hintStyle: TextStyle(
                                    //     fontFamily: getTranslated(
                                    //         context, "fontFamilyBody")!,
                                    //     color: Colors.white38),

                                  ),
                                  minLines: 4,
                                  maxLines: 50,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your message';
                                    }
                                    return null;
                                  },

                                ),
                                SizedBox(
                                    width: 330,
                                    height: 38,
                                    child: ElevatedButton(
                                        onPressed:
                                        (){
                                          (authProvider.loggedInUser?.token !=null)?
                                          (submitionLoading!=true)? _submitForm() :null:
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: Login(layOut: widget.layOut,(value) {widget.onChanged(value);}),
                                            withNavBar: true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                          );
                                        }


                                        ,
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(drawerContactUsPage.body.submitButton.backGroundColor))),
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(Colors.black),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(10.0),
                                                  side: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.5)
                                              )
                                          ),


                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            if(submitionLoading) const  SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            (authProvider.loggedInUser?.token !=null)?
                                                Text(

                                              drawerContactUsPage.body.submitButton.data,
                                              style: TextStyle(
                                                  fontFamily: lng?.header5.textFamily,
                                                  color: Color(int.parse(drawerContactUsPage.body.submitButton.color)),
                                                  fontSize: lng?.header5.size.toDouble()
                                              ),)

                                                :Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      fontFamily: lng?.header5.textFamily,
                                                      color: Color(int.parse(drawerContactUsPage.body.submitButton.color)),
                                                      fontSize: lng?.header5.size.toDouble()
                                                  ),
                                            ),
                                          ],
                                        )


                                    )
                                ),


                              ],

                            ),
                          ),
                        )),


                  ],
                ),
              ),
            ),

          )
        ],
      )

      :LoadingPage();
    });
  }
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    countryCode= CountryCode(code: "AE",name: "United Arab Emirates",dialCode: "+971" );
    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    if(authProvider.loggedInUser?.token!=null) {
      print (authProvider.loggedInUser!.token!);
      Provider.of<ContactProvider>(context, listen: false).getReasonContactUSForm(userToken: authProvider.loggedInUser!.token!).then((res) {
      if(res.statusCode==200){
       setState(() {
         listOfReasons = res.data[Keys.bodyKey];
       });
      }else{
        SnackbarGenerator(context).snackBarGeneratorToast("Please Log in first!",);
      }
    });
    }

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
      Provider.of<ContactProvider>(context, listen: false).contactUS(userToken: token,email: emailController.text,name:nameController.text ,contact_reason_id:selectedrecentOrdersValue["id"] ,message: messageController.text,phone: fullMobileNumber).then((res) {

        if(res.statusCode ==200){
          SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.bodyKey][Keys.messageKey]} has been sent Successfully!",);
          clearForm();
        }
        else{
          SnackbarGenerator(context).snackBarGeneratorToast("Failed try again!",);
        }

        setState(() {
          submitionLoading=false;
        });
      });



    }
  }
  clearForm() {
    setState(() {
      nameController.clear();
      mobileController.clear();
      emailController.clear();
      messageController.clear();
      selectedrecentOrdersValue = null;

    });
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/contact_provider.dart';
import 'package:operation_falafel/screens/register%20&%20login%20pages/login.dart';
import 'package:operation_falafel/widgets/statrsWidgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../models/AppThemeModels/DesignPerPage/Drawer-FeedBackPage/drawer_feedback_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../widgets/loading_page.dart';

class FeedbackPage extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const FeedbackPage(this.onChanged,{super.key,required this.layOut});
  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController commentController = new TextEditingController();
  int _rate = 0;
  void setStars(int rate){
    print("changing to rate ${rate}");

      _rate =rate;



  }
  @override
  Widget build(BuildContext context) {

    return Consumer2<ThemeProvider,AuthProvider>(builder: (context, appTheme,authProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      DrawerFeedBackPage? drawerFeedBackPage = appTheme.appTheme.designPerPage?.drawerFeedBackPage;
      bool loadingDesign = drawerFeedBackPage != null;
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
                  Navigator.of(context)
                    ..pop()
                    ..pop();

                  // Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                 ImageIcon(
                  NetworkImage(drawerFeedBackPage.appBar.backIcon.imageIcon),
                  size: double.parse(drawerFeedBackPage?.appBar.backIcon.mobileSize as String),
                ) :
                 ImageIcon(
                  NetworkImage(drawerFeedBackPage.appBar.backIcon.imageIcon),
                  size: double.parse(drawerFeedBackPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title:  MyText(
                drawerFeedBackPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 450,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    /// - Title
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        Expanded(child: Image.asset(
                          "assets/images/feed_back_im.png", height: 170,
                          width: 170,),),

                      ],
                    ),

                    Expanded(
                        child:
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Form(
                            key:_formKey,
                            child: ListView(
                              children: [
                                StarsWidgets((value) => {setStars(value)}),
                                const SizedBox(height: 10,),
                                MyText(
                                  drawerFeedBackPage.body.promotTitle.data,
                                  style: TextStyle(
                                      fontFamily: "${lng?.header5.textFamily}",
                                      color: Color(int.parse(drawerFeedBackPage.body.promotTitle.color)),
                                      fontSize: lng?.header5.size.toDouble()
                                  ),
                                // MyText(getTranslated(context, "weLoveToHereFromYou")!,
                                //   style: TextStyle(
                                //       fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                //       color: Colors.amber,
                                //       fontSize: 20),
                                  textAlign: TextAlign.center,),
                                const SizedBox(height: 10,),
                                TextFormField(
                                  controller: commentController,
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
                                      hintText: drawerFeedBackPage.body.form.yourComment.data,
                                      // hintText: getTranslated(context, "yourComments")!,
                                      hintStyle: TextStyle(
                                          fontFamily: getTranslated(
                                              context, "fontFamilyBody")!,
                                              color: Color(int.parse(drawerFeedBackPage.body.form.yourComment.color))
                                          // color: Colors.white38
                                      ),


                                    ),
                                    minLines: 4,
                                    maxLines: 50,
                                    keyboardType: TextInputType.multiline,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your comment';
                                      }
                                      return null;
                                    },
                                ),
                                SizedBox(
                                    width: 330,
                                    height: 38,
                                    child: ElevatedButton(
                                        onPressed: (){
                                          (authProvider.loggedInUser?.token !=null)?
                                          (submitionLoading!=true)? _submitForm() :null:
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: Login(layOut: widget.layOut,(value) {widget.onChanged(value);}),
                                            withNavBar: true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(drawerFeedBackPage.body.submitButton.backGroundColor))),
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(Colors.black),
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  side: const BorderSide(color: Colors.transparent, width: 1.5)
                                              )),
                                        ),
                                        child:

                                        Row(
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
                                            const  SizedBox(width: 5,),
                                          (authProvider.loggedInUser?.token !=null)?
                                          MyText(
                                            drawerFeedBackPage.body.submitButton.data,
                                            style: TextStyle(
                                                fontFamily: lng?.header5.textFamily,
                                                color: Color(int.parse(drawerFeedBackPage.body.submitButton.color)),
                                                fontSize: lng?.header5.size.toDouble()),)
                                              :MyText(
                                            "Login",
                                            style: TextStyle(
                                                fontFamily: lng?.header5.textFamily,
                                                color: Color(int.parse(drawerFeedBackPage.body.submitButton.color)),
                                                fontSize: lng?.header5.size.toDouble()
                                            ),
                                          ),
                                        ],),


                                        // MyText(
                                        //   getTranslated(context, "submit")!,
                                        //   style: TextStyle(
                                        //       fontFamily: getTranslated(context, "fontFamilyBody")!,
                                        //       color: Colors.white,
                                        //       fontSize: 20),)

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

  bool submitionLoading= false;

  void _submitForm() {
    print("submit");
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform your registration logic here
      // You can use the collected form data to create a new user account or make an API call
      setState(() {
        submitionLoading=true;
      });



      String token=  Provider.of<AuthProvider>(context, listen: false).loggedInUser!.token!;
      Provider.of<ContactProvider>(context, listen: false).feedBack(userToken: token,message: commentController.text,rate:_rate ).then((res) {

        if(res.statusCode ==200){
          SnackbarGenerator(context).snackBarGeneratorToast("${res.data[Keys.bodyKey][Keys.messageKey]}\nwith Rate:${res.data[Keys.bodyKey][Keys.rateKey]}\nhas been sent Successfully!",);

          Navigator.pop(context);
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


}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/profile/profile_pages/add_new_address.dart';
import 'package:operation_falafel/screens/profile/profile_pages/update_address.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/SavedAddressPage/saved_address_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';
import '../../../providers/AuthProvider/auth_provider.dart';
import '../../../providers/ProfileProviders/profile_provider.dart';
import '../../../widgets/Saved_address/saved_address_list_widget.dart';

class SavedAddress extends StatefulWidget{
  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {




  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      SavedAddressPage? savedAddressPage = appTheme.appTheme.designPerPage?.savedAddressPage;
      bool loadingDesign = SavedAddressPage != null;
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
                                    NetworkImage(savedAddressPage?.appBar.backIcon.imageIcon as String),
                                    size: double.parse(savedAddressPage?.appBar.backIcon.mobileSize as String),
                                  ) :
                                  ImageIcon(
                                    NetworkImage(savedAddressPage?.appBar.backIcon.imageIcon as String ),
                                    size: double.parse(savedAddressPage?.appBar.backIcon.mobileSize as String),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                centerTitle: true,
                                title: Text(
                                  savedAddressPage?.appBar.title.data as String,
                                  style: TextStyle(
                                      fontFamily: "${lng?.logoTitle.textFamily}",
                                      fontWeight: FontWeight.bold),),
                                actions: [],
                              ),
                              body: Center(
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: 450,),
                                  child: Column(
                                    children: [
                                      Text(
                                       savedAddressPage?.body.pageTitle.data as String,
                                        style: TextStyle(
                                            fontFamily: lng?.titleHeader2.textFamily,
                                            color: Color(int.parse(savedAddressPage?.body.pageTitle.color as String)),
                                            fontSize: lng?.titleHeader2.size.toDouble()
                                        ),
                                      ),

                                      // Text(
                                      //   getTranslated(context, "savedAddressTitl")!,
                                      //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                                      //       color: Colors.amber,
                                      //       fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)
                                      //   ),
                                      // ),
                                      const SizedBox(height: 15,),

                                      SavedAddressListWidget(lng: lng, savedAddressPage: savedAddressPage),


                                      const SizedBox(height: 10,),


                                      SizedBox(
                                          width: 330,
                                          height: 38,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                PersistentNavBarNavigator.pushNewScreen(
                                                  context,
                                                  screen: AddNewAddress(),
                                                  withNavBar: true,
                                                  // OPTIONAL VALUE. True by default.
                                                  pageTransitionAnimation: PageTransitionAnimation
                                                      .cupertino,
                                                );
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(savedAddressPage?.body.addNewAdressButton.backGroundColor as String))),
                                                // backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                                                foregroundColor:
                                                MaterialStateProperty.all<Color>(Colors.black),
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(0.0),
                                                        side: const BorderSide(
                                                            color: Colors.transparent, width: 1.5)
                                                    )
                                                ),


                                              ),
                                              child: Text(
                                                getTranslated(context, "addNewAddress")!,
                                                style: TextStyle(
                                                    fontFamily: lng?.header3.textFamily,
                                                    color: Color(int.parse(savedAddressPage?.body.addNewAdressButton.color as String)),
                                                    fontSize: lng?.header3.size.toDouble()),
                                              )

                                          )
                                      ),
                                      const SizedBox(height: 20,),

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

  @override
  void initState() {
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
    String token =authProvider.loggedInUser?.token??"";
    Provider.of<ProfileProvider>(context,listen: false).getUserSavedAddress(token);
  }
}
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
                                      Expanded(
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomLeft: Radius.circular(10),
                                                  topLeft: Radius.circular(10),
                                                  bottomRight: Radius.circular(10),
                                                ),
                                                // border: Border.all(
                                                //   width: 0.5,
                                                //   color: Colors.white,
                                                //   style: BorderStyle.solid,
                                                // ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Dubai - Jumeirah Lake Tower -ma...",
                                                          style:TextStyle(
                                                              fontFamily: lng?.header3.textFamily,
                                                              color: Color(int.parse(savedAddressPage?.body.addressList.title.color as String)),
                                                              fontSize: lng?.header3.size.toDouble()
                                                          ),
                                                      ),
                                                      Text("Flat | Jumeirah Lakes Tower",
                                                          style: TextStyle(
                                                              fontFamily: lng?.header3.textFamily,
                                                              color: Color(int.parse(savedAddressPage?.body.addressList.subTitle.color as String)),
                                                              fontSize: lng?.header3.size.toDouble()
                                                          ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 20,),
                                                  SizedBox(

                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 25,
                                                          height: 25,

                                                          child: ElevatedButton(
                                                              onPressed: () {
                                                                PersistentNavBarNavigator.pushNewScreen(
                                                                  context,
                                                                  screen: UpdateAddress(),
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
                                                                              Radius.circular(
                                                                                  100)),
                                                                          side: BorderSide(
                                                                              color: Colors
                                                                                  .transparent,
                                                                              width: 1)
                                                                      )
                                                                  ),
                                                                  overlayColor: MaterialStateProperty
                                                                      .all(Colors.white30),
                                                                  elevation: MaterialStateProperty
                                                                      .all(0),
                                                                  shadowColor: MaterialStateProperty
                                                                      .all(Colors.transparent),
                                                                  backgroundColor: MaterialStateProperty.all(Color(int.parse(savedAddressPage?.body.addressList.editButton.backGroundColor as String))),
                                                                  foregroundColor: MaterialStateProperty
                                                                      .all(Colors.white),
                                                                  padding: MaterialStateProperty
                                                                      .all(
                                                                      const EdgeInsets.all(0)),
                                                                  textStyle: MaterialStateProperty
                                                                      .all(const TextStyle(
                                                                      fontSize: 15))),
                                                              child: const Icon(
                                                                Icons.mode_edit_outline_outlined,
                                                                color: Colors.white, size: 15,)
                                                          ),
                                                        ),

                                                        IconButton(
                                                          onPressed: () {

                                                          },
                                                          icon: ImageIcon(
                                                            NetworkImage(savedAddressPage?.body.addressList.deleteButton.imageIcon as String),
                                                            size: double.parse(savedAddressPage?.body.addressList.deleteButton.mobileSize as String),
                                                            color: Colors.white54,

                                                          )
                                                        ),

                                                        // IconButton(
                                                        //     onPressed: () {},
                                                        //     icon: Icon(
                                                        //       Icons.delete,
                                                        //       color: Colors.white54,
                                                        //     ))
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),


                                          ],
                                        ),
                                      ),

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
}
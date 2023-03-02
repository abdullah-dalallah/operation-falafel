import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:provider/provider.dart';

import '../../../models/AppThemeModels/DesignPerPage/AddNewAddressPage/Add_new_address_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

class AddNewAddress extends StatefulWidget{
  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {


  final List<String> addressType = [
    "flat",
    "house",
    "villa",
    "office",
  ];
  dynamic? selectedValue;
  bool primary = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, appTheme, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      AddNewAddressPage? addNewAddressPage = appTheme.appTheme.designPerPage?.addNewAddressPage;
      bool loadingDesign = addNewAddressPage != null;

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
            appBar:  AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                (Localizations.localeOf(context).languageCode == 'en') ?
                ImageIcon(
                  NetworkImage(addNewAddressPage.appBar.backIcon.imageIcon),
                  size: double.parse(addNewAddressPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(addNewAddressPage.appBar.backIcon.imageIcon),
                  size: double.parse(addNewAddressPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                addNewAddressPage.appBar.title.data,
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
                      addNewAddressPage.body.pageTitle.data,
                      style: TextStyle(
                          fontFamily:lng?.titleHeader2.textFamily,
                          color: Color(int.parse(addNewAddressPage.body.pageTitle.color)),
                          fontSize: lng?.titleHeader2.size.toDouble()
                      ),
                    ),
                    // Text(
                    //   getTranslated(context, "address")!,
                    //   style: TextStyle(
                    //       fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                    //       color: Colors.amber,
                    //       fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)
                    //   ),
                    // ),
                    Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(height: 15,),
                          Image.network(addNewAddressPage.body.pageImage, height: 200,),
                          // Image.asset("assets/images/of_logo.png", height: 200,),
                          const SizedBox(height: 15,),

                          /// - Address Line
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,
                                right: 18,
                                top: 8,
                                bottom: 8),
                            child: TextField(

                              autofocus: false,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black45,
                                contentPadding: const EdgeInsets.only(
                                    left: 10, right: 10),
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
                                      color: Colors.transparent, width: 0.0),
                                ),
                                hintText: addNewAddressPage.body.form.addressLine.data,
                                hintStyle: TextStyle(
                                    fontFamily: "${lng?.header3.textFamily}",
                                    color: Color(int.parse(addNewAddressPage.body.form.addressLine.color)),
                                    fontSize:lng?.header3.size.toDouble()
                                ),

                              ),

                            ),
                          ),

                          /// - Building name & villa No
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,
                                right: 18,
                                top: 8,
                                bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: TextField(

                                    autofocus: false,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, right: 10),
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
                                      hintText: addNewAddressPage.body.form.buildingName.data,
                                      hintStyle: TextStyle(
                                          fontFamily: "${lng?.header3.textFamily}",
                                          color: Color(int.parse(addNewAddressPage.body.form.buildingName.color)),
                                          fontSize:lng?.header3.size.toDouble()
                                      ),

                                    ),

                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 3,
                                  child: TextField(
                                    autofocus: false,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, right: 10),
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
                                      hintText: addNewAddressPage.body.form.villa.data,
                                      hintStyle: TextStyle(
                                          fontFamily: "${lng?.header3.textFamily}",
                                          color: Color(int.parse(addNewAddressPage.body.form.villa.color)),
                                          fontSize:lng?.header3.size.toDouble()
                                      ),

                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// - Area & Address Type
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,
                                right: 18,
                                top: 8,
                                bottom: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: TextField(

                                    autofocus: false,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black45,
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, right: 10),
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
                                      hintText: addNewAddressPage.body.form.area.data,
                                      hintStyle: TextStyle(
                                          fontFamily: "${lng?.header3.textFamily}",
                                          color: Color(int.parse(addNewAddressPage.body.form.area.color)),
                                          fontSize:lng?.header3.size.toDouble()
                                      ),

                                    ),

                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex: 3,
                                  child: DropdownButtonFormField2(

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
                                    hint:  Text(
                                      addNewAddressPage.body.form.addressTypeDropDown.labelText.data,
                                      style: TextStyle(
                                          fontSize: lng?.header3.size.toDouble(),
                                          color: Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.labelText.color)),
                                          fontFamily: lng?.header3.textFamily
                                      ),
                                    ),

                                    icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                    // const Icon(
                                    //   Icons.arrow_drop_down,
                                    //   color: Colors.white60,
                                    // ),
                                    iconSize: 30,
                                    buttonHeight: (selectedValue != null)
                                        ? 50
                                        : 50,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    itemHeight: 30,

                                    items: addressType
                                        .map((order) =>
                                        DropdownMenuItem<dynamic>(
                                          value: order,
                                          child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [

                                              Row(
                                                children: [

                                                  (selectedValue != null)
                                                      ?
                                                  (selectedValue == order) ?
                                                  Image.network(
                                                    addNewAddressPage.body.form.addressTypeDropDown.selectedIcon.imageIcon,
                                                    height: 15, width: 15,)
                                                      : SizedBox(width: 15,)
                                                      : SizedBox(width: 15,),
                                                  SizedBox(width: 5,),
                                                  Text(
                                                    getTranslated(context, order)!,
                                                    style: TextStyle(
                                                        fontSize: lng?.header2.size.toDouble(),
                                                        color: Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.itemsTitle.color)),
                                                        fontFamily: lng?.header2.textFamily
                                                    ),
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
                                        selectedValue = value;
                                      });


                                      print(selectedValue.keys.elementAt(0));
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// - Save address
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,
                                right: 18,
                                top: 8,
                                bottom: 8),
                            child: Row(children: [
                              (primary == false) ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      primary = true;
                                    });
                                  },
                                  child:
                         Image.network(addNewAddressPage.body.form.addressTypeDropDown.primaryAddress.icon.inactiveImage, height: 40, width: 40,),
                                  // Image.asset(
                                  //   "assets/images/star_empty.png", height: 40,
                                  //   width: 40,)
                              )
                                  : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      primary = false;
                                    });
                                  },
                                  child:
                                  Image.network(addNewAddressPage.body.form.addressTypeDropDown.primaryAddress.icon.activeIcon, height: 40, width: 40,),

                              ),

                              const SizedBox(width: 10,),
                              Text(
                                addNewAddressPage.body.form.addressTypeDropDown.primaryAddress.title.data,
                                style: TextStyle(
                                    fontFamily: lng?.header3.textFamily,
                                    color: Colors.white,
                                    fontSize: lng?.header3.size.toDouble()
                                ),
                              ),
                              const Expanded(child: SizedBox(width: 10,)),
                              SizedBox(
                                  width: 150,

                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all<Color>(Colors.amber),
                                        foregroundColor:
                                        MaterialStateProperty.all<Color>(Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.backGroundColor))),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(0.0),
                                                side: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.5)
                                            )
                                        ),
                                      ),
                                      child:Text(
                                        addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.data,
                                        style: TextStyle(
                                            fontFamily: lng?.header3.textFamily,
                                            color: Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.color)),
                                            fontSize: lng?.header3.size.toDouble()
                                        ),
                                      )

                                  )
                              ),
                            ],),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      )
      :LoadingPage()
      ;
    });
  }
}
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/my_text_form_field.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/Map/map_page.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../data/keys.dart';
import '../../../data/snackBarGenerator.dart';
import '../../../models/AppThemeModels/DesignPerPage/AddNewAddressPage/Add_new_address_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';
import '../../../providers/AuthProvider/auth_provider.dart';
import '../../../providers/ProfileProviders/profile_provider.dart';

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

  int? selectedAddressItemById;
  int? selectCityId ;

  bool primary = false;

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controllerAddressLine = TextEditingController();
  TextEditingController _controllerBuildingName = TextEditingController();
  TextEditingController _controllerFlatNumber = TextEditingController();
  TextEditingController _controllerArea = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, ProfileProvider>(builder: (context, appTheme,profileProvider, child)
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
              title: MyText(
                addNewAddressPage.appBar.title.data,
                style: TextStyle(
                    fontFamily: "${lng?.logoTitle.textFamily}",
                    fontWeight: FontWeight.bold),),
              actions: [],
            ),
            body: Form(
              key: _formKey,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 450,),
                  child: Column(
                    children: [
                      MyText(
                        addNewAddressPage.body.pageTitle.data,
                        style: TextStyle(
                            fontFamily:lng?.titleHeader2.textFamily,
                            color: Color(int.parse(addNewAddressPage.body.pageTitle.color)),
                            fontSize: lng?.titleHeader2.size.toDouble()
                        ),
                      ),

                      Expanded(
                        child: ListView(
                          children: [
                            const SizedBox(height: 15,),
                            Image.network(addNewAddressPage.body.pageImage, height: 200,),
                            // Image.asset("assets/images/of_logo.png", height: 200,),
                            const SizedBox(height: 15,),

                            /// - Address Line
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                              child: MyTextFormField(
                                controller: _controllerAddressLine,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Address Line';
                                  }
                                  return null;
                                },
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black45,
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

                            /// - City --->  Design is missing
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
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
                                  hint:  MyText(
                                    "City",
                                    // addNewAddressPage.body.form.addressTypeDropDown.labelText.data,
                                    style: TextStyle(
                                        fontSize: lng?.header3.size.toDouble(),
                                        color: Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.labelText.color)),
                                        fontFamily: lng?.header3.textFamily
                                    ),
                                  ),
                                  icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                  iconSize: 30,
                                  buttonHeight: (selectCityId != null) ? 50 : 50,
                                  buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                                  dropdownDecoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10),),
                                  itemHeight: 30,
                                  items: profileProvider.citiesList
                                      .map((addressTypeItem) =>
                                      DropdownMenuItem<dynamic>(
                                        value: addressTypeItem[Keys.idKey],
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Row(
                                              children: [

                                                (selectCityId != null)
                                                    ?
                                                (selectCityId == addressTypeItem[Keys.idKey]) ?
                                                Image.network(
                                                  addNewAddressPage.body.form.addressTypeDropDown.selectedIcon.imageIcon,
                                                  height: 15, width: 15,)
                                                    : SizedBox(width: 15,)

                                                    : SizedBox(width: 15,),


                                                SizedBox(width: 5,),


                                                MyText(
                                                  addressTypeItem[Keys.nameKey],
                                                  // getTranslated(context, addressItem)!,
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
                                      return 'Please select city.';
                                    }
                                  },
                                  onChanged: (value) {
                                    //Do something when changing the item if you want.
                                    setState(() {
                                      selectCityId = value;
                                    });

                                    print(value);
                                    // print(selectedAddressItem.keys.elementAt(0));
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      selectCityId = value;
                                    });
                                  },
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
                                    child: MyTextFormField(
                                      controller: _controllerBuildingName,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Building Name';
                                        }
                                        return null;
                                      },
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
                                    child: MyTextFormField(
                                      controller: _controllerFlatNumber,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Flat Number';
                                        }
                                        return null;
                                      },
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
                                    child: MyTextFormField(
                                      controller: _controllerArea,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter Area';
                                        }
                                        return null;
                                      },
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
                                      hint:  MyText(
                                        addNewAddressPage.body.form.addressTypeDropDown.labelText.data,
                                        style: TextStyle(
                                            fontSize: lng?.header3.size.toDouble(),
                                            color: Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.labelText.color)),
                                            fontFamily: lng?.header3.textFamily
                                        ),
                                      ),
                                      icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                      iconSize: 30,
                                      buttonHeight: (selectedAddressItemById != null) ? 50 : 50,
                                      buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                                      dropdownDecoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10),),
                                      itemHeight: 30,
                                      items: profileProvider.addressTypeList
                                          .map((addressTypeItem) =>
                                          DropdownMenuItem<dynamic>(
                                            value: addressTypeItem[Keys.idKey],
                                            child:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Row(
                                                  children: [

                                                    (selectedAddressItemById != null)
                                                        ?
                                                    (selectedAddressItemById == addressTypeItem[Keys.idKey]) ?
                                                    Image.network(
                                                      addNewAddressPage.body.form.addressTypeDropDown.selectedIcon.imageIcon,
                                                      height: 15, width: 15,)
                                                        : SizedBox(width: 15,)

                                                        : SizedBox(width: 15,),


                                                    SizedBox(width: 5,),


                                                    MyText(
                                                        addressTypeItem[Keys.nameKey],
                                                      // getTranslated(context, addressItem)!,
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
                                          return 'Please select address type.';
                                        }
                                      },
                                      onChanged: (value) {
                                        //Do something when changing the item if you want.
                                        setState(() {
                                          selectedAddressItemById = value;
                                        });

                                         print(value);
                                        // print(selectedAddressItem.keys.elementAt(0));
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          selectedAddressItemById = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// - Set Primary & Save address
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0,
                                  right: 18,
                                  top: 8,
                                  bottom: 8),
                              child: Row(children: [
                                /// Set Primary
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
                                MyText(
                                  addNewAddressPage.body.form.addressTypeDropDown.primaryAddress.title.data,
                                  style: TextStyle(
                                      fontFamily: lng?.header3.textFamily,
                                      color: Colors.white,
                                      fontSize: lng?.header3.size.toDouble()
                                  ),
                                ),
                                const Expanded(child: SizedBox(width: 10,)),

                                /// - Save Address
                                SizedBox(
                                    width: 150,

                                    child: ElevatedButton(
                                        onPressed: () {

                                          if (!_formKey.currentState!.validate()) {
                                            // Invalid!
                                            return;
                                          }

                                          String savedUserToken = Provider.of<AuthProvider>(context,listen: false).loggedInUser!.token??"";
                                          Provider.of<ProfileProvider>(context,listen: false).addNewUserAddress(
                                              userToken: savedUserToken,
                                              addressLine: _controllerAddressLine.text,
                                              area: _controllerArea.text,
                                              buildingName: _controllerBuildingName.text,
                                              flatNumber: _controllerFlatNumber.text,
                                              addressTypeId: selectedAddressItemById!,
                                              isPrimary: primary?1:0,
                                              cityId: selectCityId!,
                                              lat: "25.265486", long: "31.256986").then((response) {
                                                if(response.data[Keys.successKey]==true){
                                                  Provider.of<ProfileProvider>(context,listen: false).getUserSavedAddress(savedUserToken).then((res) {
                                                    if(res.data[Keys.successKey]==true){
                                                      Navigator.pop(context);
                                                    }else{
                                                      SnackbarGenerator(context).snackBarGeneratorToast("Please Refresh Address Lsit!",);
                                                      Navigator.pop(context);
                                                    }

                                                  });
                                                }

                                          });

                                        },
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
                                        child:MyText(
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
                      // Divider(color: Colors.white,height: 1,),
                      ListTile(
                        tileColor: Colors.black,
                        title: MyText("Location on Map",
                          style: TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              color: Colors.amber,
                              //Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.color)),
                              fontSize: lng?.header3.size.toDouble()
                          ),
                          // style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber,fontSize: double.parse(getTranslated(context, "cartpageHeader2SubTotal")!)),
                        ),
                        subtitle: MyText("Name ",
                          style: TextStyle(
                              fontFamily: lng?.header3.textFamily,
                              color: Colors.white,
                              //Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.color)),
                              fontSize: lng?.header3.size.toDouble()
                          ),
                          // style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: double.parse(getTranslated(context, "cartpageHeader3")!)),
                        ),
                         trailing:
                         /// - change location
                         SizedBox(
                             width: 150,

                             child: ElevatedButton(
                                 onPressed: () {
                                   PersistentNavBarNavigator.pushNewScreen(
                                     context,
                                     screen: MapPage(),
                                     withNavBar: true,
                                     // OPTIONAL VALUE. True by default.
                                     pageTransitionAnimation: PageTransitionAnimation
                                         .cupertino,
                                   );
                                   // pushNewScreen(context, screen:  MapPage());

                                 },
                                 style: ButtonStyle(
                                   backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                                   foregroundColor: MaterialStateProperty.all<Color>(Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.backGroundColor))),
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
                                 child:MyText(
                                   "change",
                                   style: TextStyle(
                                       fontFamily: lng?.header3.textFamily,
                                       color: Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.color)),
                                       fontSize: lng?.header3.size.toDouble()
                                   ),
                                 )

                             )
                         ),
                      )
                    ],
                  ),
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

  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
    String savedUserToken = Provider.of<AuthProvider>(context,listen: false).loggedInUser!.token??"";
    Provider.of<ProfileProvider>(context,listen: false).getAddressTypesList(savedUserToken).then((value) {
      Provider.of<ProfileProvider>(context,listen: false).getCitiesList(savedUserToken);
    });


  }

  Future<void> checkLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isGranted) {
      setState(() {
        _permissionStatus = status;
      });
    } else {
      requestLocationPermission();
    }

  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      _permissionStatus = status;
    });
  }

}
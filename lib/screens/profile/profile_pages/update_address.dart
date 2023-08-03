import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:operation_falafel/data/keys.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/my_text_form_field.dart';
import 'package:operation_falafel/data/snackBarGenerator.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/ProfileProviders/models/saved_address_list_res_model.dart';
import 'package:operation_falafel/providers/ProfileProviders/profile_provider.dart';
import 'package:operation_falafel/widgets/Map/map_page.dart';
import 'package:operation_falafel/widgets/background.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../models/AppThemeModels/DesignPerPage/EditAddressPage/edit_address_page.dart';
import '../../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../../providers/AppTheme/theme_provider.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class UpdateAddress extends StatefulWidget{
  static const routeName = 'UpdateAddress';
  SavedAddressItem? savedAddressItem;
   UpdateAddress({this.savedAddressItem,super.key});
  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  final List<String> addressType = [
    "flat",
    "house",
    "villa",
    "office",
  ];
  int? selectedAddressTypeValue;
  bool primary = false;
  int? selectCityId ;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, ProfileProvider>(builder: (context,  appTheme,profileProvider, child)
    {
      Language? lng = (Localizations.localeOf(context).languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
      EditAddressPage? editAddressPage = appTheme.appTheme.designPerPage?.editAddressPage;
      bool loadingDesign = editAddressPage != null;

      return
        (loadingDesign)?
        Stack(
        children: [
          Background(),
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
                  NetworkImage(editAddressPage.appBar.backIcon.imageIcon),
                  size: double.parse(editAddressPage?.appBar.backIcon.mobileSize as String),
                ) :
                ImageIcon(
                  NetworkImage(editAddressPage.appBar.backIcon.imageIcon),
                  size: double.parse(editAddressPage?.appBar.backIcon.mobileSize as String),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: MyText(
                editAddressPage.appBar.title.data,
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
                    MyText(
                      editAddressPage.body.pageTitle.data,
                      style: TextStyle(
                          fontFamily: "${lng?.titleHeader2.textFamily}",
                          color: Color(int.parse(editAddressPage.body.pageTitle.color)),
                          fontSize:lng?.titleHeader2.size.toDouble()
                      ),),

                    // MyText(
                    //   getTranslated(context, "address")!,
                    //   style: TextStyle(
                    //       fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                    //     color: Colors.amber,
                    //     fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)
                    //   ),),

                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            const SizedBox(height: 15,),
                            Image.network(editAddressPage.body.pageImage, height: 200,),
                            // Image.asset("assets/images/of_logo.png", height: 200,),
                            const SizedBox(height: 15,),

                            /// - Address Line
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                              child: MyTextFormField(
                              controller:  _controllerAddressLine,
                                autofocus: false,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black45,
                                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
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
                                  hintText: editAddressPage.body.form.addressLine.data,
                                  hintStyle: TextStyle(
                                      fontFamily: "${lng?.header3.textFamily}",
                                      color: Color(int.parse(editAddressPage.body.form.addressLine.color)),
                                      fontSize:lng?.header3.size.toDouble()
                                  ),
                                  // hintText: getTranslated(context, "addressLine")!,
                                  // hintStyle: TextStyle(
                                  //     fontFamily: getTranslated(context, "fontFamilyBody")!,
                                  //     color: Colors.white38
                                  // ),

                                ),

                              ),
                            ),
                            /// - City
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
                                  editAddressPage.body.form.addressCityDropDown.labelText.data,
                                  // addNewAddressPage.body.form.addressTypeDropDown.labelText.data,
                                  style: TextStyle(
                                      fontSize: lng?.header3.size.toDouble(),
                                      color: Color(int.parse(editAddressPage.body.form.addressCityDropDown.labelText.color)),
                                      fontFamily: lng?.header3.textFamily
                                  ),
                                ),
                                icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                iconSize: 30,
                                buttonHeight: (selectCityId != null) ? 50 : 50,
                                buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                                dropdownDecoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10),),
                                itemHeight: 30,
                                value: selectCityId,
                                items: profileProvider.citiesList
                                    .map((addressCityItem) =>
                                    DropdownMenuItem<dynamic>(
                                      value: addressCityItem[Keys.idKey],
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Row(
                                            children: [

                                              (selectCityId != null)
                                                  ?
                                              (selectCityId == addressCityItem[Keys.idKey]) ?
                                              Image.network(
                                                editAddressPage.body.form.addressCityDropDown.selectedIcon.imageIcon,
                                                height: 15, width: 15,)
                                                  : SizedBox(width: 15,)

                                                  : SizedBox(width: 15,),


                                              SizedBox(width: 5,),


                                              MyText(
                                                addressCityItem[Keys.nameKey],
                                                // getTranslated(context, addressItem)!,
                                                style: TextStyle(
                                                    fontSize: lng?.header2.size.toDouble(),
                                                    color: Color(int.parse(editAddressPage.body.form.addressCityDropDown.itemsTitle.color)),
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
                                        hintText: editAddressPage.body.form.buildingName.data,
                                        hintStyle: TextStyle(
                                            fontFamily: "${lng?.header3.textFamily}",
                                            color: Color(int.parse(editAddressPage.body.form.buildingName.color)),
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
                                        hintText: editAddressPage.body.form.villa.data,
                                        hintStyle: TextStyle(
                                            fontFamily: "${lng?.header3.textFamily}",
                                            color: Color(int.parse(editAddressPage.body.form.villa.color)),
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
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: MyTextFormField(
                                      controller: _controllerArea,
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
                                        hintText: editAddressPage.body.form.area.data,
                                        hintStyle: TextStyle(
                                            fontFamily: "${lng?.header3.textFamily}",
                                            color: Color(int.parse(editAddressPage.body.form.area.color)),
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
                                      hint:
                                      MyText(
                                        editAddressPage.body.form.addressTypeDropDown.labelText.data,
                                        style: TextStyle(
                                            fontSize: lng?.header3.size.toDouble(),
                                            color: Color(int.parse(editAddressPage.body.form.addressTypeDropDown.labelText.color)),
                                            fontFamily: lng?.header3.textFamily
                                        ),
                                      ),
                                      // MyText(
                                      //   getTranslated(context, "addressType")!,
                                      //   style: TextStyle(
                                      //       fontSize: 15,
                                      //       color: Colors.white60,
                                      //       fontFamily: getTranslated(context, "fontFamilyBody")!
                                      //   ),
                                      // ),

                                      icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                                      // const Icon(
                                      //   Icons.arrow_drop_down,
                                      //   color: Colors.white60,
                                      // ),
                                      iconSize: 30,
                                      buttonHeight: (selectedAddressTypeValue != null) ? 50 : 50,
                                      buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                                      dropdownDecoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      itemHeight: 30,
                                      value: selectedAddressTypeValue,
                                      items: profileProvider.addressTypeList.map((addressTypeItem) => DropdownMenuItem<dynamic>(
                                            value: addressTypeItem[Keys.idKey],
                                            child:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Row(
                                                  children: [

                                                    (selectedAddressTypeValue != null)
                                                        ?
                                                    (selectedAddressTypeValue == addressTypeItem) ?
                                                    Image.network(
                                                      editAddressPage.body.form.addressTypeDropDown.selectedIcon.imageIcon,
                                                      height: 15, width: 15,)
                                                    // Image.asset(
                                                    //   "assets/images/page2_icon.png",
                                                    //   height: 15, width: 15,)
                                                        : SizedBox(width: 15,)
                                                        : SizedBox(width: 15,),
                                                    SizedBox(width: 5,),
                                                    MyText(
                                                      addressTypeItem[Keys.nameKey],
                                                     // getTranslated(context, order)!,
                                                      style: TextStyle(
                                                          fontSize: lng?.header2.size.toDouble(),
                                                          color: Color(int.parse(editAddressPage.body.form.addressTypeDropDown.itemsTitle.color)),
                                                          fontFamily: lng?.header2.textFamily
                                                      ),
                                                    ),
                                                    // MyText(
                                                    //   getTranslated(context, order)!,
                                                    //   style: TextStyle(
                                                    //       fontSize: 13,
                                                    //       color: Colors.white,
                                                    //       fontFamily: getTranslated(
                                                    //           context,
                                                    //           "fontFamilyBody")!),
                                                    // ),
                                                  ],
                                                ),


                                              ],
                                            ),


                                          )).toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select Address Type.';
                                        }
                                      },
                                      onChanged: (value) {
                                        //Do something when changing the item if you want.
                                        // setState(() {
                                        //   selectedAddressTypeValue = value;
                                        // });

                                        print(value);

                                      },
                                      onSaved: (value) {
                                        // setState(() {
                                        //   selectedAddressTypeValue = value;
                                        // });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// - Update address
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0,
                                  right: 18,
                                  top: 8,
                                  bottom: 8),
                              child: Row(children: [
                                (primary == false) ?
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        primary = true;
                                      });
                                    },
                                    child:
                                    Image.network(editAddressPage.body.form.primaryAddress.icon.inactiveImage, height: 40, width: 40,))
                                    // Image.asset("assets/images/star_empty.png", height: 40, width: 40,))
                                    : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        primary = false;
                                      });
                                    },
                                    child:
                                    Image.network(editAddressPage.body.form.primaryAddress.icon.activeIcon, height: 40, width: 40,)
                                    // Image.asset("assets/images/star_full.png", height: 40, width: 40,)
                                ),

                                const SizedBox(width: 10,),
                                MyText(
                                  editAddressPage.body.form.primaryAddress.title.data,
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
                                        onPressed: () {

                                          if (!_formKey.currentState!.validate()) {
                                            // Invalid!
                                            return;
                                          }
                                          if(selectedLocation!=null && selectedPlaceMark!=null){
                                            String savedUserToken = Provider.of<AuthProvider>(context,listen: false).loggedInUser!.token??"";
                                            Provider.of<ProfileProvider>(context,listen: false).updateUserAddress(
                                                userToken: savedUserToken,
                                                addressLine: _controllerAddressLine.text,
                                                addressId: widget.savedAddressItem!.id!,
                                                area: _controllerArea.text,
                                                buildingName: _controllerBuildingName.text,
                                                flatNumber: _controllerFlatNumber.text,
                                                addressTypeId: selectedAddressTypeValue!,
                                                isPrimary: primary?1:0,
                                                cityId: selectCityId!,
                                                lat: "${selectedLocation!.latitude}", long: "${selectedLocation!.longitude}").then((response) {
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
                                          }
                                          else{
                                            print(selectedLocation);
                                            print(selectedPlaceMark);
                                            SnackbarGenerator(context).snackBarGeneratorToast("Please mark your location first!",);
                                          }

                                        },
                                        style: ButtonStyle(
                                          backgroundColor: (selectedLocation!=null && selectedPlaceMark!=null)?MaterialStateProperty.all<Color>(Colors.amber):MaterialStateProperty.all<Color>(Colors.grey),
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
                                        child: MyText(
                                          editAddressPage.body.form.updateAddressButton.data,
                                          style: TextStyle(
                                              fontFamily: lng?.header3.textFamily,
                                              color: Color(int.parse(editAddressPage.body.form.updateAddressButton.color)),
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
                      subtitle:
                      (selectedPlaceMark!=null)?
                      MyText("${selectedPlaceMark?.street}",
                        style: TextStyle(
                            fontFamily: lng?.header3.textFamily,
                            color: Colors.white,
                            //Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.color)),
                            fontSize: lng?.header1.size.toDouble()
                        ),
                        // style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: double.parse(getTranslated(context, "cartpageHeader3")!)),
                      )
                          :MyText("Please mark your location on map!",
                        style: TextStyle(

                            fontFamily: lng?.header3.textFamily,
                            color: Colors.white,
                            //Color(int.parse(addNewAddressPage.body.form.addressTypeDropDown.addNewAddressButton.color)),
                            fontSize: lng?.header1.size.toDouble()
                        ),
                        // style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, fontSize: double.parse(getTranslated(context, "cartpageHeader3")!)),
                      )
                      ,
                      trailing:
                      /// - change location
                      SizedBox(
                          width: 150,

                          child: ElevatedButton(
                              onPressed: () {
                                // context.go("${GoRouter.of(context).routerDelegate.currentConfiguration.fullPath}/${MapPage.routeName}");
                                if(currentMarkerPosition!=null){
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: MapPage(
                                      onLocationSelected: (location) => changeSelectedLocation(location),
                                      onAddressSelected: (address) => changeSelectedAddress(address),
                                      currentLocation: currentMarkerPosition,

                                    ),
                                    withNavBar: true,
                                    // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation: PageTransitionAnimation
                                        .cupertino,
                                  );
                                }
                                else {
                                  print('no value');
                                  // checkLocationPermission();
                                }

                                // pushNewScreen(context, screen:  MapPage());

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
                                    color: Colors.white,
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
        ],
      )
        :LoadingPage();
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey();


  TextEditingController _controllerAddressLine = TextEditingController();
  TextEditingController _controllerBuildingName = TextEditingController();
  TextEditingController _controllerFlatNumber = TextEditingController();
  TextEditingController _controllerArea = TextEditingController();




  @override
  void initState() {
    super.initState();
    checkLocationPermission();
    String savedUserToken = Provider.of<AuthProvider>(context,listen: false).loggedInUser!.token??"";
    Provider.of<ProfileProvider>(context,listen: false).getAddressTypesList(savedUserToken).then((value) {
      Provider.of<ProfileProvider>(context,listen: false).getCitiesList(savedUserToken);
    });

    if(widget.savedAddressItem!=null){
      print(widget.savedAddressItem!.name!);
      _controllerAddressLine.text = widget.savedAddressItem!.name!;
      _controllerBuildingName.text = widget.savedAddressItem!.building!;
      _controllerFlatNumber.text = widget.savedAddressItem!.flat!;
      _controllerArea.text = widget.savedAddressItem!.area!;
      selectCityId = widget.savedAddressItem?.cityId;
      selectedAddressTypeValue = widget.savedAddressItem!.addressTypeId;
      primary= widget.savedAddressItem!.isPrimary==1;
      selectedLocation = LatLng(double.parse("${widget.savedAddressItem!.lat}"),double.parse("${widget.savedAddressItem!.long}"));
      getAddressNameFromLocation(selectedLocation!);
    }

  }
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  Future<void> checkLocationPermission() async {
    final status = await Permission.location.status;
    if (status.isGranted) {
      setState(() {
        _permissionStatus = status;
        _getCurrentLocation();
      });
    } else {
      requestLocationPermission();
    }

  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      print(status);
      _permissionStatus = status;
      if(status.isPermanentlyDenied){
        openAppSettings();
      }
      if(status.isGranted){
        _getCurrentLocation();
      }
    });
  }


  LatLng? currentMarkerPosition ;
  LatLng convertToLatLng(Position position) {
    return LatLng(position.latitude, position.longitude);
  }
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print("fetching location:${position}");
      setState(() {
        currentMarkerPosition =convertToLatLng(position);
      });
    } catch (e) {
      print("Error while fetching location: $e");
      // centerMarkerPosition = LatLng(25.074759, 55.140225);
    }
  }

  Placemark? selectedPlaceMark;
  LatLng? selectedLocation;

  void changeSelectedAddress(Placemark placeMark ){
    // print("Selected Address ${placeMark}");
    setState(() {
      selectedPlaceMark=placeMark;
    });

  }
  void changeSelectedLocation(LatLng selectedLatLng){
    // print("Selected Location  ${selectedLatLng}");
    setState(() {
      selectedLocation=selectedLatLng;
    });

  }

  bool isMarkerLoading = false;
  // Get the address name from the marked location
  Future<void> getAddressNameFromLocation(LatLng position) async {
    try {
      // Set the loading status to true
      setState(() {
        isMarkerLoading = true;
      });

      // Use geocoding API to get the address name from the location
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      selectedPlaceMark = placemarks.first;





      // Set the loading status to false
      setState(() {
        isMarkerLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }


}
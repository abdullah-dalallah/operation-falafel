
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/data/my_text_form_field.dart';
import 'package:operation_falafel/data/network_constants.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/AuthProvider/auth_provider.dart';
import 'package:operation_falafel/providers/NetworkPaymentProvider/network_two_stage_payment_provider.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/providers/gifts_provider/loyalty_provider.dart';
import 'package:operation_falafel/providers/palcing_order_model_provider.dart';
import 'package:operation_falafel/providers/slider_provider.dart';
import 'package:operation_falafel/providers/tab_index_generator_provider.dart';
import 'package:operation_falafel/screens/network%20payment%20web%20page/authentication_screen.dart';
import 'package:operation_falafel/widgets/address_list_sheet.dart';
import 'package:operation_falafel/widgets/cart_gifts_widget.dart';
import 'package:operation_falafel/widgets/checkbox_option.dart';
import 'package:operation_falafel/widgets/credit_card_payment_method_checkbox.dart';
import 'package:operation_falafel/widgets/delivery_pickup_custom_switch_widget.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:operation_falafel/widgets/loading_widget.dart';
import 'package:operation_falafel/widgets/loyalty_payment_method_checkbox.dart';
import 'package:operation_falafel/widgets/placing_order_model.dart';

import 'package:operation_falafel/widgets/pluse_minus_widget.dart';
import 'package:operation_falafel/widgets/schedule_checkbox.dart';
import 'package:operation_falafel/widgets/schedule_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uni_links/uni_links.dart';

import '../../models/AppThemeModels/DesignPerPage/CartPage/cart_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../widgets/background.dart';
import '../my rewards page/my_rewards.dart';


class Cart_Screen extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  const Cart_Screen(this.onChanged,{super.key,required this.layOut});
  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {

  bool _switchValue=true;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey(); // Cre

  bool checkboxBool = false;
  ValueChanged _valueChangedHandler() {
    return (value) => setState(() {
      print(value);

      checkboxBool = true;


    });
  }



  // ate a key
  @override
  Widget build(BuildContext context) {
   return Stack(
      alignment: Alignment.topCenter,
     children: [
       Background(),
       // Image.asset(
       //   "assets/images/background.png",
       //   height: MediaQuery.of(context).size.height,
       //   width: MediaQuery.of(context).size.width,
       //   fit: BoxFit.cover,
       // ),
        Consumer5<ThemeProvider,DemoCartProvider,SliderProvider, AuthProvider,LoyaltyProvider>(
                  builder: (context, appTheme,demoCartProvider,SliderProvider,authProvider,loyaltyProvider, child)
                  {
                    bool cartEmpty = demoCartProvider.cartItems.isEmpty;

                    Language? lng= (Localizations.localeOf(context).languageCode=='ar')? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
                    CartPage? cartPage = appTheme.appTheme.designPerPage?.cartPage;
                    bool loadingDesign= cartPage!=null;

                    int loyaltyPointRate = ((loyaltyProvider.loyaltyPointRate!=null)?loyaltyProvider.loyaltyPointRate!.body!.value!:0);

                    return
                      (loadingDesign)?
                      Scaffold(
                      resizeToAvoidBottomInset: true,
                      key: _drawerKey,
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        leading: Visibility(
                          visible: (widget.layOut == "Mobile") ? true : false,
                          child: IconButton(
                              onPressed: (){
                                _drawerKey.currentState?.openDrawer();
                              },
                              icon:  ImageIcon(
                                NetworkImage("${cartPage?.appBar.drawerIcon.imageIcon}",),
                                size: double.parse(cartPage?.appBar.drawerIcon.mobileSize as String),
                              ),
                            ),

                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        centerTitle: true,
                        title:
                        MyText(
                          cartPage.appBar.title.data,
                          // getTranslated(context, "operationFalafelLogo")!,
                          style: TextStyle(
                             color: Color(int.parse(cartPage.appBar.title.color)),
                              fontFamily: lng?.logoTitle.textFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: lng?.logoTitle.size.toDouble()
                          ),),
                        // MyText(getTranslated(context, "operationFalafelLogo")!,
                        //   style: TextStyle(fontFamily: "${getTranslated(
                        //       context, "fontFamilyTitle")!}",
                        //       fontWeight: FontWeight.bold),),

                        // Image.asset("assets/images/of_logo_top.png", width: 220,),
                        // MyText("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),)
                        actions: [
                          Visibility(
                            visible: (widget.layOut == "Desktop") ? true : false,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
                              child: badges.Badge(
                                // padding:
                                // (Localizations.localeOf(context).languageCode=='ar')? EdgeInsets.only(bottom: 9, left: 7, right: 7, top:7):EdgeInsets.only(bottom: 9, left: 7, right: 7, top:5),

                                showBadge: (demoCartProvider.cartItems.isNotEmpty) ? true : false,
                                badgeStyle: badges.BadgeStyle(
                                  badgeColor: (demoCartProvider.cartItems.isNotEmpty)
                                      ? Colors.red
                                      : Colors.transparent,
                                  elevation: 0,

                                ),
                                badgeContent: MyText(
                                  '${demoCartProvider.cartItems.length}',
                                  style: TextStyle(
                                      color: (demoCartProvider.cartItems.isNotEmpty)
                                      ? Colors.white
                                      : Colors.transparent,
                                      fontFamily: getTranslated(context, "fontFamilyBody")
                                  ),),
                                // elevation: (value.cartItems.isNotEmpty)?3:0,
                                // badgeColor: (value.cartItems.isNotEmpty)?Colors.red:Colors.transparent,
                                child: ImageIcon(
                                  size: 40,
                                  AssetImage("assets/images/icon_cart.png"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      body: Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 450,),
                          child: SingleChildScrollView(
                            child: Column(

                              children: [
                                const SizedBox(height: 20,),

                                /// - Cart Title
                                MyText(
                                  cartPage.body.pageTile.data,
                                  // getTranslated(context, "my o:f cart")!,
                                  style: TextStyle(
                                      fontFamily: lng?.titleHeader2.textFamily,
                                      // fontFamily: getTranslated(context, "fontFamilyButtons")!,
                                      color: Color(int.parse(cartPage.body.pageTile.color)),
                                      // Colors.amber,
                                      fontSize: lng?.titleHeader2.size.toDouble()
                                  ),
                                ),
                                // MyText(getTranslated(context, "my o:f cart")!,
                                //   style: TextStyle(fontFamily: "${getTranslated(
                                //       context, "fontFamilyButtons")!}",
                                //       color: Colors.amber,
                                //       fontSize: double.parse(getTranslated(
                                //           context, "cartpageHeader1")!)),),
                                const SizedBox(height: 50,),

                                /// - cart with items
                                Visibility(
                                  visible: !cartEmpty,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      /// - Items List
                                      ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: demoCartProvider.cartItems.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, right: 15, top: 0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  MyText("${demoCartProvider.cartItems[index].itemName}", style: TextStyle(
                                                      fontFamily: lng?.header5.textFamily,
                                                      color: Color(int.parse(cartPage.body.itemsList.itemTitle.color)),
                                                      fontSize: lng?.header5.size.toDouble(),
                                                      fontWeight: FontWeight.w300
                                                  ),),
                                                  // MyText("${value.cartItems[index].itemName}", style: TextStyle(
                                                  //     fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                  //     color: Colors.amber,
                                                  //     fontSize: double.parse(getTranslated(context, "cartpageHeader2")!),
                                                  //     fontWeight: FontWeight.w300
                                                  // ),),
                                                  const SizedBox(height: 5,),
                                                  Visibility(
                                                    visible: (demoCartProvider.cartItems[index].selectedOtions.length != 0 ||
                                                        demoCartProvider.cartItems[index].selectedAddon.length != 0)
                                                        ? true
                                                        : false,
                                                    child: Column(

                                                      children: [

                                                        /// - Customiztion
                                                        ListView.builder(
                                                            physics: const NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            itemCount: demoCartProvider.cartItems[index].selectedOtions.length,
                                                            itemBuilder: (context, index2) {
                                                              return Padding(
                                                                padding: const EdgeInsets.all(2.0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    MyText("${demoCartProvider.cartItems[index].selectedOtions[index2].keys.elementAt(0)}",
                                                                      style: TextStyle(
                                                                          fontSize: lng?.header2.size.toDouble(),
                                                                          // fontSize: double.parse(getTranslated(context, "cartpageHeader3")!),
                                                                          fontFamily:lng?.header2.textFamily,
                                                                          // fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                                          color: Color(int.parse(cartPage.body.itemsList.optionsTitle.color)),
                                                                          fontWeight: FontWeight.w300),),

                                                                  ],
                                                                ),
                                                              );
                                                            }
                                                        ),

                                                        /// - AddON
                                                        ListView.builder(
                                                            physics: const NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            itemCount: demoCartProvider.cartItems[index].selectedAddon.length,
                                                            itemBuilder: (context, index2) {
                                                              return Padding(
                                                                padding: const EdgeInsets.all(2.0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                    MyText("${demoCartProvider
                                                                        .cartItems[index]
                                                                        .selectedAddon[index2][demoCartProvider
                                                                        .cartItems[index]
                                                                        .selectedAddon[index2]
                                                                        .keys.elementAt(
                                                                        0)]["quantity"]}X ",
                                                                      style: TextStyle(
                                                                          fontSize: lng?.header2.size.toDouble(),
                                                                          // fontSize: double.parse(getTranslated(context, "cartpageHeader3")!),
                                                                          fontFamily:lng?.header2.textFamily,
                                                                          // fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                                          color: Color(int.parse(cartPage.body.itemsList.optionsTitle.color)),
                                                                          fontWeight: FontWeight.w300),),
                                                                    MyText("${demoCartProvider
                                                                        .cartItems[index]
                                                                        .selectedAddon[index2]
                                                                        .keys.elementAt(
                                                                        0)}",
                                                                      style: TextStyle(
                                                                          fontSize: lng?.header2.size.toDouble(),
                                                                          // fontSize: double.parse(getTranslated(context, "cartpageHeader3")!),
                                                                          fontFamily:lng?.header2.textFamily,
                                                                          // fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                                          color: Color(int.parse(cartPage.body.itemsList.optionsTitle.color)),
                                                                          fontWeight: FontWeight.w300),),
                                                                    Expanded(
                                                                        child: SizedBox(
                                                                          width: 2,)),
                                                                    MyText("AED ${demoCartProvider
                                                                        .cartItems[index]
                                                                        .selectedAddon[index2][demoCartProvider
                                                                        .cartItems[index]
                                                                        .selectedAddon[index2]
                                                                        .keys.elementAt(
                                                                        0)]["Price"]}",
                                                                      style: TextStyle(
                                                                          fontSize: lng?.header2.size.toDouble(),
                                                                          // fontSize: double.parse(getTranslated(context, "cartpageHeader3")!),
                                                                          fontFamily:lng?.header2.textFamily,
                                                                          // fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                                          color: Color(int.parse(cartPage.body.itemsList.optionsTitle.color)),
                                                                          fontWeight: FontWeight.w300),),
                                                                  ],
                                                                ),
                                                              );
                                                            }
                                                        ),

                                                      ],),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      PluseMinusWidgetCart(
                                                        ItemQuantity: demoCartProvider.cartItems[index].itemQuantity,
                                                        itemIndex: index,),
                                                      MyText("AED ${demoCartProvider.cartItems[index].itemTotalPrice}",
                                                        style: TextStyle(
                                                            fontFamily: lng?.header5.textFamily,
                                                            color: Color(int.parse(cartPage.body.itemsList.totalPrice.color)),
                                                            fontSize: lng?.header5.size.toDouble(),
                                                            fontWeight: FontWeight.w300
                                                        ),)
                                                    ],
                                                  ),

                                                  (index < demoCartProvider.cartItems.length - 1)
                                                      ? const Padding(
                                                    padding: EdgeInsets.all(18.0),
                                                    child: Divider(
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                                      : const SizedBox(height: 15,)
                                                ],
                                              ),
                                            );
                                          }
                                      ),

                                      const Divider(color: Colors.grey,),
                                      const SizedBox(height: 10,),

                                      /// - Special Intructions
                                      Visibility(
                                        visible: (cartPage.body.specialInstructions.visibility=='true'),
                                        child: Column(
                                          children: [
                                            MyText(
                                              cartPage.body.specialInstructions.title.data ,
                                              style: TextStyle(
                                                fontFamily: "${lng?.header5.textFamily}",
                                                color: Color(int.parse(cartPage.body.specialInstructions.title.color)),
                                                fontSize: lng?.header5.size.toDouble()
                                              ),),
                                            // MyText(getTranslated(context, "sepecial instructions")!,
                                            //   style: TextStyle(fontFamily: "${getTranslated(
                                            //       context, "fontFamilyBody")!}",
                                            //     color: Colors.amber,
                                            //     fontSize: double.parse(getTranslated(
                                            //         context, "cartpageHeader2")!),),),
                                            const SizedBox(height: 10,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 18.0, right: 18),
                                              child: SizedBox(
                                                // width: 400,
                                                // height: 40,
                                                child: MyTextFormField(
                                                  autofocus: false,
                                                  style: TextStyle(color: Color(int.parse(cartPage.body.specialInstructions.textfieldHint.color))),
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
                                                    hintText: getTranslated(
                                                        context, "sepecial instructions")!,
                                                    hintStyle: TextStyle(
                                                        fontFamily: getTranslated(
                                                            context, "fontFamilyBody")!,
                                                        color: Colors.white38),

                                                  ),

                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            const Divider(color: Colors.grey,),
                                          ],
                                        ),
                                      ),
                                      /// - checkbox
                                      Padding(
                                        padding: const EdgeInsets.all(18 ),
                                        child: Column(
                                          children: [
                                            Visibility(
                                              visible:(cartPage.body.cutleryCheckBox.visibility=='true') ,
                                              child: CheckboxOption(
                                                value: checkboxBool,
                                                onChanged: _valueChangedHandler(),
                                                label: '1',
                                                text: 'I DONT NEED CUTLERY',
                                                addOnFlag: false,
                                                colorOfBox: Color(int.parse(cartPage.body.cutleryCheckBox.title.color)),
                                                colorOfText: Color(int.parse(cartPage.body.cutleryCheckBox.title.color)),
                                                /// - Selceted Image
                                              ),

                                            ),
                                            Visibility(
                                              visible:(cartPage.body.contactlessCheckBox.visibility=='true') ,
                                              child: CheckboxOption(
                                                value: checkboxBool,
                                                onChanged: _valueChangedHandler(),
                                                label: '1',
                                                text: 'CONTACTLESS DELIVERY',
                                                addOnFlag: false,
                                                /// - Selceted Image
                                                colorOfBox: Color(int.parse(cartPage.body.contactlessCheckBox.title.color)),
                                                colorOfText:  Color(int.parse(cartPage.body.contactlessCheckBox.title.color)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      /// - Promtion
                                      Visibility(
                                        visible: (cartPage.body.promoCode.visibility=='true'),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: SizedBox(
                                                  // width: 295,
                                                  height: 50,
                                                  child: MyTextFormField(
                                                    autofocus: false,
                                                    style:
                                                    TextStyle(color: Color(int.parse(cartPage.body.promoCode.textfieldHint.color))),
                                                    // TextStyle(color: Colors.white70),

                                                    // scrollPadding: EdgeInsets.only(bottom:40),
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.black45,
                                                      contentPadding: const EdgeInsets
                                                          .only(left: 10, right: 10),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                        (Localizations.localeOf(context).languageCode == 'en') ?
                                                        const BorderRadius.only(
                                                          bottomLeft: Radius.circular(10.0),
                                                          topLeft: Radius.circular(10.0),
                                                        ) :
                                                        (Localizations.localeOf(context).languageCode == 'ar') ?
                                                        const BorderRadius.only(
                                                          bottomRight: Radius.circular(
                                                              10),
                                                          topRight: Radius.circular(10),
                                                        ) :
                                                        const BorderRadius.only(
                                                          bottomLeft: Radius.circular(
                                                              10.0),
                                                          topLeft: Radius.circular(10.0),
                                                        ),


                                                        borderSide: BorderSide(
                                                          color: Colors.transparent,
                                                          width: 1.0,),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius:

                                                        (Localizations
                                                            .localeOf(context)
                                                            .languageCode == 'en') ?
                                                        const BorderRadius.only(
                                                          bottomLeft: Radius.circular(
                                                              10.0),
                                                          topLeft: Radius.circular(10.0),
                                                        ) :
                                                        (Localizations
                                                            .localeOf(context)
                                                            .languageCode == 'ar') ?
                                                        const BorderRadius.only(
                                                          bottomRight: Radius.circular(
                                                              10),
                                                          topRight: Radius.circular(10),
                                                        ) :
                                                        const BorderRadius.only(
                                                          bottomLeft: Radius.circular(
                                                              10.0),
                                                          topLeft: Radius.circular(10.0),
                                                        ),
                                                        borderSide: BorderSide(
                                                            color: Colors.transparent,
                                                            width: 0.0),
                                                      ),
                                                      hintText: cartPage.body.promoCode.textfieldHint.data,
                                                      // hintText: getTranslated(context, "enter promo code")!,
                                                      hintStyle: TextStyle(
                                                          fontFamily: lng?.header5.textFamily,
                                                          // fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                          color: Color(int.parse(cartPage.body.promoCode.textfieldHint.color))
                                                          // color: Colors.white38
                                                      ),

                                                    ),

                                                  ),
                                                ),
                                              ),

                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 2.0),
                                                  child: SizedBox(
                                                    // width:80,
                                                    height: 48,
                                                    child: ElevatedButton(
                                                      onPressed: () {

                                                      },
                                                      style: ButtonStyle(
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              (Localizations.localeOf(context).languageCode == 'en') ?
                                                              const RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                    bottomRight: Radius.circular(10),
                                                                    topRight: Radius.circular(10),
                                                                  ),
                                                                  side: BorderSide(
                                                                      color: Colors.transparent)
                                                              ) :
                                                              (Localizations.localeOf(context).languageCode == 'ar') ?
                                                              const RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                    bottomLeft: Radius.circular(10),
                                                                    topLeft: Radius.circular(10),
                                                                  ),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .transparent)
                                                              ) :
                                                              const RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius
                                                                      .only(
                                                                    bottomRight: Radius
                                                                        .circular(10),
                                                                    topRight: Radius
                                                                        .circular(10),
                                                                  ),
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .transparent)
                                                              )
                                                          ),
                                                          overlayColor: MaterialStateProperty.all(Colors.black12),
                                                          elevation: MaterialStateProperty.all(0),
                                                          shadowColor: MaterialStateProperty.all(Colors.transparent),
                                                          backgroundColor:
                                                          MaterialStateProperty.all(Color(int.parse(cartPage.body.promoCode.addButton.backGroundColor))),
                                                          // MaterialStateProperty.all(Colors.amber),
                                                          foregroundColor: MaterialStateProperty.all(Colors.black),
                                                          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                                          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30))),
                                                      child: MyText(
                                                          cartPage.body.promoCode.addButton.data,
                                                        // getTranslated(context, "add")!,
                                                        style:
                                                        TextStyle(
                                                            color: Color(int.parse(cartPage.body.promoCode.addButton.color)),
                                                            fontSize: lng?.header3.size.toDouble(),
                                                            fontFamily: lng?.header3.textFamily),
                                                        // TextStyle(
                                                        //     color: Colors.white,
                                                        //     fontSize: 15,
                                                        //     fontFamily: getTranslated(
                                                        //         context,
                                                        //         "fontFamilyBody")),

                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15,),

                                      /// - Tip
                                      Visibility(
                                        visible: cartPage.body.tip.visibility=='true',
                                        child: Column(
                                          children: [
                                            MyText(
                                              cartPage.body.tip.title.data,
                                              style: TextStyle(
                                                fontFamily: "${lng?.header5.textFamily}",
                                                color: Colors.amber,
                                                fontSize: lng?.header5.size.toDouble(),
                                              ),),

                                            // MyText(
                                            //   getTranslated(context, "tip the driver")!,
                                            //   style: TextStyle(fontFamily: "${getTranslated(
                                            //       context, "fontFamilyBody")!}",
                                            //     color: Colors.amber,
                                            //     fontSize: double.parse(getTranslated(context, "cartpageHeader2")!),
                                            //   ),),
                                            const SizedBox(height: 15,),
                                            /// - tip the driver
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0, right: 18),
                                              child: SizedBox(
                                                // width: 400,
                                                // height: 40,
                                                child: MyTextFormField(
                                                  autofocus: false,
                                                  style: TextStyle(color: Color(int.parse(cartPage.body.tip.textfieldHint.color))),

                                                  // scrollPadding: EdgeInsets.only(bottom:50),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.black45,
                                                    //amber.withOpacity(0.1),
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
                                                    hintText: cartPage.body.tip.textfieldHint.data,
                                                    // hintText: getTranslated(context, "tip")!,
                                                    hintStyle: TextStyle(
                                                        fontFamily: lng?.header5.textFamily,
                                                        // fontFamily: getTranslated(context, "fontFamilyBody")!,
                                                        color: Color(int.parse(cartPage.body.tip.textfieldHint.color))
                                                        // color: Colors.white38
                                                    ),

                                                  ),

                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15,),

                               /// - New Changes

                                      /// - Login messages
                                      if(authProvider.loggedInUser==null)
                                      Container(
                                        height: 40,
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        color: Colors.amber,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // SequentialTextDisplay(
                                              //   texts: _texts,
                                              //   textAnimationDuration: Duration(milliseconds: 100), // Optional, set animation speed
                                              // ),
                                              Expanded(
                                                flex:5,
                                                child:  AnimatedTextKit(


                                                    animatedTexts: _texts.map((e) =>  RotateAnimatedText(e,
                                                      textStyle: TextStyle(
                                                      color: Colors.black,
                                                        // color:Color(int.parse(cartPage!.body.paymentMethods.creditCardPaymentMethodCheckBox!.selectedCard!.changeButton!.color),),
                                                        fontFamily:lng!.header2.textFamily,
                                                        fontWeight: FontWeight.bold,
                                                    ),
                                                     textAlign: TextAlign.left,
                                                     duration: const Duration(milliseconds:2000),
                                                      rotateOut: false,
                                                      alignment: Alignment.centerLeft
                                                    )).toList(),
                                                    repeatForever: true,


                                                  ),

                                              ),

                                              Expanded(
                                                child: Visibility(
                                                  visible: (authProvider.loggedInUser!=null)?false:true,
                                                  child: SizedBox(
                                                    height: 30,
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                        padding: EdgeInsets.all(0),
                                                        foregroundColor: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        Provider.of<TabIndexGenerator>(context, listen: false).setIndex(4);
                                                      },
                                                      child: MyText("Login", style: TextStyle(color:Colors.black,fontFamily:lng!.header2.textFamily),),




                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),

                                      /// - Address
                                      Visibility(
                                        visible: (cartPage.body.selectAddress.visibility=='true'),
                                        child: Container(
                                          color:Colors.black,
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 15,),
                                              Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        MyText(
                                                          cartPage.body.selectAddress.title.data,
                                                          // getTranslated(context, "address")!,
                                                          style: TextStyle(
                                                            // color: Colors.amber,
                                                              color: Color(int.parse(cartPage.body.selectAddress.title.color)),
                                                              fontSize: lng?.titleHeader1.size.toDouble(),
                                                              fontFamily:lng?.titleHeader1.textFamily
                                                            // fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!),
                                                          )
                                                          // fontFamily: getTranslated(context, "fontFamilyButtons")!)
                                                          ,),
                                                      ],
                                                    ),
                                                  )),

                                              const SizedBox(height: 10,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 18.0, right: 18),
                                                child: Container(
                                                    decoration:  BoxDecoration(
                                                      color:
                                                      Colors.grey.shade100.withOpacity(0.2),
                                                      // Color(int.parse(cartPage.body.selectAddress.backGroundColor)),
                                                      borderRadius:const BorderRadius.only(
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
                                                    // padding: EdgeInsets.all(18),
                                                    child: ListTile(
                                                      // contentPadding: EdgeInsets.only(),
                                                      onTap: () {

                                                      },
                                                      title: Row(
                                                        children: [
                                                          Image.network("${cartPage.body.selectAddress.icon.imageIcon}", scale: 3,height: 17,),
                                                          const SizedBox(width: 8,),
                                                          MyText(
                                                            "Delivering to",
                                                            // getTranslated(context, "pleaseSelectAddress")!,
                                                            style: TextStyle(
                                                                color:
                                                                 Colors.white54,
                                                                // Color(int.parse(cartPage.body.selectAddress.hintText.color)),
                                                                fontWeight: FontWeight.w300,
                                                                fontFamily: lng?.header3.textFamily
                                                              // fontFamily: getTranslated(context, "cartpageHeader2")
                                                            ),),
                                                          // MyText(
                                                          //   cartPage.body.selectAddress.hintText.data,
                                                          //   // getTranslated(context, "pleaseSelectAddress")!,
                                                          //   style: TextStyle(
                                                          //       color: Color(int.parse(cartPage.body.selectAddress.hintText.color)),
                                                          //       fontWeight: FontWeight.w300,
                                                          //       fontFamily: lng?.header3.textFamily
                                                          //     // fontFamily: getTranslated(context, "cartpageHeader2")
                                                          //   ),),
                                                        ],
                                                      ),

                                                      subtitle: MyText(
                                                        // "United Arab Emirates - Dubai - Silicon Oasis Binghatti Point - 910 ",


                                                        cartPage.body.selectAddress.hintText.data,
                                                        // getTranslated(context, "pleaseSelectAddress")!,
                                                        style: TextStyle(
                                                            fontSize:  lng?.header2.size.toDouble(),
                                                            color:
                                                            Colors.white38,
                                                            // Color(int.parse(cartPage.body.selectAddress.hintText.color)),
                                                            fontWeight: FontWeight.w300,
                                                            fontFamily: lng?.header3.textFamily,

                                                          // fontFamily: getTranslated(context, "cartpageHeader2")
                                                        ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                                      trailing: (authProvider.loggedInUser!=null)?SizedBox(
                                                          height: 30,
                                                          child: TextButton(
                                                            
                                                            style: TextButton.styleFrom(
                                                              padding: const EdgeInsets.all(0),
                                                              backgroundColor: Colors.transparent,
                                                              // foregroundColor: Colors.white,
                                                            ),
                                                            onPressed: () {

                                                              if(authProvider.loggedInUser!=null){
                                                                showModalBottomSheet(
                                                                    useSafeArea: true,
                                                                    isScrollControlled: true,
                                                                    context: context,
                                                                    backgroundColor: Colors.transparent,
                                                                    builder: (context) =>
                                                                        DraggableScrollableSheet(
                                                                            initialChildSize: 0.5,
                                                                            minChildSize: 0.5,
                                                                            maxChildSize: 1,
                                                                            expand: true,
                                                                            builder: (context, scrollController) {
                                                                              return AddressListSheet(
                                                                                  scrollController);
                                                                            }

                                                                        )
                                                                );
                                                              }
                                                              else{
                                                                Provider.of<TabIndexGenerator>(context, listen: false).setIndex(4);
                                                              }

                                                            },
                                                            child:
                                                            MyText("Change", style: TextStyle(color:Color(int.parse(cartPage!.body.paymentMethods.creditCardPaymentMethodCheckBox!.selectedCard!.changeButton!.color),),fontFamily:lng!.header2.textFamily),)





                                                          ),
                                                        ):null,

                                                      // leading:

                                                      // leading: Image.asset("assets/images/icon_location_address.png", scale: 3,),
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      /// - Payment
                                      Container(
                                        color: Colors.black,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 15,),
                                            /// - Title
                                            Align(alignment: Alignment.centerLeft, child: Padding(
                                              padding: EdgeInsets.only(left: 18.0, right: 18),
                                              child:

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  MyText(
                                                    cartPage.body.selectPayment.title.data,
                                                    style:  TextStyle(
                                                        color: Color(int.parse(cartPage.body.selectPayment.title.color)),
                                                        fontWeight: FontWeight.w300,
                                                        fontFamily: lng?.titleHeader1.textFamily,
                                                        fontSize: lng?.titleHeader1.size.toDouble()
                                                      // fontFamily: getTranslated(context, "cartpageHeader2")
                                                    ),),

                                                ],
                                              ),

                                              // MyText(
                                              //   getTranslated(context, "payment")!,
                                              //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                                              //       color: Colors.amber,
                                              //       fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                                            )),







                                            Visibility(
                                              visible: (authProvider.loggedInUser!=null)?true:false,
                                              child: Column(
                                                children: [
                                                  /// - Credit Card
                                                  CreditCardPaymentMethodCheckbox(
                                                    onChanged: _creditCardPaymentChangedHandler(),
                                                    value: creditCardCheckboxValue,
                                                    addOnFlag: false,
                                                    text: "Debit/Credit Card",
                                                    colorOfBox: Colors.white,
                                                    colorOfSelectedBox: Colors.amber,
                                                    colorOfText: Colors.white,
                                                    lng: lng,
                                                    cartPage: cartPage,

                                                  ),
                                                  /// - Loyalty
                                                  LoyaltyPaymentMethodCheckbox(
                                                    pointController: SliderProvider.pointController,
                                                    pointValue: SliderProvider.selectedPoint,
                                                    onChanged: _loyaltyPaymentChangedHandler(),
                                                    value: loyaltyCheckboxValue,
                                                    addOnFlag: false,
                                                    text: "Loyalty Credits",
                                                    colorOfBox: Colors.white,
                                                    colorOfText: Colors.white,
                                                    fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                                    cartPage: cartPage,
                                                    lng: lng,
                                                    pointRate: (loyaltyProvider.loyaltyPointRate!=null)?loyaltyProvider.loyaltyPointRate!.body!.value!:0,
                                                    maxValue: (authProvider.loggedInUser!=null)?(loyaltyProvider.loyaltyPoint!=null)?loyaltyProvider.loyaltyPoint!.body!.amount!:0:0,
                                                  ),
                                                  const SizedBox(height: 15,),
                                                  /// -  OF Gifts
                                                  CartGiftsWidget(
                                                    cartPage: cartPage,
                                                    lng: lng,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                /// - New Changes

                                      /// - sub total
                                      // const SizedBox(height: 15,),
                                      Container(
                                        color: Colors.black,
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Divider(color:Colors.white54),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  MyText(
                                                    cartPage.body.subTotal.data,
                                                    style: TextStyle(
                                                        fontFamily: "${lng?.header3.textFamily}",
                                                        color: Color(int.parse(cartPage.body.subTotal.color)),
                                                        fontSize: lng?.header3.size.toDouble(),
                                                        fontWeight: FontWeight.w300),),
                                                  // MyText(
                                                  //   getTranslated(context, "subTotal")!,
                                                  //   style: TextStyle(
                                                  //       fontFamily: "${getTranslated(
                                                  //           context,
                                                  //           "fontFamilyBody")!}",
                                                  //       color: Colors.white,
                                                  //       fontSize: double.parse(
                                                  //           getTranslated(context,
                                                  //               "cartpageHeader2SubTotal")!),
                                                  //       fontWeight: FontWeight.w300),),
                                                  MyText("AED ${demoCartProvider.Details.Total}",
                                                    style: TextStyle(
                                                        fontFamily: "${lng?.header3.textFamily}",
                                                        color: Color(int.parse(cartPage.body.subTotal.color)),
                                                        fontSize: lng?.header3.size.toDouble(),
                                                        fontWeight: FontWeight.w300),),
                                                ],),
                                            ),
                                            if(authProvider.loggedInUser!=null)
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      MyText(
                                                        "LOYALTY POINT",
                                                        // cartPage.body.totalAfterPromoCode.data,
                                                        style: TextStyle(
                                                            fontFamily: "${lng?.header3.textFamily}",
                                                            color: Color(int.parse(cartPage.body.totalAfterPromoCode.color)),
                                                            fontSize: lng?.header3.size.toDouble(),
                                                            fontWeight: FontWeight.w300),),
                                                      // MyText(
                                                      //   getTranslated(context, "totalAfterPromoCode")!,
                                                      //   style: TextStyle(
                                                      //       fontFamily: "${getTranslated(
                                                      //           context,
                                                      //           "fontFamilyBody")!}",
                                                      //       color: Colors.amber,
                                                      //       fontSize: double.parse(
                                                      //           getTranslated(context,
                                                      //               "cartpageHeader2SubTotal")!),
                                                      //       fontWeight: FontWeight.w300),),
                                                      MyText('AED -${(SliderProvider.selectedPoint/loyaltyPointRate).toStringAsFixed(1)}',
                                                        //"AED ${demoCartProvider.Details.Total}",
                                                        style: TextStyle(
                                                            fontFamily: "${lng?.header3.textFamily}",
                                                            color: Color(int.parse(cartPage.body.totalAfterPromoCode.color)),
                                                            fontSize: lng?.header3.size.toDouble(),
                                                            fontWeight: FontWeight.w300),),
                                                    ],),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      MyText(
                                                        cartPage.body.totalAfterPromoCode.data,
                                                        style: TextStyle(
                                                            fontFamily: "${lng?.header3.textFamily}",
                                                            color: Color(int.parse(cartPage.body.totalAfterPromoCode.color)),
                                                            fontSize: lng?.header3.size.toDouble(),
                                                            fontWeight: FontWeight.w300),),
                                                      // MyText(
                                                      //   getTranslated(context, "totalAfterPromoCode")!,
                                                      //   style: TextStyle(
                                                      //       fontFamily: "${getTranslated(
                                                      //           context,
                                                      //           "fontFamilyBody")!}",
                                                      //       color: Colors.amber,
                                                      //       fontSize: double.parse(
                                                      //           getTranslated(context,
                                                      //               "cartpageHeader2SubTotal")!),
                                                      //       fontWeight: FontWeight.w300),),
                                                      MyText('AED ${demoCartProvider.Details.Total-SliderProvider.selectedPoint/10}',
                                                        //"AED ${demoCartProvider.Details.Total}",
                                                        style: TextStyle(
                                                            fontFamily: "${lng?.header3.textFamily}",
                                                            color: Color(int.parse(cartPage.body.totalAfterPromoCode.color)),
                                                            fontSize: lng?.header3.size.toDouble(),
                                                            fontWeight: FontWeight.w300),),
                                                    ],),
                                                ),
                                              ],
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  MyText(
                                                    cartPage.body.deliveryFee.data,
                                                    style: TextStyle(
                                                        fontFamily: "${lng?.header3.textFamily}",
                                                        color: Color(int.parse(cartPage.body.deliveryFee.color)),
                                                        fontSize: lng?.header3.size.toDouble(),
                                                        fontWeight: FontWeight.w300),),
                                                  // MyText(
                                                  //   getTranslated(context, "delivery fee")!,
                                                  //   style: TextStyle(
                                                  //       fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                                  //       color: Colors.white,
                                                  //       fontSize: 15,
                                                  //       fontWeight: FontWeight.w300),),
                                                  MyText("AED 0.00", style: TextStyle(
                                                      fontFamily: "${lng?.header3.textFamily}",
                                                      color: Color(int.parse(cartPage.body.deliveryFee.color)),
                                                      fontSize: lng?.header3.size.toDouble(),
                                                      fontWeight: FontWeight.w300),),
                                                ],),
                                            ),
                                          ],
                                        ),
                                      ),

                                      /// - Total & credit calculation
                                      Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            // borderRadius: BorderRadius.only(
                                            //   topRight: Radius.circular(10),
                                            //   bottomLeft: Radius.circular(10),
                                            //   topLeft: Radius.circular(10),
                                            //   bottomRight: Radius.circular(10),
                                            // ),
                                            // border: Border.all(
                                            //   width: 0.5,
                                            //   color: Colors.white,
                                            //   style: BorderStyle.solid,
                                            // ),
                                          ),
                                          padding:const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              /// - Total
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: "${cartPage.body.total.totalTitle.data} ",
                                                      // text: getTranslated(context, "total")!,
                                                      style: TextStyle(
                                                        fontFamily: "${lng?.header5.textFamily}",
                                                        // fontFamily: "${getTranslated(context, "fontFamilyBody")!}",
                                                        color: Color(int.parse(cartPage.body.total.totalTitle.color)),
                                                        // color: Colors.amber,
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: lng?.header5.size.toDouble(),
                                                        // fontSize: double.parse(getTranslated(context, "cartpageHeader2")!),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: ' AED ${(authProvider.loggedInUser!=null)?(demoCartProvider.Details.Total-(SliderProvider.selectedPoint/loyaltyPointRate)).toStringAsFixed(1):demoCartProvider.Details.Total}',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w300,
                                                              color: Color(int.parse(cartPage.body.total.price.color))
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              /// - credit calculation
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
                                                child: Container(
                                                  color:Colors.transparent,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      // MyText(
                                                      //   cartPage.body.credit.data,
                                                      //   // getTranslated(context, "earned credits")!,
                                                      //   style: TextStyle(
                                                      //       fontFamily: lng?.header1.textFamily,
                                                      //       color: Color(int.parse(cartPage.body.credit.color)),
                                                      //       fontSize: lng?.header1.size.toDouble()),),
                                                      MyText(getTranslated(
                                                          context, "total of credits")!,
                                                        style: TextStyle(
                                                            fontFamily: getTranslated(
                                                                context, "fontFamilyBody"),
                                                            color: Colors.amber,
                                                            fontSize: 10),),
                                                      MyText(getTranslated(
                                                          context, "total  credits")!,
                                                        style: TextStyle(
                                                            fontFamily: getTranslated(
                                                                context, "fontFamilyBody"),
                                                            color: Colors.amber,
                                                            fontSize: 10),),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10,),
                                              ScheduleCheckbox(
                                                onChanged: _scheduleChangedHandler(),
                                                text: "Schedule",
                                                value: scheduleCheckboxValue,
                                                colorOfBox: Colors.white,
                                                colorOfText: Colors.white54,
                                                fontFamily: "Raleway-Regular",

                                              )

                                            ],
                                          )
                                      ),



                                      /// - Address
                                      Visibility(
                                        visible: false,
                                        // (cartPage.body.selectAddress.visibility=='true'),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 20,),
                                            Align(alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                                                  child: MyText(
                                                    cartPage.body.selectAddress.title.data,
                                                    // getTranslated(context, "address")!,
                                                    style: TextStyle(
                                                        // color: Colors.amber,
                                                        color: Color(int.parse(cartPage.body.selectAddress.title.color)),
                                                        fontSize: lng?.titleHeader1.size.toDouble(),
                                                        fontFamily:lng?.titleHeader1.textFamily
                                                        // fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!),
                                                    )
                                                        // fontFamily: getTranslated(context, "fontFamilyButtons")!)
                                                    ,),
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0, right: 18),
                                              child: Container(

                                                  decoration:  BoxDecoration(
                                                    color: Color(int.parse(cartPage.body.selectAddress.backGroundColor)),
                                                    borderRadius:const BorderRadius.only(
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
                                                  // padding: EdgeInsets.all(18),
                                                  child: ListTile(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          useSafeArea: true,
                                                          isScrollControlled: true,
                                                          context: context,

                                                          backgroundColor: Colors.transparent,
                                                          builder: (context) =>
                                                              DraggableScrollableSheet(
                                                                  initialChildSize: 0.5,
                                                                  minChildSize: 0.5,
                                                                  maxChildSize: 1,
                                                                  expand: true,
                                                                  builder: (context, scrollController) {
                                                                    return AddressListSheet(
                                                                        scrollController);
                                                                  }

                                                              )


                                                      );
                                                    },
                                                    title: MyText(
                                                      cartPage.body.selectAddress.hintText.data,
                                                      // getTranslated(context, "pleaseSelectAddress")!,
                                                      style: TextStyle(
                                                          color: Color(int.parse(cartPage.body.selectAddress.hintText.color)),
                                                          fontWeight: FontWeight.w300,
                                                          fontFamily: lng?.header3.textFamily
                                                          // fontFamily: getTranslated(context, "cartpageHeader2")
                                                      ),),
                                                    leading: Image.network("${cartPage.body.selectAddress.icon.imageIcon}", scale: 3,),

                                                    // leading: Image.asset("assets/images/icon_location_address.png", scale: 3,),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      /// - Payment
                                      Visibility(
                                        visible:false,
                                        //(cartPage.body.selectPayment.visibility=='true'),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 15,),
                                            Align(alignment: Alignment.centerLeft, child: Padding(
                                              padding: EdgeInsets.only(left: 18.0, right: 18),
                                              child:

                                              MyText(
                                                cartPage.body.selectPayment.title.data,
                                                style:  TextStyle(
                                                    color: Color(int.parse(cartPage.body.selectPayment.title.color)),
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily: lng?.titleHeader1.textFamily,
                                                    fontSize: lng?.titleHeader1.size.toDouble()
                                                  // fontFamily: getTranslated(context, "cartpageHeader2")
                                                ),),
                                              // MyText(
                                              //   getTranslated(context, "payment")!,
                                              //   style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",
                                              //       color: Colors.amber,
                                              //       fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),
                                            )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0, right: 18),
                                              child: Container(

                                                  decoration:  BoxDecoration(
                                                    color: Color(int.parse(cartPage.body.selectPayment.backGroundColor)),
                                                    borderRadius: const BorderRadius.only(
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
                                                  // padding: EdgeInsets.all(18),
                                                  child: ListTile(

                                                    title: MyText(
                                                      cartPage.body.selectPayment.hintText.data,
                                                      // getTranslated(context, "pleaseSelectAddress")!,
                                                      style: TextStyle(
                                                          color: Color(int.parse(cartPage.body.selectAddress.hintText.color)),
                                                          fontWeight: FontWeight.w300,
                                                          fontFamily: lng?.header3.textFamily
                                                        // fontFamily: getTranslated(context, "cartpageHeader2")
                                                      ),),
                                                    leading: Image.network("${cartPage.body.selectPayment.icon.imageIcon}", scale: 3,),


                                                    // leading: Image.asset("assets/images/icon_location_address.png",scale:3,),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                      /// - checkbox

                                      Visibility(
                                        visible: false,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 15,),
                                            MyText(getTranslated(context, "optional")!, style: TextStyle(fontFamily: "${getTranslated(
                                                  context, "fontFamilyBody")!}",
                                                  color: Colors.amber,
                                                  fontSize: double.parse(getTranslated(
                                                      context, "cartpageHeader2")!)),),
                                            Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Column(
                                                children: [
                                                  CheckboxOption(
                                                    value: checkboxBool,
                                                    onChanged: _valueChangedHandler(),
                                                    label: '1',
                                                    text: 'SCHEDULE PICKUP',
                                                    addOnFlag: false,
                                                    colorOfBox: Colors.white,
                                                    colorOfText: Colors.white,
                                                  ),


                                                  CheckboxOption(
                                                    value: checkboxBool,
                                                    onChanged: _valueChangedHandler(),
                                                    label: '1',
                                                    text: 'SCHEDULE DELIVERY',
                                                    addOnFlag: false,
                                                    colorOfBox: Colors.white,
                                                    colorOfText: Colors.white,
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),




                                      const SizedBox(height: 50,),
                                    ],
                                  ),

                                ),


                                /// - Empty cart
                                Visibility(
                                  visible: cartEmpty,
                                  child: Column(
                                    children: [


                                      MyText(
                                        cartPage.body.emptyCart.data,
                                         style: TextStyle(
                                            fontFamily: lng?.titleHeader1.textFamily,
                                            // fontFamily: getTranslated(context, "fontFamilyButtons")!,
                                            color: Color(int.parse(cartPage.body.emptyCart.color)),
                                            // Colors.amber,
                                            fontSize: lng?.titleHeader1.size.toDouble()
                                        ),
                                      ),
                                      // MyText(getTranslated(context, "yourCartIsEmpity")!,
                                      //   style: TextStyle(fontFamily: getTranslated(
                                      //       context, "fontFamilyButtons")!,
                                      //       color: Colors.white,
                                      //       fontSize: double.parse(getTranslated(
                                      //           context, "fontFamilyButtonsSize")!)),),
                                      const SizedBox(height: 10,),
                                      SizedBox(
                                          width: 330,
                                          height: 38,
                                          child: ElevatedButton(
                                              onPressed: () {widget.onChanged(1);},
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                                                        side: const BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1.5)
                                                    )
                                                ),


                                              ),
                                              child:
                                              MyText(
                                               cartPage.body.orderNowButton.data,
                                                style: TextStyle(
                                                    fontFamily:"${lng?.titleHeader1.textFamily}",

                                                    color: Color(int.parse(cartPage.body.orderNowButton.color)),
                                                    fontSize: lng?.titleHeader1.size.toDouble(),

                                                )
                                                ,)

                                              // MyText(
                                              //   getTranslated(context, "ORDER NOW")!,
                                              //   style: TextStyle(
                                              //       fontFamily: getTranslated(
                                              //           context, "fontFamilyButtons")!,
                                              //       color: Colors.white,
                                              //       fontSize: double.parse(
                                              //           getTranslated(context,
                                              //               "fontFamilyButtonsSize")!)),)

                                          )
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),


                        ),),


                      /// - bring it on
                      bottomSheet: Visibility(
                        visible: !cartEmpty,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                if(authProvider.loggedInUser!=null){
                                /// - Show creating order sheet model
                                showModalBottomSheet(
                                  // expand: false,
                                    isDismissible: false,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (modelContext) => PlacingOrderModel(context, )).then((value) {

                                    if (Provider.of<PlacingOrderModelProvider>(context, listen: false).makeOrderProgress == 1){
                                      /// - show loading
                                      // _showMakingOrderDialog(context);

                                      // print('requesting to access token...');
                                      // Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestAccessToken(NetworkConstants.networkAuthorizationApiKey).then((value) {
                                      //   String? accessToken = Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestTokenResponse.accessToken;
                                      //   print('creating order...');
                                      //   Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrder(accessToken!,NetworkConstants.outletReference).then((value) {
                                      //     //  print(paymentUrl!);
                                      //     // _launchURL(paymentUrl!);
                                      //
                                      //     String?  orderReference= Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrderResponse.embedded!.payment![0].orderReference;
                                      //     String?  paymentReference= Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrderResponse.embedded!.payment![0].id;
                                      //     String? paymentUrl = Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrderResponse.embedded!.payment![0].links!.paymentCard!.href;
                                      //     String? directPaymentUrl = Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestCreateOrderResponse.links!.payment!.href;
                                      //
                                      //     print(paymentUrl);
                                      //     print("Submit payment card information...");
                                      //     Navigator.of(context, rootNavigator: true).pop();
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //         builder: (context) => AuthenticationScreen(
                                      //           // authenticationUrl: '${href}',
                                      //           // acsPaReq: '${acsPaReq}',
                                      //           // acsMd: '${acsMd}',
                                      //           // acsUrl: '${acsurl}',
                                      //           // accessToken: accessToken,
                                      //           directPaymentLink: directPaymentUrl!,
                                      //         ),
                                      //       ),
                                      //     );
                                      //
                                      //     // Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformation(paymentUrl!,accessToken).then((value) {
                                      //     //
                                      //     //   String? acsurl =  Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformationResponse.the3Ds!.acsUrl;
                                      //     //   String? acsPaReq =  Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformationResponse.the3Ds!.acsPaReq;
                                      //     //   String? acsMd =  Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformationResponse.the3Ds!.acsMd;
                                      //     //   String? href =  Provider.of<NetworkTwoStagePaymentProvider>(context, listen: false).requestSubmitPaymentCardInformationResponse.links!.cnp3Ds!.href;
                                      //     //
                                      //     //
                                      //     //   print(acsurl);
                                      //     //   print(acsPaReq);
                                      //     //   print(acsMd);
                                      //     //
                                      //     //   Navigator.push(
                                      //     //     context,
                                      //     //     MaterialPageRoute(
                                      //     //       builder: (context) => AuthenticationScreen(
                                      //     //         authenticationUrl: '${href}',
                                      //     //         acsPaReq: '${acsPaReq}',
                                      //     //         acsMd: '${acsMd}',
                                      //     //         acsUrl: '${acsurl}',
                                      //     //         accessToken: accessToken,
                                      //     //       ),
                                      //     //     ),
                                      //     //   );
                                      //     //
                                      //     // });
                                      //
                                      //
                                      //   });
                                      //
                                      // });



                                    }




                                });
                                }
                                else{
                                  Provider.of<TabIndexGenerator>(context, listen: false).setIndex(4);
                                }

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(cartPage.body.bringItButton.backGroundColor)),),
                                //MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0.0),
                                        side: const BorderSide(
                                            color: Colors.transparent, width: 1.5)
                                    )
                                ),


                              ),
                              child: MyText(
                                cartPage.body.bringItButton.data,
                                // getTranslated(context, "bringItOn")!,
                                style: TextStyle(
                                    fontFamily: "${lng?.titleHeader1.textFamily}",
                                    color: Color(int.parse(cartPage.body.bringItButton.color)),
                                    fontSize: lng?.titleHeader1.size.toDouble()
                                ),)
                                    // fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),)


                          ),
                        ),
                      ),
                      drawer: DrawerWidget(layOut: widget.layOut, onChanged: (value) {widget.onChanged(value);},),
                    )
                    :LoadingPage();

                  }

                  )





     ],
   );
  }





  bool switchValue = false;



  /// - Code changes - Payment mehtod

  bool creditCardCheckboxValue = false;
  ValueChanged _creditCardPaymentChangedHandler() {
    return (value) => setState(() {
      // print(value);
      // if(value==true)
      //   creditCardCheckboxValue = false;
      // else
        creditCardCheckboxValue =value;
       print(value);

    });
  }

  bool loyaltyCheckboxValue = false;
  ValueChanged _loyaltyPaymentChangedHandler() {
    return (value) => setState(() {
      // print(value);
      // if(value==true)
      //   creditCardCheckboxValue = false;
      // else
      loyaltyCheckboxValue =value;
      print(value);

    });
  }

  bool scheduleCheckboxValue = false;
  ValueChanged _scheduleChangedHandler() {
    return (value) => setState(() {
      // print(value);
      // if(value==true)
      //   creditCardCheckboxValue = false;
      // else
      scheduleCheckboxValue =value;
      print(value);

    });
  }

  /// - Code changes - Payment mehtod


  void _showMakingOrderDialog(BuildContext context, [bool mounted = true]) async {
    // show the loading dialog
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            // The background color
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                height: 150,
                width: 100,
                // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:  [

                    LoadingWidget(),
                    // The loading indicator
                    // CircularProgressIndicator(
                    //   color: Colors.amber,
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // // Some text
                    // Text(
                    //   'Loading...',
                    //   style: TextStyle(color: Colors.black),
                    // )
                  ],
                ),
              ),
            ),
          );
        });

    // // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
    // await Future.delayed(const Duration(seconds: 3));
    //
    // // Close the dialog programmatically
    // // We use "mounted" variable to get rid of the "Do not use BuildContexts across async gaps" warning
    // if (!mounted) return;
    // Navigator.of(context).pop();
  }



  List<String> _texts = [
    'Don\'t miss out – log in or sign up for full access!',
    'Unlock quick and easy ordering – log in now!',
    'Ready to feast? Log in for address and payments.',
    'Save time and log in – your details await!',
    'Join us for ordering – log in or sign up today.'
  ];
  int _currentIndex = 0;


}
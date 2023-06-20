

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/menus/full_menu.dart';
import 'package:operation_falafel/screens/menus/vegan_menu.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/my_rewards.dart';
import 'package:operation_falafel/widgets/address_list_sheet.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/AppThemeModels/DesignPerPage/HomePage/home_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../models/AppThemeModels/FontSizes/font_sizes.dart';
import '../../providers/AppTheme/theme_provider.dart';
import '../../providers/AuthProvider/auth_provider.dart';
import '../../providers/ProfileProviders/profile_provider.dart';
import '../../providers/demo_cart/demo_cart_provider.dart';
import '../../widgets/loading_page.dart';
import '../my rewards page/rewards_pages/transfer_credits.dart';


class MainMenu extends StatefulWidget{
  final String layOut ;
  final ValueChanged onChanged;
  MainMenu(this.onChanged,{super.key, required this.layOut});
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  int currentPos = 0;
  final List<String> imgList = [

    "assets/images/OF_NEWWrap_AppBanner.jpeg",
    "assets/images/OF_NEWWrap_AppBanner.jpeg",
    "assets/images/OF_NEWWrap_AppBanner.jpeg",
    "assets/images/OF_NEWWrap_AppBanner.jpeg",
  ];

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String languageflag= Localizations.localeOf(context).languageCode;
    return
      Consumer<ThemeProvider>(
        builder: (context, appTheme, child) {

          Language? lng= (Localizations.localeOf(context).languageCode=='ar')? appTheme.appTheme.fontSizes?.ar : appTheme.appTheme.fontSizes?.en;
          HomePage? homePageDesign = appTheme.appTheme.designPerPage?.homePage;
          bool loadingDesign= homePageDesign!=null;
          List<String> headerTitleParts = [];
          if(homePageDesign!=null){
            if(homePageDesign.body.dashboardWidget.headerTitle!=null){
              headerTitleParts= homePageDesign.body.dashboardWidget.headerTitle.text.data.split('*');
            }
          }





         return (loadingDesign)?
           Stack(
            children: [
              Image.asset(
                "assets/images/background.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Scaffold(
                key: _drawerKey,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  // toolbarHeight: 40,
                    leading:Visibility(
                      visible: (widget.layOut=="Mobile")?true:false,
                      child: IconButton(
                        onPressed: (){

                          _drawerKey.currentState?.openDrawer();
                        },
                        icon:  ImageIcon(
                          NetworkImage("${homePageDesign?.appBar.drawerIcon.imageIcon}",),
                          size:
                          (widget.layOut=="Mobile")? double.parse(homePageDesign?.appBar.drawerIcon.mobileSize as String):double.parse(homePageDesign?.appBar.drawerIcon.tabletSize as String),
                        ),
                      ),
                    ) ,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 15, bottom: 11, left:15),
                        child: Stack(
                          children: [
                            Container(
                               padding: EdgeInsets.all(8),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
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
                              child:
                              // ImageIcon(
                              //   size:(widget.layOut=="Mobile")? double.parse(homePageDesign?.appBar.drawerIcon.mobileSize as String):double.parse(homePageDesign?.appBar.drawerIcon.tabletSize as String),
                              //
                              //   ((homePageDesign!=null)?
                              //   NetworkImage("${homePageDesign.appBar.searchAction.imageIcon}"):
                              //   AssetImage("assets/images/icon_search.png")) as ImageProvider<Object>?,
                              // ),

                               Image.network("${homePageDesign.appBar.searchAction.imageIcon}",height: double.parse(homePageDesign?.appBar.searchAction.mobileSize as String),),

                              // Image.asset("assets/images/icon_search.png",height: 30,width: 30,),

                            ),

                            Positioned.fill(
                                child:  Material(
                                  color: Colors.transparent,
                                  child:   InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    splashColor: Colors.black,
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                    onTap: (){
                                      Provider.of<ThemeProvider>(context, listen: false).readJson();
                                      // print("text");
                                    },
                                  ),

                                )
                            ),

                          ],
                        ),
                      ),
                    ],
                    title: Text(
                     homePageDesign.appBar.titleText.data,
                     // getTranslated(context, "operationFalafelLogo")!,
                      style: TextStyle(
                          fontFamily: lng?.logoTitle.textFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: lng?.logoTitle.size.toDouble()
                      ),)
                ),
                body:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView(

                        physics:const BouncingScrollPhysics(),
                        children: [

                          /// - Slider - Done Design
                          ClipRRect(
                            borderRadius: const BorderRadius.only(),
                            child: CarouselSlider(

                                options: CarouselOptions(
                                  // height: MediaQuery. of(context). size. height-470,
                                    aspectRatio: 1.25,
                                    viewportFraction: 1,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    // enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentPos = index;
                                      });
                                    }

                                ),
                                items: imgList.map((item) => Image.asset(item, fit: BoxFit.cover,
                                ),
                                )
                                    .toList()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imgList.map((url) {
                              int index = imgList.indexOf(url);
                              return Padding(
                                padding: const EdgeInsets.only(left: 25.0,right: 25 ,top: 5,bottom: 5),
                                child: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentPos == index
                                        ?const Color.fromRGBO(255, 174, 0, 0.9019607843137255)
                                        : const Color.fromRGBO(211, 211, 211, 0.4),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          /// - Location
                          Container(
                            height: 35,
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(homePageDesign.body.locationWidget.locationIcon.imageIcon,height: (widget.layOut=="Mobile")? double.parse(homePageDesign?.body.locationWidget.locationIcon.mobileSize as String):double.parse(homePageDesign?.body.locationWidget.locationIcon.tabletSize as String),),
                                // Image.asset("assets/images/home_pin.png", scale: 2.5,),

                                const SizedBox(width: 10,),
                                Text("Al Souq Al Kabeer", style: TextStyle(fontFamily:"Raleway-Regular", color: Color(int.parse(homePageDesign.body.locationWidget.locationTile.color)), fontWeight: FontWeight.w300,fontSize: 13),), Expanded(child: SizedBox(width: 10,)),

                                TextButton(
                                    onPressed: () {

                                      showModalBottomSheet(
                                          // expand: false,
                                          useSafeArea: true,
                                          isScrollControlled: true,
                                          context: context,

                                          backgroundColor: Colors.transparent,
                                          builder: (context) => DraggableScrollableSheet(
                                              initialChildSize: 0.5,
                                              minChildSize: 0.5,
                                              maxChildSize: 1,
                                              expand: true,
                                              builder: (context, scrollController) {
                                                return AddressListSheet(scrollController);
                                              }

                                          )




                                      );



                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: Color(int.parse(homePageDesign.body.locationWidget.locationChangeButton.color))
                                      // Colors.amber,
                                    ),
                                    child:
                                    Text(
                                      homePageDesign.body.locationWidget.locationChangeButton.data,
                                      // getTranslated(context, "changeLocation")!,
                                      style: TextStyle(
                                           fontFamily: "${lng?.header1.textFamily}",
                                          // fontFamily:"${getTranslated(context, "fontFamilyBody")!}",
                                          fontWeight: FontWeight.w300,
                                          fontSize: lng?.header3.size.toDouble() ),)
                                )
                              ],),

                          ),




                          // SizedBox(height: 50,),


                          // Padding(
                          //   padding: const EdgeInsets.only(left: 25.0, right: 25),
                          //   child: Stack(
                          //     alignment: Alignment.center,
                          //     children: [
                          //       Container(
                          //           constraints: BoxConstraints( maxWidth: 400),
                          //             // width: MediaQuery. of(context). size. width,
                          //             padding: const EdgeInsets.only(left: 18, right: 18, top: 5, bottom: 5),
                          //             decoration:const BoxDecoration(
                          //               color: Colors.amber,
                          //               borderRadius:  BorderRadius.only(
                          //                 topRight: Radius.circular(20),
                          //                 bottomLeft: Radius.circular(20),
                          //                 topLeft: Radius.circular(20),
                          //                 bottomRight: Radius.circular(20),
                          //               ),
                          //
                          //             ),
                          //             child: Center(child: Text(getTranslated(context, "ORDER NOW")!, style: TextStyle(fontFamily:(languageflag=="en")? getTranslated(context, "fontFamilyButtons")!:getTranslated(context, "fontFamilyBody")!, fontSize: 40, color: Colors.white),))
                          //
                          //         ),
                          //       Positioned.fill(
                          //
                          //           child:  Material(
                          //
                          //             color: Colors.transparent,
                          //             child:   InkWell(
                          //               borderRadius:const BorderRadius.all(Radius.circular(20)),
                          //               splashColor: Colors.black,
                          //               overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                          //               onTap: (){widget.onChanged(1);},
                          //             ),
                          //
                          //           )
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // const SizedBox(height: 10,),

                          /// - Old Version
                          // /// - Menus
                          // Padding(
                          //   padding: const EdgeInsets.all(15.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       /// - Full Menu
                          //       Stack(
                          //         children: [
                          //           Container(
                          //             width: 125,
                          //
                          //             decoration: BoxDecoration(
                          //               color: Colors.black.withOpacity(0.4),
                          //               borderRadius:const BorderRadius.only(
                          //                 topRight: Radius.circular(40),
                          //                 bottomLeft: Radius.circular(40),
                          //                 topLeft: Radius.circular(40),
                          //                 bottomRight: Radius.circular(40),
                          //               ),
                          //               // border: Border.all(
                          //               //   width: 0.5,
                          //               //   color: Colors.white,
                          //               //   style: BorderStyle.solid,
                          //               // ),
                          //             ),
                          //             child:  Image.asset("assets/images/icon_menu_0.png",),
                          //
                          //           ),
                          //            Positioned.fill(
                          //               child:  Material(
                          //                 color: Colors.transparent,
                          //                 child:   InkWell(
                          //                   borderRadius: BorderRadius.all(Radius.circular(17)),
                          //                   splashColor: Colors.black,
                          //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                          //
                          //                   onTap: (){
                          //                     PersistentNavBarNavigator.pushNewScreen(
                          //                       context,
                          //                       screen: FullMenu(),
                          //                       withNavBar: true, // OPTIONAL VALUE. True by default.
                          //                       pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          //                     );
                          //                   },
                          //                 ),
                          //
                          //               )
                          //           ),
                          //
                          //         ],
                          //       ),
                          //       const SizedBox(width: 10,),
                          //       /// - Vegetarian Menu
                          //       Stack(
                          //         children: [
                          //           Container(
                          //             width: 125,
                          //             decoration: BoxDecoration(
                          //               color: Colors.black.withOpacity(0.4),
                          //               borderRadius:const BorderRadius.only(
                          //                 topRight: Radius.circular(40),
                          //                 bottomLeft: Radius.circular(40),
                          //                 topLeft: Radius.circular(40),
                          //                 bottomRight: Radius.circular(40),
                          //               ),
                          //               // border: Border.all(
                          //               //   width: 0.5,
                          //               //   color: Colors.white,
                          //               //   style: BorderStyle.solid,
                          //               // ),
                          //             ),
                          //             child:  Image.asset("assets/images/icon_menu_1.png",),
                          //
                          //           ),
                          //           Positioned.fill(
                          //               child:  Material(
                          //                 color: Colors.transparent,
                          //                 child:   InkWell(
                          //                   borderRadius: BorderRadius.all(Radius.circular(17)),
                          //                   splashColor: Colors.black,
                          //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                          //
                          //                   onTap: (){
                          //                     PersistentNavBarNavigator.pushNewScreen(
                          //                       context,
                          //                       screen: VegetarianMenu(),
                          //                       withNavBar: true, // OPTIONAL VALUE. True by default.
                          //                       pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          //                     );
                          //                   },
                          //                 ),
                          //
                          //               )
                          //           ),
                          //         ],
                          //       ),
                          //       const SizedBox(width: 10,),
                          //       /// - Vegan Menu
                          //       Stack(
                          //         children: [
                          //           Container(
                          //             width: 125,
                          //
                          //             decoration: BoxDecoration(
                          //               color: Colors.black.withOpacity(0.4),
                          //               borderRadius: BorderRadius.only(
                          //                 topRight: Radius.circular(40),
                          //                 bottomLeft: Radius.circular(40),
                          //                 topLeft: Radius.circular(40),
                          //                 bottomRight: Radius.circular(40),
                          //               ),
                          //               // border: Border.all(
                          //               //   width: 0.5,
                          //               //   color: Colors.white,
                          //               //   style: BorderStyle.solid,
                          //               // ),
                          //             ),
                          //             child:  Image.asset("assets/images/icon_menu_2.png",),
                          //
                          //           ),
                          //           Positioned.fill(
                          //               child:  Material(
                          //                 color: Colors.transparent,
                          //                 child:   InkWell(
                          //                   borderRadius: const BorderRadius.all(Radius.circular(17)),
                          //                   splashColor: Colors.black,
                          //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                          //
                          //                   onTap: (){
                          //                     PersistentNavBarNavigator.pushNewScreen(
                          //                       context,
                          //                       screen: VeganMenu(),
                          //                       withNavBar: true, // OPTIONAL VALUE. True by default.
                          //                       pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          //                     );
                          //                   },
                          //                 ),
                          //
                          //               )
                          //           ),
                          //         ],
                          //       ),
                          //
                          //     ],
                          //   ),
                          // ),
                          //
                          // ///- Your O:F Favorites
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Transform.rotate(
                          //         angle: -math.pi / 4,
                          //         child: Image.asset("assets/images/arrow_down.png" ,height: 32,)),
                          //     const SizedBox(width: 8,),
                          //     Text("YOUR O:F FAVORITES", style: TextStyle(fontSize: 33,fontFamily: "oldpress", color: Colors.amber.shade500),),
                          //     const SizedBox(width: 30,),
                          //     Transform(
                          //         transform: Matrix4.rotationY(math.pi),
                          //         child: Transform.rotate(
                          //             angle: -math.pi / 4,
                          //             child: Image.asset("assets/images/arrow_down.png" ,height: 32,))),
                          //
                          //   ],
                          // ),
                          // /// - List
                          // SizedBox(
                          //   height: 100,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: ListView(
                          //     scrollDirection: Axis.horizontal,
                          //     children: [
                          //
                          //       Padding(
                          //         padding: const EdgeInsets.all(2.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               // width: 125,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(0),
                          //                   bottomLeft: Radius.circular(0),
                          //                   topLeft: Radius.circular(0),
                          //                   bottomRight: Radius.circular(0),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: Image.asset("assets/images/falafel.jpg")
                          //               ),
                          //             ),
                          //
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(2.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               // width: 125,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(0),
                          //                   bottomLeft: Radius.circular(0),
                          //                   topLeft: Radius.circular(0),
                          //                   bottomRight: Radius.circular(0),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: Image.asset("assets/images/falafel.jpg")
                          //               ),
                          //             ),
                          //
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(2.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               // width: 125,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(0),
                          //                   bottomLeft: Radius.circular(0),
                          //                   topLeft: Radius.circular(0),
                          //                   bottomRight: Radius.circular(0),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: Image.asset("assets/images/falafel.jpg")
                          //               ),
                          //             ),
                          //
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(2.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               // width: 125,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(0),
                          //                   bottomLeft: Radius.circular(0),
                          //                   topLeft: Radius.circular(0),
                          //                   bottomRight: Radius.circular(0),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: Image.asset("assets/images/falafel.jpg")
                          //               ),
                          //             ),
                          //
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(2.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               // width: 125,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(0),
                          //                   bottomLeft: Radius.circular(0),
                          //                   topLeft: Radius.circular(0),
                          //                   bottomRight: Radius.circular(0),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: Image.asset("assets/images/falafel.jpg")
                          //               ),
                          //             ),
                          //
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(2.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               // width: 125,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(0),
                          //                   bottomLeft: Radius.circular(0),
                          //                   topLeft: Radius.circular(0),
                          //                   bottomRight: Radius.circular(0),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: Image.asset("assets/images/falafel.jpg")
                          //               ),
                          //             ),
                          //
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(2.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               // width: 125,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(0),
                          //                   bottomLeft: Radius.circular(0),
                          //                   topLeft: Radius.circular(0),
                          //                   bottomRight: Radius.circular(0),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: Image.asset("assets/images/falafel.jpg")
                          //               ),
                          //             ),
                          //
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //
                          //
                          //
                          //
                          //
                          //
                          //
                          //     ],
                          //   ),
                          // ),
                          //
                          // const SizedBox(height: 10,),
                          // ///- Our O:F Best Seller
                          // Row( mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [//page7_right_icon
                          //     Transform.rotate(
                          //         angle: -math.pi / 2,
                          //         child: Image.asset("assets/images/page7_right_icon.png" ,height: 32,)),
                          //     const SizedBox(width: 10,),
                          //     const Text("OUR O:F BEST SELLERS", style: TextStyle(fontSize: 33,fontFamily: "oldpress", color: Colors.white),),
                          //     const SizedBox(width: 10,),
                          //     Transform.rotate(
                          //         angle: -math.pi / 8,
                          //         child: Image.asset("assets/images/page7_right_icon.png" ,height: 32,)),
                          //
                          //   ],
                          // ),
                          // /// - List
                          // SizedBox(
                          //   height:100 ,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: ListView(
                          //     scrollDirection: Axis.horizontal,
                          //     children: [
                          //       Padding(
                          //          padding: const EdgeInsets.all(4.0),
                          //          child: Stack(
                          //             alignment: Alignment.topRight,
                          //             children: [
                          //               Container(
                          //                 width: 90,
                          //                 height: 90,
                          //                 decoration: BoxDecoration(
                          //                   borderRadius: BorderRadius.only(
                          //                     topRight: Radius.circular(100),
                          //                     bottomLeft: Radius.circular(100),
                          //                     topLeft: Radius.circular(100),
                          //                     bottomRight: Radius.circular(100),
                          //
                          //                   ),
                          //                   color: Colors.grey,
                          //                   border: Border.all(
                          //                     width: 0.8,
                          //                     color: Colors.white,
                          //                     style: BorderStyle.solid,
                          //                   ),
                          //                 ),
                          //                 child: Center(
                          //                     child:
                          //                     ClipRRect(
                          //                     borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                     child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //                 ),
                          //               ),
                          //               Align(
                          //                 alignment: Alignment.topRight,
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.all(5.0),
                          //                   child: Container(
                          //                     decoration: BoxDecoration(
                          //                       borderRadius: BorderRadius.only(
                          //                         topRight: Radius.circular(50),
                          //                         bottomLeft: Radius.circular(50),
                          //                         topLeft: Radius.circular(50),
                          //                         bottomRight: Radius.circular(50),
                          //
                          //                       ),
                          //                       color: Colors.black,
                          //                       // border: Border.all(
                          //                       //   width: 0.8,
                          //                       //   color: Colors.white,
                          //                       //   style: BorderStyle.solid,
                          //                       // ),
                          //                     ),
                          //                     child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                   ),
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //        ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Stack(
                          //           alignment: Alignment.topRight,
                          //           children: [
                          //             Container(
                          //               width: 90,
                          //               height: 90,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.only(
                          //                   topRight: Radius.circular(100),
                          //                   bottomLeft: Radius.circular(100),
                          //                   topLeft: Radius.circular(100),
                          //                   bottomRight: Radius.circular(100),
                          //
                          //                 ),
                          //                 color: Colors.grey,
                          //                 border: Border.all(
                          //                   width: 0.8,
                          //                   color: Colors.white,
                          //                   style: BorderStyle.solid,
                          //                 ),
                          //               ),
                          //               child: Center(child: ClipRRect(
                          //                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                          //                   child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
                          //               ),
                          //             ),
                          //             Align(
                          //               alignment: Alignment.topRight,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(5.0),
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(50),
                          //                       bottomLeft: Radius.circular(50),
                          //                       topLeft: Radius.circular(50),
                          //                       bottomRight: Radius.circular(50),
                          //
                          //                     ),
                          //                     color: Colors.black,
                          //                     // border: Border.all(
                          //                     //   width: 0.8,
                          //                     //   color: Colors.white,
                          //                     //   style: BorderStyle.solid,
                          //                     // ),
                          //                   ),
                          //                   child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          //
                          // /// - O:F Boxes
                          // Stack (
                          //   alignment: Alignment.topCenter,
                          //   children: [
                          //     Column(
                          //       children: [
                          //         const SizedBox(height: 30,),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Padding(
                          //               padding: const EdgeInsets.all(2.0),
                          //               child: Stack(
                          //                 alignment: Alignment.topLeft,
                          //                 children: [
                          //                   Container(
                          //                     width: 200,
                          //                     decoration: BoxDecoration(
                          //                       borderRadius:const BorderRadius.only(
                          //                         topRight: Radius.circular(10),
                          //                         bottomLeft: Radius.circular(10),
                          //                         topLeft: Radius.circular(10),
                          //                         bottomRight: Radius.circular(10),
                          //
                          //                       ),
                          //                       color: Colors.grey,
                          //                       border: Border.all(
                          //                         width: 0.8,
                          //                         color: Colors.white,
                          //                         style: BorderStyle.solid,
                          //                       ),
                          //                     ),
                          //                     child: Center(
                          //                         child: ClipRRect(
                          //                             borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                          //                             child: Image.asset("assets/images/falafel.jpg"))
                          //                     ),
                          //                   ),
                          //                   Align(
                          //                     alignment: Alignment.topLeft,
                          //                     child: Padding(
                          //                       padding: const EdgeInsets.all(5.0),
                          //                       child: Container(
                          //                         decoration: const BoxDecoration(
                          //                           borderRadius: BorderRadius.only(
                          //                             topRight: Radius.circular(50),
                          //                             bottomLeft: Radius.circular(50),
                          //                             topLeft: Radius.circular(50),
                          //                             bottomRight: Radius.circular(50),
                          //
                          //                           ),
                          //                           color: Colors.black,
                          //                           // border: Border.all(
                          //                           //   width: 0.8,
                          //                           //   color: Colors.white,
                          //                           //   style: BorderStyle.solid,
                          //                           // ),
                          //                         ),
                          //                         child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                       ),
                          //                     ),
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //             const SizedBox(width: 5,),
                          //             Padding(
                          //               padding: const EdgeInsets.all(2.0),
                          //               child: Stack(
                          //                 alignment: Alignment.topRight,
                          //                 children: [
                          //                   Container(
                          //                     width: 200,
                          //                     decoration: BoxDecoration(
                          //                       borderRadius:const BorderRadius.only(
                          //                         topRight: Radius.circular(10),
                          //                         bottomLeft: Radius.circular(10),
                          //                         topLeft: Radius.circular(10),
                          //                         bottomRight: Radius.circular(10),
                          //
                          //                       ),
                          //                       color: Colors.grey,
                          //                       border: Border.all(
                          //                         width: 0.8,
                          //                         color: Colors.white,
                          //                         style: BorderStyle.solid,
                          //                       ),
                          //                     ),
                          //                     child: Center(
                          //                         child: ClipRRect(
                          //                             borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                          //                             child: Image.asset("assets/images/falafel.jpg"))
                          //                     ),
                          //                   ),
                          //                   Align(
                          //                     alignment: Alignment.topRight,
                          //                     child: Padding(
                          //                       padding: const EdgeInsets.all(5.0),
                          //                       child: Container(
                          //                         decoration: const BoxDecoration(
                          //                           borderRadius: BorderRadius.only(
                          //                             topRight: Radius.circular(50),
                          //                             bottomLeft: Radius.circular(50),
                          //                             topLeft: Radius.circular(50),
                          //                             bottomRight: Radius.circular(50),
                          //
                          //                           ),
                          //                           color: Colors.black,
                          //                           // border: Border.all(
                          //                           //   width: 0.8,
                          //                           //   color: Colors.white,
                          //                           //   style: BorderStyle.solid,
                          //                           // ),
                          //                         ),
                          //                         child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                          //                       ),
                          //                     ),
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     Positioned(
                          //
                          //         child: Image.asset("assets/images/page6_boxes.png", height: 60,))
                          //   ],
                          // ),
                          /// - Old Version

                        ],
                      ),
                    ),

                    /// - Order Now Button
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 450, ),
                        child:  ElevatedButton(
                            onPressed: (){widget.onChanged(1);},
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(45)),
                              // maximumSize: MaterialStateProperty.all<Size>(Size.fromWidth(400)),
                              // backgroundColor:  MaterialStateProperty.all<Color>(Colors.amber),
                              backgroundColor:  MaterialStateProperty.all<Color>(Color(int.parse(homePageDesign.body.orderNowButtonWidget.backGroundColor))),
                              // foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side:const BorderSide(color: Colors.transparent,width: 1.5)
                                  )
                              ),
                              overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                            ),
                            child:
                            // Text(OrderNowButton,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons")!,color: Colors.white, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),)
                            Text(
                              homePageDesign.body.orderNowButtonWidget.data,
                              // getTranslated(context, "ORDER NOW")!,
                              style: TextStyle(
                                fontFamily: lng?.titleHeader1.textFamily,
                                  // fontFamily: getTranslated(context, "fontFamilyButtons")!,
                                  color: Color(int.parse(homePageDesign.body.orderNowButtonWidget.color)),
                                  fontSize: lng?.titleHeader1.size.toDouble(),
                                  // double.parse(getTranslated(context, "fontFamilyButtonsSize")!)
                              ),)

                        ),

                      ),
                    ),
                    /// - Dashboard
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        constraints: const BoxConstraints( maxWidth: 450),
                        padding: const EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
                        decoration:const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),

                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: RichText(

                                text:  TextSpan(
                                    text: headerTitleParts[0],
                                    // text: getTranslated(context, "dashBoardTitle-youHave")!,
                                    style: TextStyle(
                                      color: Color(int.parse(homePageDesign.body.dashboardWidget.headerTitle.text.color)),
                                      fontSize: lng?.header3.size.toDouble(),
                                      // fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      fontFamily:lng?.header3.textFamily,
                                      // fontFamily:getTranslated(context, "fontFamilyBody")!,
                                    ),
                                    children: [
                                  TextSpan(
                                    text: getTranslated(context, "dashBoardTitle-credit")!,
                                    style: TextStyle(color: 
                                    Color(int.parse(homePageDesign.body.dashboardWidget.headerTitle.creditText.color))
                                    // Colors.amber
                                    ),
                                    recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                                  ),
                                  TextSpan(
                                    text: '${headerTitleParts[1]} 00/00/0000',
                                    // text: '${getTranslated(context, "dashBoardTitle-valid")!} 00/00/0000',
                                    style: TextStyle(color:  Color(int.parse(homePageDesign.body.dashboardWidget.headerTitle.text.color)),),
                                    recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                                  )
                                ]),
                              ),
                            ),
                            const Divider(color: Colors.amber,thickness: 1,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /// - My Code
                                  Visibility(
                                    visible: homePageDesign.body.dashboardWidget.buttons.myCode.visibility=='true',
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            // ImageIcon(
                                            //   NetworkImage("${homePageDesign?.body.dashboardWidget.buttons.myCode.imageIcon}",),
                                            //   size: (widget.layOut=="Mobile")? double.parse(homePageDesign?.body.dashboardWidget.buttons.myCode.mobileSize as String):double.parse(homePageDesign?.body.dashboardWidget.buttons.myCode.tabletSize as String),
                                            //
                                            // ),


                                            Image.network("${homePageDesign?.body.dashboardWidget.buttons.myCode.imageIcon}",height:double.parse(homePageDesign?.body.dashboardWidget.buttons.myCode.mobileSize as String) ),
                                            const SizedBox(height: 5,),
                                            Text(
                                              homePageDesign.body.dashboardWidget.buttons.myCode.data,
                                              // getTranslated(context, "dashBoardTitle-myCode")!,
                                              style: TextStyle(
                                                  color:  Color(int.parse(homePageDesign.body.dashboardWidget.buttons.myCode.color)),
                                                  fontSize: lng?.header3.size.toDouble(),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily:lng?.header3.textFamily),
                                              // fontFamily:getTranslated(context, "fontFamilyBody")!,),
                                              textAlign:TextAlign.center,
                                            )
                                            // Image.asset("assets/images/my_rewards_gencode.png", height: 35,width: 35,),

                                          ],
                                        ),
                                        Positioned.fill(
                                            child:  Material(
                                              color: Colors.transparent,
                                              child:   InkWell(
                                                borderRadius: BorderRadius.all(Radius.circular(0)),
                                                splashColor: Colors.black,
                                                overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                                onTap: (){

                                                },
                                              ),

                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  /// - My rewards
                                  Visibility(
                                    visible: homePageDesign.body.dashboardWidget.buttons.myRewards.visibility=='true',
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            Image.network("${homePageDesign?.body.dashboardWidget.buttons.myRewards.imageIcon}",height:double.parse(homePageDesign?.body.dashboardWidget.buttons.myCode.mobileSize as String) ),
                                            const SizedBox(height: 5,),
                                            Text(
                                              homePageDesign.body.dashboardWidget.buttons.myRewards.data,
                                              // getTranslated(context, "dashBoardTitle-myCode")!,
                                              style: TextStyle(
                                                  color:  Color(int.parse(homePageDesign.body.dashboardWidget.buttons.myRewards.color)),
                                                  fontSize: lng?.header3.size.toDouble(),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily:lng?.header3.textFamily),
                                              // fontFamily:getTranslated(context, "fontFamilyBody")!,),
                                              textAlign:TextAlign.center,
                                            )

                                            // Image.asset("assets/images/gift.png", height: 35,width: 35,),
                                            // const SizedBox(height: 5,),
                                            // // Icon(Icons.qr_code_2, color: Colors.amber,size: 35,),
                                            // Text(getTranslated(context, "dashBoardTitle-myRewards")!, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300,fontFamily:getTranslated(context, "fontFamilyBody")!,),textAlign:TextAlign.center,)
                                          ],
                                        ),
                                        Positioned.fill(
                                            child:  Material(
                                              color: Colors.transparent,
                                              child:   InkWell(
                                                borderRadius: BorderRadius.all(Radius.circular(0)),
                                                splashColor: Colors.black,
                                                overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                                onTap: (){
                                                  PersistentNavBarNavigator.pushNewScreen(
                                                    context,
                                                    screen: MyRewards(layOut: widget.layOut),
                                                    withNavBar: true, // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                                  );
                                                },
                                              ),

                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  /// - refer to friend
                                  Visibility(
                                    visible: homePageDesign.body.dashboardWidget.buttons.referFriend.visibility=='true',
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            Image.network("${homePageDesign?.body.dashboardWidget.buttons.referFriend.imageIcon}",height:double.parse(homePageDesign?.body.dashboardWidget.buttons.myCode.mobileSize as String) ),
                                            const SizedBox(height: 5,),
                                            Text(
                                              homePageDesign.body.dashboardWidget.buttons.referFriend.data,
                                              // getTranslated(context, "dashBoardTitle-myCode")!,
                                              style: TextStyle(
                                                  color:  Color(int.parse(homePageDesign.body.dashboardWidget.buttons.referFriend.color)),
                                                  fontSize: lng?.header3.size.toDouble(),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily:lng?.header3.textFamily),
                                              // fontFamily:getTranslated(context, "fontFamilyBody")!,),
                                              textAlign:TextAlign.center,
                                            )

                                            // Icon(Icons.supervised_user_circle_sharp, color: Colors.amber,size: 35,),
                                            // const SizedBox(height: 5,),
                                            // // Icon(Icons.qr_code_2, color: Colors.amber,size: 35,),
                                            // Text(getTranslated(context, "dashBoardTitle-referToFriend")!, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300,fontFamily:getTranslated(context, "fontFamilyBody")!,),textAlign:TextAlign.center,)

                                          ],
                                        ),
                                        Positioned.fill(
                                            child: new Material(
                                              color: Colors.transparent,
                                              child:  new InkWell(
                                                borderRadius: BorderRadius.all(Radius.circular(0)),
                                                splashColor: Colors.black,
                                                overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                                onTap: (){
                                                  final RenderBox renderBox = context.findRenderObject() as RenderBox;
                                                  Share.share(
                                                    "You have been invited by Abdullh to join the O:F Family! Click below to install our app. Onelink.to/dhdbm3. Once you join, you will receive a 25% discount on your first order & 5Dhs credit when you use code 248921 in your registration page"
                                                    ,subject: "check out The website"
                                                    ,sharePositionOrigin: renderBox.localToGlobal(Offset.zero)&renderBox.size,
                                                  );

                                                },
                                              ),

                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  /// - Transfer credit
                                  Visibility(
                                    visible: homePageDesign.body.dashboardWidget.buttons.transferCredit.visibility=='true',
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.network("${homePageDesign?.body.dashboardWidget.buttons.transferCredit.imageIcon}",height:double.parse(homePageDesign?.body.dashboardWidget.buttons.myCode.mobileSize as String) ),
                                            const SizedBox(height: 5,),
                                            Text(
                                              homePageDesign.body.dashboardWidget.buttons.transferCredit.data,
                                              // getTranslated(context, "dashBoardTitle-myCode")!,
                                              style: TextStyle(
                                                  color:  Color(int.parse(homePageDesign.body.dashboardWidget.buttons.transferCredit.color)),
                                                  fontSize: lng?.header3.size.toDouble(),
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily:lng?.header3.textFamily),
                                              // fontFamily:getTranslated(context, "fontFamilyBody")!,),
                                              textAlign:TextAlign.center,
                                            )

                                            // const Icon(Icons.monetization_on_outlined, color: Colors.amber,size: 35,),
                                            // const SizedBox(height: 5,),
                                            // Text(getTranslated(context, "dashBoardTitle-transferCredit")!, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300,fontFamily:getTranslated(context, "fontFamilyBody")!,),textAlign:TextAlign.center,)
                                          ],
                                        ),
                                        Positioned.fill(
                                            child: new Material(
                                              color: Colors.transparent,
                                              child:  new InkWell(
                                                borderRadius: BorderRadius.all(Radius.circular(0)),
                                                splashColor: Colors.black,
                                                overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                                onTap: (){
                                                  PersistentNavBarNavigator.pushNewScreen(
                                                    context,
                                                    screen: TransferCredit(),
                                                    withNavBar: true, // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                                  );
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


                  ],
                ),
                drawer: DrawerWidget(layOut: widget.layOut,onChanged: (value) {widget.onChanged(value);},),


              ),
              Visibility(
                visible: false,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: MediaQuery. of(context). size. height,
                        width: MediaQuery. of(context). size. width,
                        child: Image.asset("assets/images/icon_bike.png"))),
              )

            ],
          )
          :LoadingPage();

        });


  }

  @override
  void initState() {
    super.initState();

    Provider.of<AuthProvider>(context, listen: false).getSavedUserDetailsLocally().then((loggedInUser) {
      if(loggedInUser !=null){

        String email =  Provider.of<AuthProvider>(context, listen: false).email!;
        String password =  Provider.of<AuthProvider>(context, listen: false).password!;
        Provider.of<ProfileProvider>(context,listen: false).getUserInfo(loggedInUser.token!, email, password);

        Provider.of<ProfileProvider>(context,listen: false).getUserSavedAddress(loggedInUser.token!);
      }
      else{
        print("no users found!");
      }
    });

  }
}
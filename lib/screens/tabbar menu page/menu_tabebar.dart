import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/item%20details%20page/item_details_sheet.dart';
import 'package:operation_falafel/screens/my%20rewards%20page/my_rewards.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/widgets/custom_list_tile.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:operation_falafel/widgets/loading_page.dart';
import 'package:operation_falafel/widgets/radio_option.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

import '../../models/AppThemeModels/DesignPerPage/MenuPage/menu_page.dart';
import '../../models/AppThemeModels/FontSizes/Language/lang.dart';
import '../../providers/AppTheme/theme_provider.dart';


class TabeBarMenu extends StatefulWidget{
  final ValueChanged onChanged;
  final String layOut ;
  static const routeName = '/Menu';
  const TabeBarMenu(this.onChanged,{super.key,required this.layOut});
  @override
  State<TabeBarMenu> createState() => _TabeBarMenuState();
}

class _TabeBarMenuState extends State<TabeBarMenu> with SingleTickerProviderStateMixin{

  late TabController _cardController;
  @override
  void initState() {
    _cardController = new TabController(vsync: this, length: 12);
  }

  String? _foodType;
  ValueChanged<String?> _valueChangedHandler() {

    return (value){
      setState(() {
        if(_foodType == value){
          _foodType =null;
        }else{
          _foodType = value!;
        }

    });

    };
  }
  double _opacityValue = 0.50;


  void getselectedlanguge (){
    print(Localizations.localeOf(context).languageCode);
  }


  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return
      Consumer<ThemeProvider>(
        builder: (context, appTheme, child)
    {
      Language? lng = (Localizations
          .localeOf(context)
          .languageCode == 'ar') ? appTheme.appTheme.fontSizes?.ar : appTheme
          .appTheme.fontSizes?.en;
      MenuPage? menuPage = appTheme.appTheme.designPerPage?.menuPage;
      bool loadingDesign = menuPage != null;

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
            key: _drawerKey,
            backgroundColor: Colors.transparent,
            body: DefaultTabController(
                length: 1,
                child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context,
                      bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(


                        title: MyText(
                          getTranslated(context, "operationFalafelLogo")!,
                          style: TextStyle(
                            fontFamily:lng?.logoTitle.textFamily,
                            fontWeight: FontWeight.bold,
                          ),),
                        backgroundColor: Colors.amber,
                        pinned: true,
                        centerTitle: true,
                        expandedHeight: (widget.layOut == "Mobile")
                            ? 210.0
                            : 310,
                        elevation: 0,

                        flexibleSpace: FlexibleSpaceBar(

                          collapseMode: CollapseMode.parallax,
                          expandedTitleScale: 1.3,
                          // titlePadding: EdgeInsets.only(bottom: 20, left: 50),
                          background: Image.asset(
                            'assets/images/items_top.png',
                            fit: BoxFit.fill,
                          ),
                          centerTitle: true,
                        ),
                        leading: Visibility(
                          visible: (widget.layOut == "Mobile") ? true : false,
                          child: IconButton(
                            onPressed: (){

                              _drawerKey.currentState?.openDrawer();
                            },
                            icon:  ImageIcon(
                              NetworkImage("${menuPage?.appBar.drawerIcon.imageIcon}",),
                              size:
                              double.parse(menuPage?.appBar.drawerIcon.mobileSize as String),
                            ),
                          ),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 15, bottom: 10, left: 15),
                            child: Stack(
                              children: [
                                Container(

                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                    ),
                                    border: Border.all(
                                      width: 0.5,
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: const Icon(Icons.search),

                                  // Image.asset("assets/images/icon_search.png",height: 30,width: 35,),

                                ),

                                Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        splashColor: Colors.black,
                                        overlayColor: MaterialStateProperty.all<
                                            Color>(Colors.black54),

                                        onTap: () {
                                          // Navigator.pushNamed(context, "/ResetYourPassword");
                                          print("text");
                                        },
                                      ),

                                    )
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      SliverAppBar(
                        toolbarHeight: 40,
                        backgroundColor: Colors.amber,
                        pinned: true,
                        primary: false,
                        // backwardsCompatibility: false,
                        automaticallyImplyLeading: false,
                        // expandedHeight: 230.0,
                        title: Align(
                          alignment: AlignmentDirectional.center,
                          child: TabBar(

                            labelColor: Colors.black,
                            indicatorColor: Colors.transparent,
                            unselectedLabelColor: Colors.grey.shade300,
                            onTap:  (value){ print(value);},
                            controller: _cardController,
                            isScrollable: true,
                            tabs: const[
                              Tab(child: MyText("NEW AT O:F",
                                style: TextStyle(fontSize: 15),),),
                              Tab(child: MyText("FALAFEL & CO",
                                  style: TextStyle(fontSize: 15)),),
                              Tab(child: MyText("MANAEESH & WRAPS",
                                  style: TextStyle(fontSize: 15)),),

                              Tab(child: MyText("SANDWICHES",
                                  style: TextStyle(fontSize: 15)),),
                              Tab(child: MyText("O:F BOXES",
                                  style: TextStyle(fontSize: 15)),),
                              Tab(child: MyText("SOUP & SALADS",
                                  style: TextStyle(fontSize: 15)),),

                              Tab(child: MyText(
                                  "PLATTERS", style: TextStyle(fontSize: 15)),),
                              Tab(child: MyText(
                                  "O:F KIDS", style: TextStyle(fontSize: 15)),),
                              Tab(child: MyText(
                                  "XL MEZZA", style: TextStyle(fontSize: 15)),),

                              Tab(child: MyText(
                                  "DESSERTS", style: TextStyle(fontSize: 15)),),
                              Tab(child: MyText(
                                  "DRINKS", style: TextStyle(fontSize: 15)),),
                              Tab(child: MyText(
                                  "SAUCES", style: TextStyle(fontSize: 15)),),


                            ],
                          ),
                        ),


                      ),
                    ];
                  },
                  body: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Column(
                      children: [

                        /// - Vegetarain & Vegan Radio Button
                        Row(
                          children: [
                            RadioOption<String>(
                              value: '1',
                              groupValue: _foodType,
                              onChanged: _valueChangedHandler(),
                              label: '1',
                              text: 'Vegetarian',
                            ),
                            RadioOption<String>(
                              value: '2',
                              groupValue: _foodType,
                              onChanged: _valueChangedHandler(),
                              label: '2',
                              text: 'Vegan',
                            ),
                          ],
                        ),

                        const Divider(color: Colors.white,),

                        Expanded(
                          child: TabBarView(

                              controller: _cardController,
                              children: [

                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // showMaterialModalBottomSheet(
                                        //     expand: false,
                                        //     context: context,
                                        //     backgroundColor: Colors.transparent,
                                        //     builder: (context) =>
                                        //         DraggableScrollableSheet(
                                        //             initialChildSize: 0.8,
                                        //             minChildSize: 0.6,
                                        //             maxChildSize: 1,
                                        //             expand: true,
                                        //             builder: (context, scrollController) {
                                        //               return ItemDetailsSheet(scrollController);
                                        //             }
                                        //
                                        //         )
                                        //
                                        // );

                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),






                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          // enableDrag: true,
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            // expand: false,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),

                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),

                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DraggableScrollableSheet(
                                                    initialChildSize: 0.6,
                                                    minChildSize: 0.6,
                                                    maxChildSize: 1,
                                                    expand: true,
                                                    builder: (context,
                                                        scrollController) {
                                                      return ItemDetailsSheet(
                                                          layOut: widget.layOut,
                                                          scrollController);
                                                    }

                                                )

                                        );
                                      },
                                      child: CustomListTile(
                                        layOut: widget.layOut,),
                                    ),

                                  ],
                                ),


                              ]
                          ),
                        ),


                      ],
                    ),
                  ),
                )
            ),




            drawer: DrawerWidget(layOut: widget.layOut, onChanged: (value) {
              widget.onChanged(value);
            },),
          ),
        ],
      )
      :const LoadingPage();
    });
  }


}






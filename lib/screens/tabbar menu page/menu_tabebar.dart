import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/screens/item%20details%20page/item_details_sheet.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/widgets/custom_list_tile.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:operation_falafel/widgets/radio_option.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TabeBarMenu extends StatefulWidget{
  @override
  State<TabeBarMenu> createState() => _TabeBarMenuState();
}

class _TabeBarMenuState extends State<TabeBarMenu> with SingleTickerProviderStateMixin{

  late TabController _cardController;
  @override
  void initState() {
    _cardController = new TabController(vsync: this, length: 1);
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


   return Stack(
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
          body: DefaultTabController(
           length: 1,
           child:NestedScrollView(
               headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled){
                 return <Widget>[
                   SliverAppBar(
                     backgroundColor: Colors.orangeAccent,
                     pinned: true,
                     expandedHeight: 210.0,
                     elevation: 0,
                     flexibleSpace: FlexibleSpaceBar(

                       // titlePadding: EdgeInsets.only(bottom: 20, left: 50),
                       // title: Text('Main Menu', textScaleFactor: 1),

                       background: Image.asset(
                         'assets/images/items_top.png',
                         fit: BoxFit.fill,
                       ),

                     ),
                     leading:IconButton(
                       onPressed: (){
                         _drawerKey.currentState?.openDrawer();
                       },
                       icon: const ImageIcon(
                         AssetImage("assets/images/icon_menu.png",),
                         size: 35,
                       ),
                     ) ,
                     actions: [Padding(
                         padding: const EdgeInsets.only(top: 10.0, right: 15, bottom: 10, left:15),
                         child: Stack(
                           children: [
                             Container(

                               width: 35,
                               height: 35,
                               decoration: BoxDecoration(
                                 color: Colors.black.withOpacity(0.4),
                                 borderRadius:const BorderRadius.only(
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
                               child:const Icon(Icons.search),

                               // Image.asset("assets/images/icon_search.png",height: 30,width: 35,),

                             ),

                              Positioned.fill(
                                 child:  Material(
                                   color: Colors.transparent,
                                   child:   InkWell(
                                     borderRadius: const BorderRadius.all(Radius.circular(50)),
                                     splashColor: Colors.black,
                                     overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                     onTap: (){
                                       print("text");
                                     },
                                   ),

                                 )
                             ),

                           ],
                         ),
                       ),],
                   ),
                   SliverAppBar(
                     toolbarHeight: 40,
                     backgroundColor: Colors.orangeAccent,
                     pinned: true,
                     primary: false,
                     backwardsCompatibility: false,
                     automaticallyImplyLeading: false,
                     // expandedHeight: 230.0,
                     title: Align(
                       alignment: AlignmentDirectional.center,
                       child:TabBar(

                         labelColor: Colors.black,
                         indicatorColor: Colors.transparent,
                         unselectedLabelColor: Colors.grey.shade300,

                         controller: _cardController,
                         isScrollable: true,
                         tabs: const[
                           Tab(child: Text("NEW AT O:F", style: TextStyle(fontSize: 15),),),
                           // Tab(child: Text("FALAFEL & CO", style: TextStyle(fontSize: 15)),),
                           // Tab(child: Text("MANAEESH & WRAPS", style: TextStyle(fontSize: 15)),),
                           //
                           // Tab(child: Text("SANDWICHES", style: TextStyle(fontSize: 15)),),
                           // Tab(child: Text("O:F BOXES", style: TextStyle(fontSize: 15)),),
                           // Tab(child: Text("SOUP & SALADS", style: TextStyle(fontSize: 15)),),
                           //
                           // Tab(child: Text("PLATTERS", style: TextStyle(fontSize: 15)),),
                           // Tab(child: Text("O:F KIDS", style: TextStyle(fontSize: 15)),),
                           // Tab(child: Text("XL MEZZA", style: TextStyle(fontSize: 15)),),
                           //
                           // Tab(child: Text("DESSERTS", style: TextStyle(fontSize: 15)),),
                           // Tab(child: Text("DRINKS", style: TextStyle(fontSize: 15)),),
                           // Tab(child: Text("SAUCES", style: TextStyle(fontSize: 15)),),
                          

                         ],
                       ),
                     ),


                   ),
                 ];
               },
               body: Padding(
                 padding: const EdgeInsets.only(left:8.0, right:8),
                 child: Column(
                   children: [

                     /// - Vegetarain & Vegan Radio Button
                     Row(
                       children: [
                         RadioOption<String>(
                           value: '1',
                           groupValue: _foodType,
                           onChanged:_valueChangedHandler(),
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
                               shrinkWrap:true,
                               padding:const EdgeInsets.only(top: 10,bottom: 20),
                               physics: const NeverScrollableScrollPhysics(),
                               children: [
                                 GestureDetector(
                                   onTap: (){
                                     showMaterialModalBottomSheet(
                                         expand: false,
                                         context: context,
                                         backgroundColor: Colors.transparent,
                                         builder: (context) =>
                                             DraggableScrollableSheet(
                                                 initialChildSize: 0.6,
                                                 minChildSize: 0.6,
                                                 maxChildSize: 1,
                                                 expand: true,
                                                 builder: (context, scrollController) {
                                                   return ItemDetailsSheet(scrollController);
                                                 }

                                             )

                                     );

                                   },
                                   child: CustomListTile(),
                                 ),

                               ],
                             ),
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //
                             //   ],
                             // ),
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //   ],
                             // ),
                             //
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //
                             //   ],
                             // ),
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //
                             //   ],
                             // ),
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //   ],
                             // ),
                             //
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //   ],
                             // ),
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //
                             //   ],
                             // ),
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //
                             //   ],
                             // ),
                             //
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //
                             //   ],
                             // ),
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //           Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //
                             //   ],
                             // ),
                             // ListView(
                             //   shrinkWrap:true,
                             //   padding:EdgeInsets.only(top: 10,bottom: 20),
                             //   physics: NeverScrollableScrollPhysics(),
                             //   children: [
                             //
                             //     Padding(
                             //       padding: const EdgeInsets.only(bottom: 8.0),
                             //       child: Stack(
                             //         children: [
                             //           Row(
                             //             crossAxisAlignment: CrossAxisAlignment.start,
                             //             children: <Widget>[
                             //               Container(
                             //                 width: 100,
                             //                 height: 100,
                             //
                             //                 decoration: BoxDecoration(
                             //                   borderRadius: BorderRadius.only(
                             //                     topRight: Radius.circular(0),
                             //                     bottomLeft: Radius.circular(0),
                             //                     topLeft: Radius.circular(0),
                             //                     bottomRight: Radius.circular(0),
                             //
                             //                   ),
                             //                   color: Colors.grey,
                             //                   border: Border.all(
                             //                     width: 0.8,
                             //                     color: Colors.white,
                             //                     style: BorderStyle.solid,
                             //                   ),
                             //                 ),
                             //                 child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 4,
                             //                 child: Container(
                             //                   padding: EdgeInsets.only(left: 5),
                             //                   child: Column(
                             //                     crossAxisAlignment: CrossAxisAlignment.start,
                             //                     children: <Widget>[
                             //                       Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                             //                       Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                             //                       // SizedBox(height: 20,),
                             //                       Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                             //                     ],
                             //                   ),
                             //                 ),
                             //               ),
                             //               Expanded(
                             //                 flex: 0,
                             //                 child: Column(
                             //                   mainAxisAlignment: MainAxisAlignment.center,
                             //                   children: [
                             //                     Padding(
                             //                       padding: const EdgeInsets.all(8.0),
                             //                       child: Container(
                             //                         height: 20,
                             //                         width: 20,
                             //                         decoration: BoxDecoration(
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
                             //                   ],
                             //                 ),
                             //               )
                             //
                             //             ],
                             //           ),
                             //            Positioned.fill(
                             //               child:  Material(
                             //                 color: Colors.transparent,
                             //                 child:   InkWell(
                             //                   borderRadius: BorderRadius.all(Radius.circular(0)),
                             //                   splashColor: Colors.black,
                             //                   overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                             //
                             //                   onTap: (){
                             //                     print("text");
                             //                   },
                             //                 ),
                             //
                             //               )
                             //           ),
                             //         ],
                             //       ),
                             //     ),
                             //
                             //
                             //
                             //
                             //   ],
                             // ),
                               

                           ]
                       ),
                     ),



                   ],
                 ),
               ),
           )
         ),
        drawer:  DrawerWidget(),
       ),
     ],
   );
  }
}






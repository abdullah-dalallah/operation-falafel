import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:operation_falafel/screens/cart%20page/cart_screen.dart';
import 'package:getwidget/getwidget.dart';
import 'package:operation_falafel/widgets/radio_option.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class TabeBar extends StatefulWidget{
  @override
  State<TabeBar> createState() => _TabeBarState();
}

class _TabeBarState extends State<TabeBar> with SingleTickerProviderStateMixin{

  late TabController _cardController;

  @override
  void initState() {
    _cardController = new TabController(vsync: this, length: 10);
  }

  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {

    return (value) => setState(() {

      _groupValue = value!;
    });
  }


  @override
  Widget build(BuildContext context) {
    void _changeLanguage (String languageCode) async {
      Locale _temp =await setLocale(languageCode);

      MyApp.setLocale(context,_temp);
    }

   return Stack(
     children: [
       Image.asset(
         "assets/images/background.png",
         height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         fit: BoxFit.cover,
       ),
       Scaffold(
          backgroundColor: Colors.transparent,
         body: DefaultTabController(
           length: 10,
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
                     leading: IconButton(
                       onPressed: (){
                         Navigator.pop(context);
                       },
                       icon: const ImageIcon(
                         AssetImage("assets/images/back_new.png",),
                         size: 35,
                       ),
                     ) ,
                     actions: [

                       Padding(
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

                             new Positioned.fill(
                                 child: new Material(
                                   color: Colors.transparent,
                                   child:  new InkWell(
                                     borderRadius: BorderRadius.all(Radius.circular(50)),
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
                       ),

                       // Padding(
                       //   padding: const EdgeInsets.only(top: 13.0, right: 15, bottom: 15, left:15),
                       //   child: Stack(
                       //     children: [
                       //       Container(
                       //
                       //         width: 35,
                       //         height: 27,
                       //         decoration: BoxDecoration(
                       //           color: Colors.black.withOpacity(0.4),
                       //           borderRadius:const BorderRadius.only(
                       //             topRight: Radius.circular(40),
                       //             bottomLeft: Radius.circular(40),
                       //             topLeft: Radius.circular(40),
                       //             bottomRight: Radius.circular(40),
                       //           ),
                       //           border: Border.all(
                       //             width: 0.5,
                       //             color: Colors.white,
                       //             style: BorderStyle.solid,
                       //           ),
                       //         ),
                       //         child: Image.asset("assets/images/icon_search.png",height: 30,width: 35,),
                       //
                       //       ),
                       //
                       //       new Positioned.fill(
                       //           child: new Material(
                       //             color: Colors.transparent,
                       //             child:  new InkWell(
                       //               borderRadius: BorderRadius.all(Radius.circular(20)),
                       //               splashColor: Colors.black,
                       //               overlayColor: MaterialStateProperty.all<Color>(Colors.black54),
                       //
                       //               onTap: (){
                       //                 print("text");
                       //               },
                       //             ),
                       //
                       //           )
                       //       ),
                       //
                       //     ],
                       //   ),
                       // ),
                     ],

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

                         labelColor: Colors.white,
                         indicatorColor: Colors.transparent,
                         unselectedLabelColor: Colors.grey.shade300,

                         controller: _cardController,
                         isScrollable: true,
                         tabs: [
                           Tab(child: Text("tabe1"),),
                           Tab(child: Text("tabe2"),),
                           Tab(child: Text("tabe3"),),
                           Tab(child: Text("tabe1"),),
                           Tab(child: Text("tabe2"),),
                           Tab(child: Text("tabe3"),),
                           Tab(child: Text("tabe1"),),
                           Tab(child: Text("tabe2"),),
                           Tab(child: Text("tabe3"),),
                           Tab(child: Text("tabe1"),),

                         ],
                       ),
                     ),


                   ),
                 ];
               },
               body: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [


                     Row(
                       children: [
                         RadioOption<String>(
                           value: '1',
                           groupValue: _groupValue,
                           onChanged:_valueChangedHandler(),
                           label: '1',
                           text: 'Vegetarian',
                         ),
                         RadioOption<String>(
                           value: '2',
                           groupValue: _groupValue,
                           onChanged: _valueChangedHandler(),
                           label: '2',
                           text: 'Vegan',
                         ),
                       ],
                     ),





                     Divider(color: Colors.white,),

                     Expanded(
                       child: TabBarView(

                           controller: _cardController,
                           children: [

                             ListView(
                               shrinkWrap:true,
                               padding:EdgeInsets.only(top: 10,bottom: 20),
                               physics: NeverScrollableScrollPhysics(),
                               children: [

                                 Padding(
                                   padding: const EdgeInsets.only(bottom: 8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Container(
                                         width: 100,
                                         height: 100,

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(0),
                                             bottomLeft: Radius.circular(0),
                                             topLeft: Radius.circular(0),
                                             bottomRight: Radius.circular(0),

                                           ),
                                           color: Colors.grey,
                                           border: Border.all(
                                             width: 0.8,
                                             color: Colors.white,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                                         ),
                                       ),
                                       Expanded(
                                         flex: 4,
                                         child: Container(
                                           padding: EdgeInsets.only(left: 5),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                                               Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                                               // SizedBox(height: 20,),
                                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                                             ],
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 0,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 20,
                                                 width: 20,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topRight: Radius.circular(50),
                                                     bottomLeft: Radius.circular(50),
                                                     topLeft: Radius.circular(50),
                                                     bottomRight: Radius.circular(50),

                                                   ),
                                                   color: Colors.black,
                                                   // border: Border.all(
                                                   //   width: 0.8,
                                                   //   color: Colors.white,
                                                   //   style: BorderStyle.solid,
                                                   // ),
                                                 ),
                                                 child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )

                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(bottom: 8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Container(
                                         width: 100,
                                         height: 100,

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(0),
                                             bottomLeft: Radius.circular(0),
                                             topLeft: Radius.circular(0),
                                             bottomRight: Radius.circular(0),

                                           ),
                                           color: Colors.grey,
                                           border: Border.all(
                                             width: 0.8,
                                             color: Colors.white,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                                         ),
                                       ),
                                       Expanded(
                                         flex: 4,
                                         child: Container(
                                           padding: EdgeInsets.only(left: 5),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                                               Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                                               // SizedBox(height: 20,),
                                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                                             ],
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 0,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 20,
                                                 width: 20,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topRight: Radius.circular(50),
                                                     bottomLeft: Radius.circular(50),
                                                     topLeft: Radius.circular(50),
                                                     bottomRight: Radius.circular(50),

                                                   ),
                                                   color: Colors.black,
                                                   // border: Border.all(
                                                   //   width: 0.8,
                                                   //   color: Colors.white,
                                                   //   style: BorderStyle.solid,
                                                   // ),
                                                 ),
                                                 child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )

                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(bottom: 8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Container(
                                         width: 100,
                                         height: 100,

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(0),
                                             bottomLeft: Radius.circular(0),
                                             topLeft: Radius.circular(0),
                                             bottomRight: Radius.circular(0),

                                           ),
                                           color: Colors.grey,
                                           border: Border.all(
                                             width: 0.8,
                                             color: Colors.white,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                                         ),
                                       ),
                                       Expanded(
                                         flex: 4,
                                         child: Container(
                                           padding: EdgeInsets.only(left: 5),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                                               Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                                               // SizedBox(height: 20,),
                                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                                             ],
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 0,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 20,
                                                 width: 20,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topRight: Radius.circular(50),
                                                     bottomLeft: Radius.circular(50),
                                                     topLeft: Radius.circular(50),
                                                     bottomRight: Radius.circular(50),

                                                   ),
                                                   color: Colors.black,
                                                   // border: Border.all(
                                                   //   width: 0.8,
                                                   //   color: Colors.white,
                                                   //   style: BorderStyle.solid,
                                                   // ),
                                                 ),
                                                 child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )

                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(bottom: 8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Container(
                                         width: 100,
                                         height: 100,

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(0),
                                             bottomLeft: Radius.circular(0),
                                             topLeft: Radius.circular(0),
                                             bottomRight: Radius.circular(0),

                                           ),
                                           color: Colors.grey,
                                           border: Border.all(
                                             width: 0.8,
                                             color: Colors.white,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                                         ),
                                       ),
                                       Expanded(
                                         flex: 4,
                                         child: Container(
                                           padding: EdgeInsets.only(left: 5),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                                               Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                                               // SizedBox(height: 20,),
                                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                                             ],
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 0,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 20,
                                                 width: 20,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topRight: Radius.circular(50),
                                                     bottomLeft: Radius.circular(50),
                                                     topLeft: Radius.circular(50),
                                                     bottomRight: Radius.circular(50),

                                                   ),
                                                   color: Colors.black,
                                                   // border: Border.all(
                                                   //   width: 0.8,
                                                   //   color: Colors.white,
                                                   //   style: BorderStyle.solid,
                                                   // ),
                                                 ),
                                                 child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )

                                     ],
                                   ),
                                 ),Padding(
                                   padding: const EdgeInsets.only(bottom: 8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Container(
                                         width: 100,
                                         height: 100,

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(0),
                                             bottomLeft: Radius.circular(0),
                                             topLeft: Radius.circular(0),
                                             bottomRight: Radius.circular(0),

                                           ),
                                           color: Colors.grey,
                                           border: Border.all(
                                             width: 0.8,
                                             color: Colors.white,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                                         ),
                                       ),
                                       Expanded(
                                         flex: 4,
                                         child: Container(
                                           padding: EdgeInsets.only(left: 5),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                                               Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                                               // SizedBox(height: 20,),
                                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                                             ],
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 0,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 20,
                                                 width: 20,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topRight: Radius.circular(50),
                                                     bottomLeft: Radius.circular(50),
                                                     topLeft: Radius.circular(50),
                                                     bottomRight: Radius.circular(50),

                                                   ),
                                                   color: Colors.black,
                                                   // border: Border.all(
                                                   //   width: 0.8,
                                                   //   color: Colors.white,
                                                   //   style: BorderStyle.solid,
                                                   // ),
                                                 ),
                                                 child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )

                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(bottom: 8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Container(
                                         width: 100,
                                         height: 100,

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(0),
                                             bottomLeft: Radius.circular(0),
                                             topLeft: Radius.circular(0),
                                             bottomRight: Radius.circular(0),

                                           ),
                                           color: Colors.grey,
                                           border: Border.all(
                                             width: 0.8,
                                             color: Colors.white,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                                         ),
                                       ),
                                       Expanded(
                                         flex: 4,
                                         child: Container(
                                           padding: EdgeInsets.only(left: 5),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                                               Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                                               // SizedBox(height: 20,),
                                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                                             ],
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 0,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 20,
                                                 width: 20,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topRight: Radius.circular(50),
                                                     bottomLeft: Radius.circular(50),
                                                     topLeft: Radius.circular(50),
                                                     bottomRight: Radius.circular(50),

                                                   ),
                                                   color: Colors.black,
                                                   // border: Border.all(
                                                   //   width: 0.8,
                                                   //   color: Colors.white,
                                                   //   style: BorderStyle.solid,
                                                   // ),
                                                 ),
                                                 child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )

                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(bottom: 8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Container(
                                         width: 100,
                                         height: 100,

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(0),
                                             bottomLeft: Radius.circular(0),
                                             topLeft: Radius.circular(0),
                                             bottomRight: Radius.circular(0),

                                           ),
                                           color: Colors.grey,
                                           border: Border.all(
                                             width: 0.8,
                                             color: Colors.white,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                                         ),
                                       ),
                                       Expanded(
                                         flex: 4,
                                         child: Container(
                                           padding: EdgeInsets.only(left: 5),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                                               Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                                               // SizedBox(height: 20,),
                                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                                             ],
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 0,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 20,
                                                 width: 20,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topRight: Radius.circular(50),
                                                     bottomLeft: Radius.circular(50),
                                                     topLeft: Radius.circular(50),
                                                     bottomRight: Radius.circular(50),

                                                   ),
                                                   color: Colors.black,
                                                   // border: Border.all(
                                                   //   width: 0.8,
                                                   //   color: Colors.white,
                                                   //   style: BorderStyle.solid,
                                                   // ),
                                                 ),
                                                 child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )

                                     ],
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(bottom: 8.0),
                                   child: Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Container(
                                         width: 100,
                                         height: 100,

                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(0),
                                             bottomLeft: Radius.circular(0),
                                             topLeft: Radius.circular(0),
                                             bottomRight: Radius.circular(0),

                                           ),
                                           color: Colors.grey,
                                           border: Border.all(
                                             width: 0.8,
                                             color: Colors.white,
                                             style: BorderStyle.solid,
                                           ),
                                         ),
                                         child: Center(child: Image.asset("assets/images/OF Chicken Fatteh.jpg", width: 100,height: 100,)
                                         ),
                                       ),
                                       Expanded(
                                         flex: 4,
                                         child: Container(
                                           padding: EdgeInsets.only(left: 5),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                                               Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                                               // SizedBox(height: 20,),
                                               Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                                             ],
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         flex: 0,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Container(
                                                 height: 20,
                                                 width: 20,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.only(
                                                     topRight: Radius.circular(50),
                                                     bottomLeft: Radius.circular(50),
                                                     topLeft: Radius.circular(50),
                                                     bottomRight: Radius.circular(50),

                                                   ),
                                                   color: Colors.black,
                                                   // border: Border.all(
                                                   //   width: 0.8,
                                                   //   color: Colors.white,
                                                   //   style: BorderStyle.solid,
                                                   // ),
                                                 ),
                                                 child:Icon(Icons.add,color: Colors.amber.shade500,size: 15,),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )

                                     ],
                                   ),
                                 ),












                               ],
                             ),



                             Text("tabe2"),
                             Text("tabe3"),
                             Text("tabe1"),
                             Text("tabe2"),
                             Text("tabe3"),
                             Text("tabe1"),
                             Text("tabe2"),
                             Text("tabe3"),
                             Text("tabe3"),
                           ]
                       ),
                     ),



                   ],
                 ),
               ),
           )
         ),
         // floatingActionButton: FloatingActionButton(
         //   onPressed:(){
         //     _changeLanguage("en");
         //     PersistentNavBarNavigator.pushNewScreen(
         //       context,
         //       screen: Cart_Screen(),
         //       withNavBar: true, // OPTIONAL VALUE. True by default.
         //       pageTransitionAnimation: PageTransitionAnimation.cupertino,
         //     );
         //   },
         //   tooltip: 'Increment',
         //   child: const Icon(Icons.add),
         // ),
       ),
     ],
   );
  }
}






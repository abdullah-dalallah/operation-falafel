import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/main.dart';
import 'package:operation_falafel/screens/Test%20Page.dart';
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

  @override
  Widget build(BuildContext context) {
    void _changeLanguage (String languageCode) async {
      Locale _temp =await setLocale(languageCode);

      MyApp.setLocale(context,_temp);
    }

   return Scaffold(

     body: DefaultTabController(
       length: 10,
       child:NestedScrollView(

           headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled){
             return <Widget>[
               SliverAppBar(
                 backgroundColor: Colors.orangeAccent,
                 pinned: true,
                 // floating: true,
                 expandedHeight: 230.0,
                 flexibleSpace: FlexibleSpaceBar(
                   // titlePadding: EdgeInsets.only(bottom: 60, left: 50),
                   title: Text('Main Menu', textScaleFactor: 1),
                   background: Image.network(
                     'https://media.cnn.com/api/v1/images/stellar/prod/211006114703-best-meal-delivery-service-freshly.jpg?q=x_2,y_0,h_900,w_1599,c_crop/h_720,w_1280',
                     fit: BoxFit.fill,
                   ),

                 ),
                 elevation: 0,

               ),

               SliverAppBar(


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
           body: TabBarView(

               controller: _cardController,
               children: [

                 ListView(
                   shrinkWrap:true,
                   padding:EdgeInsets.only(top: 30,bottom: 20),
                   physics: NeverScrollableScrollPhysics(),
                   children: [
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe3"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe3"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe3"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe3"),


                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe3"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe3"), Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe1"),
                     Text("tabe2"),
                     Text("tabe3"),
                     Text("tabe3"),

                     Text("khjfgsdnflskinrgolskmfprinfo"),

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
       )
     ),
     floatingActionButton: FloatingActionButton(
       onPressed:(){
         _changeLanguage("en");
         PersistentNavBarNavigator.pushNewScreen(
           context,
           screen: Test_Rout(),
           withNavBar: true, // OPTIONAL VALUE. True by default.
           pageTransitionAnimation: PageTransitionAnimation.cupertino,
         );
       },
       tooltip: 'Increment',
       child: const Icon(Icons.add),
     ),
   );
  }
}



// CustomScrollView(
//
//          slivers: <Widget> [
//            SliverAppBar(
//              backgroundColor: Colors.orangeAccent,
//              pinned: true,
//              // floating: true,
//              expandedHeight: 230.0,
//              flexibleSpace: FlexibleSpaceBar(
//                // titlePadding: EdgeInsets.only(bottom: 60, left: 50),
//                title: Text('Main Menu', textScaleFactor: 1),
//                background: Image.network(
//                  'https://media.cnn.com/api/v1/images/stellar/prod/211006114703-best-meal-delivery-service-freshly.jpg?q=x_2,y_0,h_900,w_1599,c_crop/h_720,w_1280',
//                  fit: BoxFit.fill,
//                ),
//
//              ),
//              elevation: 0,
//
//              ),
//
//            SliverAppBar(
//
//
//              backgroundColor: Colors.orangeAccent,
//              pinned: true,
//              primary: false,
//              backwardsCompatibility: false,
//              automaticallyImplyLeading: false,
//              // expandedHeight: 230.0,
//              title: Align(
//                alignment: AlignmentDirectional.center,
//                child:TabBar(
//
//                  labelColor: Colors.white,
//                  indicatorColor: Colors.transparent,
//                  unselectedLabelColor: Colors.grey.shade300,
//
//                  controller: _cardController,
//                  isScrollable: true,
//                  tabs: [
//                    Tab(child: Text("tabe1"),),
//                    Tab(child: Text("tabe2"),),
//                    Tab(child: Text("tabe3"),),
//                    Tab(child: Text("tabe1"),),
//                    Tab(child: Text("tabe2"),),
//                    Tab(child: Text("tabe3"),),
//                    Tab(child: Text("tabe1"),),
//                    Tab(child: Text("tabe2"),),
//                    Tab(child: Text("tabe3"),),
//                    Tab(child: Text("tabe1"),),
//
//                  ],
//                ),
//              ),
//
//
//            ),
//
//            // SliverToBoxAdapter(
//            //   child: SizedBox(
//            //
//            //     child:
//            //
//            //   ),
//            //
//            // ),
//
//
//
//            SliverFillRemaining(
//            child:   Column(
//              children: [
//                // Container(
//                //   color: Colors.orangeAccent,
//                //   child: TabBar(
//                //
//                //     labelColor: Colors.white,
//                //     indicatorColor: Colors.transparent,
//                //     unselectedLabelColor: Colors.grey.shade300,
//                //
//                //     controller: _cardController,
//                //     isScrollable: true,
//                //     tabs: [
//                //       Tab(child: Text("tabe1"),),
//                //       Tab(child: Text("tabe2"),),
//                //       Tab(child: Text("tabe3"),),
//                //       Tab(child: Text("tabe1"),),
//                //       Tab(child: Text("tabe2"),),
//                //       Tab(child: Text("tabe3"),),
//                //       Tab(child: Text("tabe1"),),
//                //       Tab(child: Text("tabe2"),),
//                //       Tab(child: Text("tabe3"),),
//                //       Tab(child: Text("tabe1"),),
//                //
//                //     ],
//                //   ),
//                // ),
//                Expanded(
//                  child: TabBarView(
//
//                      controller: _cardController,
//                      children: [
//
//                        ListView(
//                           shrinkWrap:true,
//                          padding:EdgeInsets.only(top: 30,),
//                          physics: NeverScrollableScrollPhysics(),
//                          children: [
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe3"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe3"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe3"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe3"),
//
//
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe3"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe3"), Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe1"),
//                            Text("tabe2"),
//                            Text("tabe3"),
//                            Text("tabe3"),
//
//                            Text("khjfgsdnflskinrgolskmfprinfo"),
//
//                          ],
//                        ),
//
//
//
//                        Text("tabe2"),
//                        Text("tabe3"),
//                        Text("tabe1"),
//                        Text("tabe2"),
//                        Text("tabe3"),
//                        Text("tabe1"),
//                        Text("tabe2"),
//                        Text("tabe3"),
//                        Text("tabe3"),
//                      ]
//                  ),
//                ),
//              ],
//            ),
//
//            ),
//
//
//
//          ],
//        ),


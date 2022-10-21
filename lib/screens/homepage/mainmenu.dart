import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainMenu extends StatefulWidget{
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  int currentPos = 0;
  final List<String> imgList = [

    "assets/images/falafel.jpg",
    "assets/images/operation-falafel-scaled.jpg",
    "assets/images/opfalafel2.jpg",
    "assets/images/banner.jpg",
  ];

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          key: _drawerKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              leading:IconButton(onPressed: (){
                _drawerKey.currentState?.openDrawer();
              },icon: FaIcon(FontAwesomeIcons.bars,size: 30,),) ,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Operation Falafel",style: TextStyle(fontFamily: "oldpress",color: Colors.white, fontSize: 30),),

                  Container(
                    width: 35,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        topLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      border: Border.all(
                        width: 0.5,
                        color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/search.png", color: Colors.white,height: 25,width: 25,),
                    ),
                  )
                ],
              )

          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                /// - Slider -
                ClipRRect(
                  borderRadius: BorderRadius.only(),
                  child: CarouselSlider(

                      options: CarouselOptions(
                        height: 320,
                        aspectRatio: 1,
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
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPos == index
                              ? Color.fromRGBO(255, 174, 0, 0.9019607843137255)
                              : Color.fromRGBO(211, 211, 211, 0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                /// - Location
                Container(

                   padding: EdgeInsets.only(left: 20,right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.location_on,color: Colors.orange,),
                    SizedBox(width: 10,),
                    Text("Al Souq Al Kabeer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,fontSize: 17),), Expanded(child: SizedBox(width: 10,)),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.amber,
                      ),
                      child: Text(
                        'Change',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  ],),

                ),

                /// - Menus
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 125,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.amber.shade800,
                              Colors.amber.shade700,
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),

                          ),
                          // color: Colors.amber.shade700,
                          border: Border.all(
                            width: 0.8,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                            child: Column(
                              children: [
                                Text("FULL", style: TextStyle(fontFamily: "oldpress", color: Colors.white,fontSize: 28),),
                                Text("MENU!", style: TextStyle(fontFamily: "oldpress", color: Colors.black,fontSize: 28),),
                              ],
                            )
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                       width: 125,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.grey.shade900,
                              Colors.grey.shade600,
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          border: Border.all(
                            width: 0.8,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                            child: Column(
                              children: [
                                Text("VEGETARIAN", style: TextStyle(fontFamily: "oldpress", color: Colors.green.shade600,fontSize:28, ),),
                                Text("MENU!", style: TextStyle(fontFamily: "oldpress", color: Colors.white,fontSize: 28),),
                              ],
                            )
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: 125,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.grey.shade900,
                              Colors.grey.shade600,
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                            child: Column(
                              children: [
                                Text("VEGAN", style: TextStyle(fontFamily: "oldpress", color: Colors.green.shade600,fontSize: 28),),
                                Text("MENU!", style: TextStyle(fontFamily: "oldpress", color: Colors.white,fontSize: 28),),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                ),

                ///- Your O:F Favorites
                Text("YOUR O:F FAVORITES", style: TextStyle(fontSize: 35,fontFamily: "oldpress", color: Colors.amber.shade500),),

                /// - List
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              // width: 125,
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
                              child: Center(child: Image.asset("assets/images/falafel.jpg")
                              ),
                            ),

                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
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
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              // width: 125,
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
                              child: Center(child: Image.asset("assets/images/falafel.jpg")
                              ),
                            ),

                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
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
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              // width: 125,
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
                              child: Center(child: Image.asset("assets/images/falafel.jpg")
                              ),
                            ),

                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
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
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              // width: 125,
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
                              child: Center(child: Image.asset("assets/images/falafel.jpg")
                              ),
                            ),

                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
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
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              // width: 125,
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
                              child: Center(child: Image.asset("assets/images/falafel.jpg")
                              ),
                            ),

                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
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
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              // width: 125,
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
                              child: Center(child: Image.asset("assets/images/falafel.jpg")
                              ),
                            ),

                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
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
                            )
                          ],
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              // width: 125,
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
                              child: Center(child: Image.asset("assets/images/falafel.jpg")
                              ),
                            ),

                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
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
                            )
                          ],
                        ),
                      ),







                    ],
                  ),
                )

              ],
            ),
          ),
          drawer: DrawerWidget(),
        )

      ],
    );
  }
}
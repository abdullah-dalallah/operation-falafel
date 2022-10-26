import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;

class MainMenu extends StatefulWidget{
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
          appBar: AppBar(
            // toolbarHeight: 40,
              leading:IconButton(onPressed: (){
                _drawerKey.currentState?.openDrawer();
              },icon: FaIcon(FontAwesomeIcons.bars,size: 30,),) ,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:58.0),
                    child: Image.asset("assets/images/of_logo_top.png", width: 220,),
                  ),



                  Stack(
                    children: [
                      Container(
                        width: 35,
                        height: 27,
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
                        child: Image.asset("assets/images/icon_search.png",height: 30,width: 35,),

                      ),

                      new Positioned.fill(
                          child: new Material(
                            color: Colors.transparent,
                            child:  new InkWell(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
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

                ],
              )

          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                /// - Slider - Done Design
                ClipRRect(
                  borderRadius: BorderRadius.only(),
                  child: CarouselSlider(

                      options: CarouselOptions(
                        height: 350,
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
                      padding: const EdgeInsets.only(left: 35.0,right: 35 ,top: 5,bottom: 5),
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

                    Icon(Icons.location_on,color: Colors.orange.shade300,size: 20,),
                    const SizedBox(width: 10,),
                    const Text("Al Souq Al Kabeer", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,fontSize: 12),), Expanded(child: SizedBox(width: 10,)),

                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.amber,
                      ),
                      child: const Text('Change', style: TextStyle(fontWeight: FontWeight.w300, ),),
                    )
                  ],),

                ),

                /// - Menus
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Stack(
                        children: [
                          Container(
                            width: 125,

                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius:const BorderRadius.only(
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
                            child:  Image.asset("assets/images/icon_menu_0.png",),

                          ),
                           Positioned.fill(
                              child:  Material(
                                color: Colors.transparent,
                                child:   InkWell(
                                  borderRadius: BorderRadius.all(Radius.circular(17)),
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
                      const SizedBox(width: 10,),
                      Stack(
                        children: [
                          Container(
                            width: 125,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius:const BorderRadius.only(
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
                            child:  Image.asset("assets/images/icon_menu_1.png",),

                          ),
                          Positioned.fill(
                              child:  Material(
                                color: Colors.transparent,
                                child:   InkWell(
                                  borderRadius: BorderRadius.all(Radius.circular(17)),
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
                      const SizedBox(width: 10,),
                      Stack(
                        children: [
                          Container(
                            width: 125,

                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.only(
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
                            child:  Image.asset("assets/images/icon_menu_2.png",),

                          ),
                          Positioned.fill(
                              child:  Material(
                                color: Colors.transparent,
                                child:   InkWell(
                                  borderRadius: const BorderRadius.all(Radius.circular(17)),
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

                    ],
                  ),
                ),

                ///- Your O:F Favorites
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                        angle: -math.pi / 4,
                        child: Image.asset("assets/images/arrow_down.png" ,height: 32,)),
                    const SizedBox(width: 8,),
                    Text("YOUR O:F FAVORITES", style: TextStyle(fontSize: 33,fontFamily: "oldpress", color: Colors.amber.shade500),),
                    const SizedBox(width: 30,),
                    Transform(
                        transform: Matrix4.rotationY(math.pi),
                        child: Transform.rotate(
                            angle: -math.pi / 4,
                            child: Image.asset("assets/images/arrow_down.png" ,height: 32,))),

                  ],
                ),
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







                    ],
                  ),
                ),

                const SizedBox(height: 10,),
                ///- Our O:F Best Seller
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [//page7_right_icon
                    Transform.rotate(
                        angle: -math.pi / 2,
                        child: Image.asset("assets/images/page7_right_icon.png" ,height: 32,)),
                    const SizedBox(width: 10,),
                    const Text("OUR O:F BEST SELLERS", style: TextStyle(fontSize: 33,fontFamily: "oldpress", color: Colors.white),),
                    const SizedBox(width: 10,),
                    Transform.rotate(
                        angle: -math.pi / 8,
                        child: Image.asset("assets/images/page7_right_icon.png" ,height: 32,)),

                  ],
                ),
                /// - List
                SizedBox(
                  height:100 ,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                         padding: const EdgeInsets.all(4.0),
                         child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    topLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100),

                                  ),
                                  color: Colors.grey,
                                  border: Border.all(
                                    width: 0.8,
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Center(
                                    child:
                                    ClipRRect(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                    child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),

                                ),
                                color: Colors.grey,
                                border: Border.all(
                                  width: 0.8,
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(child: ClipRRect(
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100),bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100)),
                                  child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 90,width: 90,fit: BoxFit.cover,))
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
                ),

                /// - O:F Boxes
                Stack (
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius:const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),

                                      ),
                                      color: Colors.grey,
                                      border: Border.all(
                                        width: 0.8,
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Center(
                                        child: ClipRRect(
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                            child: Image.asset("assets/images/falafel.jpg"))
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
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
                            const SizedBox(width: 5,),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius:const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),

                                      ),
                                      color: Colors.grey,
                                      border: Border.all(
                                        width: 0.8,
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Center(
                                        child: ClipRRect(
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                            child: Image.asset("assets/images/falafel.jpg"))
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
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
                      ],
                    ),
                    Positioned(

                        child: Image.asset("assets/images/page6_boxes.png", height: 60,))
                  ],
                ),


              ],
            ),
          ),
          drawer: DrawerWidget(),
        )

      ],
    );
  }
}
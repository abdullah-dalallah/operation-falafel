import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/widgets/drawer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class TrackMyOrder extends StatefulWidget{
  @override
  State<TrackMyOrder> createState() => _TrackMyOrderState();
}

class _TrackMyOrderState extends State<TrackMyOrder> {

  final List<dynamic> recentOrders = [
    {'Delivery - 23746827236187236':{"meal":"1x Chiken Shawerma Saj","date":"2022-11-07 15:40:18", "orderId":"23746827236187236", "expectedtime":"16:59"}},
    {'Delivery - 17832828327834637':{"meal":"1x XL Hummus","date":"2022-11-07 15:20:18", "orderId":"17832828327834637", "expectedtime":"16:54"}},
    {'Delivery - 23984781236132198':{"meal":"1x XL Hummus","date":"2022-11-07 15:52:18", "orderId":"23984781236132198", "expectedtime":"16:37"}},
  ];
  dynamic? selectedValue;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey(); // Cre
  @override
  Widget build(BuildContext context) {
  return Stack(
    alignment: Alignment.topCenter,
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
          automaticallyImplyLeading: false,
          leading:IconButton(onPressed: (){

            _drawerKey.currentState?.openDrawer();
          },
            icon: const FaIcon(FontAwesomeIcons.bars,size: 30,),) ,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(getTranslated(context, "noOrder")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber.shade400, fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),),

              /// - DropDown
              Padding(
                padding: const EdgeInsets.all(18.0),
                child:  DropdownButtonFormField2(

                          scrollbarAlwaysShow: true,

                  decoration: const InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    // fillColor: Colors.black,
                    filled: false,
                    contentPadding: EdgeInsets.only(),
                    // border: OutlineInputBorder(
                    //   borderSide: const BorderSide(color: Colors.green, width: 40.0, style: BorderStyle.solid ),
                    //   borderRadius: BorderRadius.circular(10),
                    //
                    // ),
                    focusColor: Colors.amber,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:  BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(color: Colors.amber, width: 2.0, ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:  BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(color: Colors.white54, width: 2.0),
                    ),

                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint:  Text(
                    'Select Order',
                    style: TextStyle(fontSize: 16, color: Colors.white60 ,fontFamily: getTranslated(context, "fontFamilyBody")!),
                  ),
                  icon: const ImageIcon(AssetImage("assets/images/down.png"),),
                  // const Icon(
                  //   Icons.arrow_drop_down,
                  //   color: Colors.white60,
                  // ),
                  iconSize: 30,
                  buttonHeight: (selectedValue!=null)?100:50,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                  dropdownDecoration: BoxDecoration(

                     color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                   itemHeight: 100,

                  items: recentOrders
                      .map((order) =>
                      DropdownMenuItem<dynamic>(
                        value: order,
                        child:
                          Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    children: [

                                      (selectedValue!=null)? (selectedValue.keys.elementAt(0)==order.keys.elementAt(0))?
                                      Image.asset("assets/images/page2_icon.png", height: 15,width: 15,)
                                          :SizedBox(width: 15,):SizedBox(width: 15,),
                                      SizedBox(width: 5,),
                                      Text(order.keys.elementAt(0),
                                            style:  TextStyle(fontSize: 13,color: Colors.amber, fontFamily: getTranslated(context, "fontFamilyBody")!),
                                          ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:20.0, right:20),
                                    child: Text(
                                     "${ order[order.keys.elementAt(0)]["meal"].toString()} ...",
                                      style:  TextStyle(fontSize: 12,color: Colors.white, fontFamily: getTranslated(context, "fontFamilyBody")!),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:20.0, right:20),
                                    child: Text(
                                      order[order.keys.elementAt(0)]["date"].toString(),
                                      style:  TextStyle(fontSize: 12,color: Colors.white, fontFamily: getTranslated(context, "fontFamilyBody")!),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:20.0, right:20),
                                    child: Text(
                                      "Order Id: ${order[order.keys.elementAt(0)]["orderId"].toString()}",
                                      style:  TextStyle(fontSize: 12,color: Colors.white, fontFamily: getTranslated(context, "fontFamilyBody")!),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:20.0, right:20),
                                    child: Text(
                                      "Expected: ${order[order.keys.elementAt(0)]["expectedtime"].toString()}",
                                      style:  TextStyle(fontSize: 12,color: Colors.white, fontFamily: getTranslated(context, "fontFamilyBody")!),
                                    ),
                                  ),



                                ],
                              ),





                      ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                   setState((){
                     selectedValue = value;
                   });


                    print(selectedValue.keys.elementAt(0));
                  },
                  onSaved: (value) {
                    setState((){
                      selectedValue = value;
                    });
                  },
                ),
              ),
              /// - DropDown




              Expanded(
                  flex: 5,
                  child: Image.asset("assets/images/track_my_order_delivery_guy.png", height:350,width: 300,)),


              const Expanded(child: SizedBox(height: 1,)),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const  SizedBox(width: 30,child:  Divider(color: Colors.white,thickness: 2,)),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),

                          ),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child:const SizedBox(width: 20,height: 20,
                        ),
                      ),
                      const  SizedBox(width: 60,child: Divider(color: Colors.white,thickness: 2,)),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),

                          ),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child:const SizedBox(width: 20,height: 20,
                        ),
                      ),
                      const  SizedBox(width: 60,child:  Divider(color: Colors.white,thickness: 2,)),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),

                          ),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child: const SizedBox(width: 20,height: 20,
                        ),
                      ),
                      const SizedBox(width: 60,child:  Divider(color: Colors.white,thickness: 2,)),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),

                          ),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 0.8,
                          //   color: Colors.white,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child: const SizedBox(width: 20,height: 20,
                        ),
                      ),
                      const SizedBox(width: 30,child:  Divider(color: Colors.white,thickness: 2,)),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child:SizedBox(
                      width: 320,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // const  SizedBox(width: 65,),
                           Expanded(child: Text(getTranslated(context, "orderAccepted")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize:13, color: Colors.white, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)),
                            // const  SizedBox(width: 30,),
                           Expanded(child: Text(getTranslated(context, "inTheKitchen")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize:13,color: Colors.white, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)),

                            // const  SizedBox(width: 40,),
                           Expanded(child: Text(getTranslated(context, "onTheWay")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize:13,color: Colors.white, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)),

                            // const  SizedBox(width: 30,),
                            Expanded(child: Text(getTranslated(context, "orderDelivered")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,fontSize:13,color: Colors.white, fontWeight: FontWeight.w300,),textAlign: TextAlign.center,)),
                            // const  SizedBox(width: 65,),
                          ],
                        ),
                    ),

                  ),
                ],
              ),


              /// - Contact us
              const  SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery. of(context). size. width,
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          children: [
                            Image.asset("assets/images/page8_phone.png" ,height: 29,color: Colors.amber,),
                            const SizedBox(width: 8,),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text(getTranslated(context, "callUs")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, ),),
                                  SizedBox(width:60,child: Divider(color:Colors.white,thickness: 1,))
                                ],
                              ),
                            )
                          ],
                        ),

                      Row(
                        children: [
                            Image.asset("assets/images/page8_mail.png", height: 25,color: Colors.amber,),
                          const SizedBox(width: 8,),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                Text(getTranslated(context, "emailUs")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white, ),),
                                  SizedBox(width:double.parse(getTranslated(context, "emailUsDividerLength")!),child: Divider(color:Colors.white,thickness: 1,))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

              ),
              const  SizedBox(height: 10,)



            ],
          ),
        ),

        drawer: DrawerWidget()
      ),
    ],
  );
  }
}
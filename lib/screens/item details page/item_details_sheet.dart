import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_provider.dart';
import 'package:operation_falafel/widgets/add_on_tile_widget.dart';
import 'package:operation_falafel/widgets/checkbox_option.dart';
import 'package:operation_falafel/widgets/radio_option.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

import 'package:video_player/video_player.dart';

class ItemDetailsSheet extends StatefulWidget{
  ScrollController scrollController;
  final String layOut ;
  ItemDetailsSheet(this.scrollController,{super.key, required this.layOut});

  @override
  State<ItemDetailsSheet> createState() => _ItemDetailsSheetState();
}

class _ItemDetailsSheetState extends State<ItemDetailsSheet> {



  Map itemOptions ={

    // 'Choice of Folding':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],
    //
    // 'Choice of Cooking':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],

    'Customization':[{'no onion':{"Price":0,"flag":false}}, {'no capsicum':{"Price":0,"flag":false}},{'no potato':{"Price":0,"flag":false}}],

    'Add on':[{'Cheese':{"Price":8,"quantity":0}}, {'Mini Fattoush':{"Price":10,"quantity":0}},{'Mini Quinoa Tabouleh':{"Price":17,"quantity":0}}],
  };
  List<Map> selectedOptions = [];
  List<Map> selectdAddOn  =[];

  /// - Addon
  ValueChanged _addOnchangeHandler(int Index1, int Index2,){
    return (operation)=>setState(() {
      int tempQ =itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["quantity"];
      if(operation == "pluse"){
        if(tempQ>=0){
          tempQ += 1;
          itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["quantity"]= tempQ;
          // selectdAddOn.add(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);
          if(checkExistInAddOn(itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0))){
            int tempIndex =  selectdAddOn.indexOf(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);
            String tempKey = selectdAddOn[tempIndex].keys.elementAt(0);
            selectdAddOn[tempIndex][tempKey]["quantity"] = tempQ;
          }else{
            selectdAddOn.add(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);

          }

        }

      }
      else if(operation =="minus"){
        if(tempQ>0){
          tempQ -= 1;
          itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["quantity"]= tempQ;
          // selectdAddOn.add(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);
          if(checkExistInAddOn(itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0))){
            int tempIndex =  selectdAddOn.indexOf(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);
            String tempKey = selectdAddOn[tempIndex].keys.elementAt(0);
            selectdAddOn[tempIndex][tempKey]["quantity"] = tempQ;
          }
          if(tempQ == 0){
            selectdAddOn.remove(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);
          }

        }

      }

      print("add on: ${selectdAddOn}");



    });
  }
  bool checkExistInAddOn(String name) {
    bool alreadyExist = false;

    if (selectdAddOn.isNotEmpty) {
      selectdAddOn.forEach((element) {
        if (element.keys.elementAt(0) == name) {
          alreadyExist = true;
        }
        ;
      });
    } else {
      alreadyExist = false;
    }

    return alreadyExist;
  }

  /// - customization
  int checkCounts=0;
  ValueChanged _valueChangedHandler(int Index1, int Index2, bool addOnFlag) {
    return (value) => setState(() {
      if(!addOnFlag){
        if(checkCounts>=3 ){
          if(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]==true){
            itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]=false;
            checkCounts--;
            selectedOptions.remove(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);

          }
        }
        else{
          itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]=(value==false)?true:false;
          checkCounts += (value==false)?1:-1;
          (value==false)? selectedOptions.add(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]): selectedOptions.remove(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);

          // print(checkCounts);
        }
      }
      else{
        itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]=(value==false)?true:false;
        // (value==false)?selectdAddOn.add(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]):selectdAddOn.remove(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]);
        // print("add on:${selectdAddOn}");
      }

      print("customization: ${selectedOptions}");
    });


  }



  @override
  void initState() {
    super.initState();



  }

  int itemQuantity = 1;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8)
            )
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                "assets/images/background.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),

            Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const ImageIcon(
                    AssetImage("assets/images/down.png",),
                    size: 35,
                  ),
                ) ,
              ),
              body: SingleChildScrollView(
                controller:  widget.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// -  item image
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),

                        ),
                        child: Image.asset("assets/images/OF Chicken Fatteh.jpg", height:(widget.layOut=="Mobile")? 280:480,width: double.maxFinite,fit: BoxFit.cover,)),
                    /// - item title & subtitle & price
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18,top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText("Chicken Fatteh", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                          const SizedBox(height: 8,),
                          const MyText("Chicken topped with rice, fatteh yogurt,fried bread,pine nuts,sumac. parsley and gheee.", style: TextStyle(color: Colors.white, fontSize: 15),),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:const [
                              MyText("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          const Divider(color: Colors.white,height: 1,),


                        ],
                      ),
                    ),
                    /// - item options
                    Padding(
                      padding: const EdgeInsets.only(left:18.0,right: 18),
                      child: SizedBox(
                        height: MediaQuery. of(context). size. height-520,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics:const BouncingScrollPhysics(),
                          itemCount: itemOptions.length,
                          padding:const EdgeInsets.only(top: 5),
                          itemBuilder: (context, index) =>
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText("${itemOptions.keys.elementAt(index)}", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),

                                  ListView.builder(
                                    padding:const EdgeInsets.only(top: 0),
                                    physics:const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: itemOptions[itemOptions.keys.elementAt(index)].length,
                                    itemBuilder: (context, Index) =>

                                    (itemOptions.keys.elementAt(index)!="Add on")?
                                    CheckboxOption(
                                      value: itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["flag"],
                                      onChanged:_valueChangedHandler(index,Index, (itemOptions.keys.elementAt(index)=="Add on")?true:false),
                                      label: '1',
                                      text: '${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)} ',
                                      addOnFlag: (itemOptions.keys.elementAt(index)=="Add on")?true:false,
                                      colorOfText: Colors.white,
                                      fontFamily: getTranslated(context, "fontFamilyBody")!,
                                      // priceText: "${itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["Price"]} AED",

                                    )
                                        :AddOnTileWidget(
                                      quantity: itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["quantity"],
                                      onChanged:_addOnchangeHandler( index,  Index,),
                                      fontFamily: getTranslated(context, "fontFamilyBody")!,
                                      priceText: "${itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["Price"]} AED",
                                      text: '${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)} ',
                                      colorOfText: Colors.white,

                                    ),


                                  ),





                                ],
                              ),
                        ),
                      ),


                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ),
              bottomSheet:  Container(
                color: Colors.black,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    /// - Pluse & minuse
                    Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.only(left:0.0, right: 0),
                        child: Container(
                          decoration:const BoxDecoration(
                            borderRadius:  BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            // border: Border.all(
                            //   width: 0.8,
                            //   color: Colors.white,
                            //   style: BorderStyle.solid,
                            // ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width:45,
                                height:45,

                                child: ElevatedButton(
                                  onPressed: () {
                                    if(itemQuantity>0){
                                      setState(() {
                                        itemQuantity--;
                                      });

                                    }
                                  },
                                  style: ButtonStyle(
                                    // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    //     (Localizations.localeOf(context).languageCode=='en')?
                                    //     const RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.only(
                                    //           bottomLeft:     Radius.circular(10),
                                    //           topLeft: Radius.circular(10),
                                    //         ),
                                    //         side: BorderSide(color: Colors.transparent)
                                    //     ):
                                    //     (Localizations.localeOf(context).languageCode=='ar')?
                                    //     const RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.only(
                                    //           bottomRight:     Radius.circular(10),
                                    //           topRight: Radius.circular(10),
                                    //         ),
                                    //         side: BorderSide(color: Colors.transparent)
                                    //     ):
                                    //     const RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.only(
                                    //           bottomLeft:     Radius.circular(10),
                                    //           topLeft: Radius.circular(10),
                                    //         ),
                                    //         side: BorderSide(color: Colors.transparent)
                                    //     )
                                    // ),
                                      elevation:MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      foregroundColor: MaterialStateProperty.all(Colors.white),
                                      padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                                  child:const Icon(Icons.remove,size: 18,),
                                ),
                              ),
                              SizedBox(width:30, child: MyText("${itemQuantity}",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),),
                              SizedBox(
                                width:45,
                                height:45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(itemQuantity>=0){
                                      setState(() {
                                        itemQuantity++;
                                      });

                                    }
                                  },
                                  style: ButtonStyle(
                                    // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    //     (Localizations.localeOf(context).languageCode=='en')?
                                    //     const RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.only(
                                    //           bottomRight:     Radius.circular(10),
                                    //           topRight: Radius.circular(10),
                                    //         ),
                                    //         side: BorderSide(color: Colors.transparent)
                                    //     ):
                                    //     (Localizations.localeOf(context).languageCode=='ar')?
                                    //     const RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.only(
                                    //           bottomLeft:     Radius.circular(10),
                                    //           topLeft: Radius.circular(10),
                                    //         ),
                                    //         side: BorderSide(color: Colors.transparent)
                                    //     ):
                                    //     const RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.only(
                                    //           bottomRight:     Radius.circular(10),
                                    //           topRight: Radius.circular(10),
                                    //         ),
                                    //         side: BorderSide(color: Colors.transparent)
                                    //     )
                                    // ),
                                      elevation:MaterialStateProperty.all(0),
                                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                      foregroundColor: MaterialStateProperty.all(Colors.white),
                                      padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                                  child: const Icon(Icons.add,size: 18,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ),
                    /// - Add to cart
                    Expanded(
                      child: SizedBox(
                          width: 290,
                          height: 45,
                          child: ElevatedButton(
                              onPressed: (){
                                List<Map> tempAddon = [
                                  {'Cheese':{"Price":15,"flag":false}},
                                  {'Mini Fattoush':{"Price":13,"flag":false}},
                                  {'Mini Quinoa Tabouleh':{"Price":17,"flag":false}},
                                ];
                                List<Map> tempOtions = [
                                  {'oil ':{"Price":0,"flag":false}},
                                  {'water':{"Price":0,"flag":false}},
                                  {'drink':{"Price":0,"flag":false}},
                                ];
                                Provider.of<DemoCartProvider>(context, listen: false).addToCart(
                                    itemName: "Chicken Fatteh",
                                    itemQuantity: itemQuantity,
                                    itemTotalPrice: (44.0*itemQuantity),
                                    itemUnitPrice: 44.0,
                                    selectedAddon: selectdAddOn,
                                    selectedOtions: selectedOptions).then((value) => Navigator.pop(context));
                              },
                              style: ButtonStyle(
                                backgroundColor:  MaterialStateProperty.all<Color>(Colors.amber),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0.0),
                                        side: BorderSide(color: Colors.transparent,width: 1.5)
                                    )
                                ),


                              ),
                              child:  MyText(getTranslated(context, "addToCart")!,style: TextStyle(fontFamily:getTranslated(context, "fontFamilyBody")!,color: Colors.white,fontWeight: FontWeight.w300, fontSize: 20),)


                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Image.asset("assets/images/text button.png", color: Colors.white,),
                            // ),
                          )
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
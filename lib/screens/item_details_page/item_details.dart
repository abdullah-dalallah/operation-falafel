import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/widgets/checkbox_option.dart';
import 'package:operation_falafel/widgets/radio_option.dart';
import 'package:getwidget/getwidget.dart';

class ItemDetails extends StatefulWidget{
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  int checkCounts=0;


  ValueChanged _valueChangedHandler(int Index1, Index2) {
    return (value) => setState(() {
      if(checkCounts>=3 ){
       if(itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]==true){
         itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]=false;
         checkCounts--;

       }
      }
      else{
        itemOptions[itemOptions.keys.elementAt(Index1)][Index2]['${itemOptions[itemOptions.keys.elementAt(Index1)][Index2].keys.elementAt(0)}']["flag"]=(value==false)?true:false;
        checkCounts += (value==false)?1:-1;
        print(checkCounts);
      }

    });
  }

  Map itemOptions ={
    // 'Choice of Folding':["Wrap","Roll cut in half","Roll cut 4 Pieces"],
    // 'Choice of Cooking':["Well-done"],
    // 'Customization':["no lettuce","no picles","no aioli mayo"],
    'Choice of Folding':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],

    'Choice of Cooking':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],

    'Customization':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],

    'Add on':[{'Cheese':{"Price":50,"flag":false}}, {'Mini Fattoush':{"Price":51,"flag":false}},{'Mini Quinoa Tabouleh':{"Price":52,"flag":false}}],
  };






  @override
  void initState() {
    super.initState();
    print(itemOptions);
    print(itemOptions['Add on']?.length);
    print(itemOptions[itemOptions.keys.elementAt(1)][1]['${itemOptions[itemOptions.keys.elementAt(1)][1].keys.elementAt(0)}']["Id"]);
  }

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
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ),
            ) ,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/OF Chicken Fatteh.jpg", height: 280,width: double.maxFinite,fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18,top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Build-Your-Owen Slider Box", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),
                    const Text("Perfect for sharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("AED 44", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),),
                        Container(
                          width: 320,
                          height: 40,
                          child:  TextField(

                            decoration:  InputDecoration(
                              fillColor: Colors.orange.withOpacity(0.1),
                              filled: true,
    
                              contentPadding: EdgeInsets.only(left:8),
                              focusedBorder:const OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.grey, width: 1.0,),

                              ),
                              enabledBorder:const OutlineInputBorder(
                                // borderRadius: BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              hintText: 'Special instruction',
                              hintStyle:const TextStyle(color: Colors.grey)
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    const Divider(color: Colors.white,height: 1,),


                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:18.0,right: 18),
                  child: ListView.builder(
                    itemCount: itemOptions.length,
                    padding: EdgeInsets.only(top: 5),
                      itemBuilder: (context, index) =>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text("${itemOptions.keys.elementAt(index)}", style: TextStyle(color: Colors.amber, fontSize: 20,fontWeight: FontWeight.w300),),

                              ListView.builder(
                                padding: EdgeInsets.only(top: 0),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: itemOptions[itemOptions.keys.elementAt(index)].length,
                                  itemBuilder: (context, Index) =>

                                      CheckboxOption(
                                        value: itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["flag"],
                                        onChanged:_valueChangedHandler(index,Index),
                                        label: '1',
                                        text: '${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}',
                                      ),


                                       // ListTile(
                                       //   leading:  GFCheckbox(
                                       //      customBgColor: Colors.transparent,
                                       //     inactiveBgColor: Colors.transparent,
                                       //     type: GFCheckboxType.square,
                                       //     size: 25,
                                       //     activeBgColor: Colors.transparent,
                                       //     inactiveIcon: Icon(Icons.add),
                                       //     activeBorderColor: Colors.amber,
                                       //     inactiveBorderColor:  Colors.amber,
                                       //     activeIcon: ImageIcon(
                                       //       AssetImage("assets/images/page2_icon.png"),
                                       //       // color: Colors,
                                       //     ),
                                       //
                                       //
                                       //     onChanged: (value) {
                                       //       setState(() {
                                       //         // isChecked = value;
                                       //       });
                                       //     },
                                       //     value: true,
                                       //
                                       //   ),
                                       // ),
                                     ///

                                      // CheckboxListTile(
                                      //
                                      //   // checkboxShape: ,
                                      //   title: const Text('GeeksforGeeks', style: TextStyle(color: Colors.white),),
                                      //   subtitle: const Text('A computer science portal for geeks.',style: TextStyle(color: Colors.white),),
                                      //   // secondary: const Icon(Icons.code),
                                      //   autofocus: false,
                                      //   checkboxShape:  BeveledRectangleBorder(
                                      //
                                      //   borderRadius: BorderRadius.circular(0.0),
                                      //     side: BorderSide(
                                      //       color: Colors.white,
                                      //       width: 0.0,
                                      //     ),
                                      //   ),
                                      //   activeColor: Colors.transparent,
                                      //   checkColor: Colors.transparent,
                                      //
                                      //   side:BorderSide(
                                      //     color: Colors.white,
                                      //     width: 0.0,
                                      //   ),
                                      //
                                      //
                                      //   selected: _value,
                                      //   value: _value,
                                      //   onChanged: ( value) {
                                      //     setState(() {
                                      //       _value = value!;
                                      //     });
                                      //   },
                                      // )
                                      //

                                 ///
                                  //     RadioOption<String>(
                                  //   value: '${itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["Id"]}',
                                  //   groupValue: _foodType,
                                  //   onChanged:_valueChangedHandler(itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["Id"]),
                                  //   label: '1',
                                  //   text:
                                  //   // '${itemOptions[itemOptions.keys.elementAt(index)][Index]['${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}']["Id"]}'
                                  //   '${itemOptions[itemOptions.keys.elementAt(index)][Index].keys.elementAt(0)}',
                                  //
                                  // ),

                              ),




                            ],
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 10),
                child: Container(
                    width: 330,
                    height: 38,
                    child: ElevatedButton(
                        onPressed: (){print("added");},
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Colors.grey.shade200,width: 1.5)
                              )
                          ),


                        ),
                        child: const Text("Add to cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),)


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
      ],
    );
  }
}
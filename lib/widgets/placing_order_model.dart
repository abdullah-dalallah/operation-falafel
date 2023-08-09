import 'package:flutter/material.dart';

import 'package:operation_falafel/providers/palcing_order_model_provider.dart';
import 'package:provider/provider.dart';

import '../localization/localization_constants.dart';

class PlacingOrderModel extends StatefulWidget{
  late BuildContext checkOutScreenContext;

  PlacingOrderModel(this.checkOutScreenContext,{Key? key}) : super(key: key);

  @override
  State<PlacingOrderModel> createState() => _PlacingOrderModelState();
}

class _PlacingOrderModelState extends State<PlacingOrderModel> {




  @override
  Widget build(BuildContext context) {

    Provider.of<PlacingOrderModelProvider>(context, listen: false).startTimer(context, );


    return
      false?
      Container(
        height: MediaQuery.of(context).size.height * 0.28,
        decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.amber),
            ),
          ],
        ),
      )
          :Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
        ),
        padding: const EdgeInsets.all(0),
        // height: MediaQuery.of(context).size.height * 0.25,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Placing your order", style: TextStyle(fontSize: 35,color: Colors.white54,fontFamily: getTranslated(context, "fontFamilyButtons")!),),
                    OutlinedButton(
                      onPressed: (){
                        Provider.of<PlacingOrderModelProvider>(context, listen: false).closeCurrentModel(context);
                        // Navigator.pop(context);

                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.white54),
                        backgroundColor:  MaterialStateProperty.all(Colors.transparent),
                        foregroundColor:  MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0),)

                        ),
                        side:  MaterialStateProperty.all(BorderSide(color: Colors.amber))
                      ),
                      child:  Text("Cancel", style: TextStyle(fontFamily: getTranslated(context, "fontFamilyButtons", )!,fontSize: 17),),
                    )
                  ],
                ),
              ),

              Consumer<PlacingOrderModelProvider>(builder: (context, value, child) {
                return  LinearProgressIndicator(
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.amber,
                  value: value.makeOrderProgress,
                  minHeight: 6,
                );
              }),

              // const Divider(thickness: 5,height: 1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount paying", style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white54, fontFamily: getTranslated(context, "fontFamilyBody" )!,fontSize: 13),),
                        Text("00" + " AED",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white54, fontFamily: getTranslated(context, "fontFamilyBody", )!,fontSize: 13),)
                      ],),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Paying with", style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white54, fontFamily: getTranslated(context, "fontFamilyBody", )!,fontSize: 13),),
                        Text("Master Card, Loyalty",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white54, fontFamily: getTranslated(context, "fontFamilyBody", )!,fontSize: 13),)
                      ],),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Voucher", style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white54, fontFamily: getTranslated(context, "fontFamilyBody", )!,fontSize: 13),),
                        Text("Free Delivdery. Min order AED 30",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white54, fontFamily: getTranslated(context, "fontFamilyBody", )!,fontSize: 13),)
                      ],),
                    SizedBox(height: 10,),

                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title:  Text("Delivering to", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white54, fontFamily: getTranslated(context, "fontFamilyBody", )!),),
                      subtitle:

                      Text("Dubai Multi Commodities Centre - Jumeirah Lake Towers - Dubai\n",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13,color: Colors.white54, fontFamily: getTranslated(context, "fontFamilyBody", )!),),
                      // Text("Home - Dubai - Silicon oasis - binghatti point 910", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      );
  }

  @override
  void initState() {
    super.initState();

  }


}
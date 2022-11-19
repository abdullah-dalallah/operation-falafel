import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class OrderDetails extends StatefulWidget{
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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

          backgroundColor: Colors.transparent,
          appBar:AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:
              (Localizations.localeOf(context).languageCode=='en')?
              const ImageIcon(
                AssetImage("assets/images/back_new.png",),
                size: 35,
              ):
              const ImageIcon(
                AssetImage("assets/images/back_arabic.png",),
                size: 35,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title:Text(getTranslated(context, "operationFalafelLogo")!, style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyTitle")!}", fontWeight: FontWeight.bold),),
            actions: [],
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 450, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(getTranslated(context, "orderDetails")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),

                  /// - New Order
                  const  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [




                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getTranslated(context, "newOrder")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.green, fontSize: 15),),
                            Text("2022-10-19 20:22:17",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 15),),

                          ],),

                        const Expanded(child: SizedBox(width: 15,)),
                        Column(
                          children: [

                            SizedBox(
                                height:30,
                                child: ElevatedButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    backgroundColor:  MaterialStateProperty.all<Color>(Colors.black45),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            side:const BorderSide(color: Colors.transparent,width: 1.5)
                                        )
                                    ),
                                    padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.refresh, color: Colors.white54,size: 14,),
                                      SizedBox(width: 10,),
                                      Text(getTranslated(context, "reOrder")!,style: TextStyle(fontFamily: getTranslated(context, "fontFamilyBody")!,color: Colors.white, fontSize:12)),

                                    ],
                                  ),)

                            )

                          ],
                        ),

                      ],
                    ),
                  ),
                   /// - Order ID
                  const  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18),
                    child: Row(
                      children: [
                        Text("${getTranslated(context, "orderId")!}: 999748117",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 15),),
                      ],
                    ),
                  ),

                  /// - Address
                  const  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18),
                    child: Row(
                      children: [
                        Expanded(child: Text("${getTranslated(context, "address")!}: Jumeirah Lakes Tower | Flat/Building:mazaya business avenue 2903 | Area:Dubai - Jumeirah Lake Tower - mazaya business avenue BB1 -2903 - mazaya business avenue",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 15),)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18),
                    child: Divider(color: Colors.white70,),
                  ),
                  /// - Order summary
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18),
                    child: Row(
                      children: [
                        Text("${getTranslated(context, "orderSummary")!}",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 17),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(top: 8),
                      shrinkWrap: true,
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(left:18.0, right: 18, bottom: 10),
                           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("X1 Chicken Shawerma Pita",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber, fontSize: 17),),
                               Text("AED 17",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 16),),
                             ],
                           ),
                         ),
                          Padding(
                            padding: const EdgeInsets.only(left:18.0, right: 18, bottom: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("X1 Fries Filling",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber, fontSize: 17),),
                                Text("AED 17",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 16),),
                              ],
                            ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18),
                    child: Divider(color: Colors.white70,),
                  ),
                  /// - Payment Methods
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getTranslated(context, "paymentMethod")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber, fontSize: 17),),
                            Text("Credit/Debit Card",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 15),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18),
                    child: Divider(color: Colors.white70,),
                  ),
                  /// - Order totals
                   // - sub total
                   Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18 ,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                            Text(getTranslated(context, "subTotalDetails")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 17),),
                            Text("AED 17.00",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 15),),

                      ],
                    ),
                  ),
                   // - Loyality
                   Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18 ,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(getTranslated(context, "o:fLoyalityCredits")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber, fontSize: 17),),
                        Text("AED 4.25",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.amber, fontSize: 15),),

                      ],
                    ),
                  ),
                   // - service charges
                   Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18 ,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(getTranslated(context, "serviceCharge")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 17),),
                        Text("AED 4.25",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 15),),

                      ],
                    ),
                  ),
                   // - Total
                  Padding(
                    padding: const EdgeInsets.only(left:18.0, right: 18 ,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(getTranslated(context, "totalDetails")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 17),),
                        Text("AED 19.75",style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyBody")!}",color: Colors.white70, fontSize: 15),),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
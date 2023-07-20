import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

import 'cart_gifts_sheet.dart';

class CartGiftsWidget extends StatefulWidget{
  @override
  State<CartGiftsWidget> createState() => _CartGiftsWidgetState();
}

class _CartGiftsWidgetState extends State<CartGiftsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InputDecorator(

        decoration: InputDecoration(
          // labelText: 'XP',
           label: SizedBox(
             width: 112,
             child: Row(
               children: [
                 Image.asset("assets/images/how2.png", height: 35,),
                 SizedBox(width: 10,),
                 // Icon(Icons.add,color: Colors.white54,),
                 Text('O:F Gifts', style: TextStyle(color: Colors.white54, fontFamily:"${getTranslated(context, "fontFamilyButtons")!}",fontSize: 25),)
               ],
             ),
           ),
           contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:BorderSide(color: Colors.amber ,width: 1.5, style: BorderStyle.solid)
          ),
        ),
        child:  Column(
          children: [
           ListTile(
               // tileColor: Colors.green,
               visualDensity: VisualDensity(vertical:-4),
               // dense: true,
               title:  Text('Operation Falafel Vouchers', style: TextStyle(color: Colors.amber, fontFamily:"${getTranslated(context, "fontFamilyBody")!}"),),
               subtitle:  Text('Select Voucher', style: TextStyle(color: Colors.white54,fontFamily:"${getTranslated(context, "fontFamilyBody")!}"),),
              trailing: SizedBox(
                height: 30,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,

                        backgroundColor: Colors.transparent,
                        builder: (context) =>
                            DraggableScrollableSheet(
                                initialChildSize: 0.3,
                                // minChildSize: 0.5,
                                maxChildSize: 1,
                                expand: true,
                                builder: (context, scrollController) {
                                  return CartGiftsSheet(scrollController);
                                }

                            )


                    );

                  },
                  child: Text("Choose", style: TextStyle(color:Colors.amber, fontSize: 12 , fontWeight: FontWeight.normal,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),




                ),
              ),
           ),
            /// -Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(100),
                          topRight: Radius.circular(100)
                      )
                  ),
                  child: SizedBox(
                    width: 11,
                    height: 23,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: List.generate(850~/10, (index) => Expanded(
                      child: Container(
                        color: index%2==0?Colors.transparent
                            :Colors.grey,
                        height: 1,
                      ),
                    )),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          topLeft: Radius.circular(100)
                      )
                  ),
                  child: SizedBox(
                    width: 11,
                    height: 23,
                  ),
                ),

              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title:Text("Free Delivery. Min order. AED 30.", style: TextStyle( color:Colors.white70, fontSize: 15, fontWeight: FontWeight.bold,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
              trailing: SizedBox(
                height: 30,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {

                  },
                  child:
                  Text("Remove", style: TextStyle(color:Colors.amber, fontSize: 12 , fontWeight: FontWeight.bold,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),




                ),
              ),
              children: [
                /// -Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100),
                              topRight: Radius.circular(100)
                          )
                      ),
                      child: SizedBox(
                        width: 11,
                        height: 23,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: List.generate(850~/10, (index) => Expanded(
                          child: Container(
                            color: index%2==0?Colors.transparent
                                :Colors.grey,
                            height: 1,
                          ),
                        )),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topLeft: Radius.circular(100)
                          )
                      ),
                      child: SizedBox(
                        width: 11,
                        height: 23,
                      ),
                    ),

                  ],
                ),
                /// -
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 18, right: 18),
                        child: Row(
                          children: [
                            Image.asset("assets/images/page2orders_icon.png", height: 14,),
                            SizedBox(width: 10,),
                            Text("Valid on orders of at least AED 30 after discounts", style: TextStyle(color:Colors.white70, fontSize: 12 , fontWeight: FontWeight.normal,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
                          ],
                        ),
                      );

                  },



                ),


              ],
            )

          ],
        ),
      ),
    );
  }
}
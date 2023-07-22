import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class CartGiftsSheet extends StatefulWidget{
  ScrollController scrollController;

  CartGiftsSheet(this.scrollController,{super.key});
  @override
  State<CartGiftsSheet> createState() => _CartGiftsSheetState();
}

class _CartGiftsSheetState extends State<CartGiftsSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)
          )
      ),
      child:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText("Choose Vaoucher", style: TextStyle(color:Colors.amber, fontSize: 17 , fontWeight: FontWeight.normal,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(CupertinoIcons.clear, color: Colors.white ,size: 18,)),
              ],
            ),
          ),
          Divider(height: 1,color: Colors.white,),


          Expanded(
            child: ListView.separated(
            controller: widget.scrollController,
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ExpansionTile(
                initiallyExpanded: true,
                title:MyText("Free Delivery. Min order. AED 30.", style: TextStyle( color:Colors.white70, fontSize: 15, fontWeight: FontWeight.bold,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
                trailing: SizedBox(
                  height: 30,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {

                    },
                    child:
                    MyText("Apply", style: TextStyle(color:Colors.amber, fontSize: 12 , fontWeight: FontWeight.bold,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),




                  ),
                ),
                children: [
                  /// -Divider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
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
                            color: Colors.white,
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
                  controller: widget.scrollController,
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
                          MyText("Valid on orders of at least AED 30 after discounts", style: TextStyle(color:Colors.white70, fontSize: 12 , fontWeight: FontWeight.normal,fontFamily: "${getTranslated(context, "fontFamilyBody")!}"),),
                        ],
                      ),
                    );

                  },



                  ),


                ],
              );
            },
              separatorBuilder: (context, inexd){
                return Divider(color: Colors.white70,);
              },
            ),
          )


        ],
      ),
    );
  }
}
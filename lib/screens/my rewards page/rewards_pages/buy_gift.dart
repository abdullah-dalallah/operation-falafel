import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/tabbar%20menu%20page/menu_tabebar.dart';
import 'package:operation_falafel/widgets/buy_gift_payment_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BuyGift extends StatefulWidget{
  @override
  State<BuyGift> createState() => _BuyGiftState();
}

class _BuyGiftState extends State<BuyGift> {

  List<String> giftImgs=[
    "assets/images/credits_30_credits.png",
    "assets/images/credits_50_credits.png",
    "assets/images/credits_70_credits.png",
    "assets/images/credits_100_credits.png",
    "assets/images/credits_150_credits.png",
    "assets/images/credits_200_credits.png",
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
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
        body:
        Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 450, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

               Text(getTranslated(context, "buyGifts")!,style: TextStyle(fontFamily: "${getTranslated(context, "fontFamilyButtons")!}",color: Colors.amber, fontSize: double.parse(getTranslated(context, "fontFamilyTitleُSize")!)),),

                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:5,
                      childAspectRatio: 1.39,
                    ),

                    itemBuilder: (context, index) =>  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius:const BorderRadius.only(
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                topLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              border: Border.all(
                                width: 1,
                                color: Colors.amber,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child:  Image.asset(giftImgs[index],),

                          ),

                          Positioned.fill(
                              child:  Material(
                                color: Colors.transparent,
                                child:   InkWell(
                                  borderRadius: BorderRadius.all(Radius.circular(0)),
                                  splashColor: Colors.black,
                                  overlayColor: MaterialStateProperty.all<Color>(Colors.black54),

                                  onTap: (){
                                    showMaterialModalBottomSheet(
                                        expand: false,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) => DraggableScrollableSheet(
                                            initialChildSize: 0.33,
                                            minChildSize: 0.3,
                                            maxChildSize: 0.4,
                                            expand: true,
                                            builder: (context, scrollController) {
                                              return BuyGiftPaymentSheet(scrollController: scrollController);
                                            }

                                        )
                                    );
                                  },
                                ),

                              )
                          ),

                        ],
                      ),
                    ),


                    itemCount: giftImgs.length,
                  ),
                )

              ],
            ),
          ),
        ),



      )
    ],
  );
  }
}
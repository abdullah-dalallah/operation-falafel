import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';
import 'package:operation_falafel/screens/item%20details%20page/item_details_sheet.dart';

class RepeatLastCustomizationSheet extends StatelessWidget{
  ScrollController? scrollController;
  final String layOut ;
  RepeatLastCustomizationSheet({super.key,this.scrollController, required this.layOut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:  SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)
              )
          ),
          padding: const EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height / 3,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          getTranslated(context, "repeatOrder")!,
                          style: TextStyle(
                              fontFamily:  getTranslated(context, "fontFamilyBody")!,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.amber
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close, color: Colors.white,)),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey,),
                const ListTile(
                  title:
                  Text("Chicken Fatteh", style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold, ),),
                  subtitle:Text("perfect for shharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),

                ),
                // const Expanded(child:  SizedBox(height: 10,)),


              ],
            ),
          ),
        ),
      ),
      bottomSheet:Container(

        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    // width:190,
                    height:40,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);

                        showModalBottomSheet(
                            // expand: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                DraggableScrollableSheet(
                                    initialChildSize: 0.8,
                                    minChildSize: 0.6,
                                    maxChildSize: 1,
                                    expand: true,
                                    builder: (context, scrollController) {
                                      return ItemDetailsSheet(layOut: layOut,scrollController);
                                    }

                                )

                        );

                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        side: BorderSide(

                          width: 1.0,
                          color: Colors.amber,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text( getTranslated(context, "addNew")!,style: TextStyle(fontSize:15,color: Colors.amber,  fontFamily:  getTranslated(context, "fontFamilyBody", )!,), ),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: SizedBox(
                    // width:190,
                    height:40,

                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        side: BorderSide(

                          width: 1.0,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text( getTranslated(context, "repeatLast")!, style: TextStyle(fontSize:15,color: Colors.white, fontFamily:  getTranslated(context, "fontFamilyBody")!,)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
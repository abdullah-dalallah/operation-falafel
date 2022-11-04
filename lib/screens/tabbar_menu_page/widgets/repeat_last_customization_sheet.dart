import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operation_falafel/localization/localization_constants.dart';

class RepeatLastCustomizationSheet extends StatelessWidget{
  ScrollController scrollController;
  RepeatLastCustomizationSheet(this.scrollController,{super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8)
            )
        ),
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height / 3,
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
              Text("Build-your-Owen Slider box", style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
              subtitle:Text("perfect for shharing! Build your own 12 O:F slider box with your favourites.", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),

            ),
            SizedBox(height: 10,),
            SizedBox(
              width: (double.maxFinite/2)-50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width:190,
                    height:40,

                    child: OutlinedButton(
                      onPressed: () {},
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
                      child: Text( getTranslated(context, "addNew")!,style: TextStyle(color: Colors.amber,  fontFamily:  getTranslated(context, "fontFamilyBody")!,), ),
                    ),
                  ),
                  SizedBox(
                    width:190,
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
                      child: Text( getTranslated(context, "repeatLast")!, style: TextStyle(color: Colors.white, fontFamily:  getTranslated(context, "fontFamilyBody")!,)),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

}
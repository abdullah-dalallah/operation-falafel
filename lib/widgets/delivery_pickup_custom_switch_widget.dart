import 'package:flutter/material.dart';
import 'package:operation_falafel/data/my_text.dart';

class DeliveryPickupCustomSwitchWidget extends StatefulWidget {
  final ValueChanged onChanged;
  const DeliveryPickupCustomSwitchWidget({required this.onChanged,super.key});

  @override
  State<DeliveryPickupCustomSwitchWidget> createState() => _DeliveryPickupCustomSwitchWidgetState();
}

class _DeliveryPickupCustomSwitchWidgetState extends State<DeliveryPickupCustomSwitchWidget> {
  String scheduleValue = "Delivery";

  @override
  Widget build(BuildContext context) {
     return Container(
       decoration:  BoxDecoration(
         color:
         Colors.grey.shade100.withOpacity(0.5),
         // Color(int.parse(cartPage.body.selectAddress.backGroundColor)),
         borderRadius:const BorderRadius.only(
           topRight: Radius.circular(100),
           bottomLeft: Radius.circular(100),
           topLeft: Radius.circular(100),
           bottomRight: Radius.circular(100),
         ),
         // border: Border.all(
         //   width: 0.5,
         //   color: Colors.white,
         //   style: BorderStyle.solid,
         // ),
       ),
       child: Row(
         children: [
           Expanded(
             flex:(scheduleValue == "Delivery")?3:2,
             child: SizedBox(

               height: 30,
               child: ElevatedButton(
                   onPressed: () {
                     setState(() {
                       scheduleValue = "Delivery";
                       widget.onChanged("Delivery");
                     });

                   },
                   style: ButtonStyle(
                     backgroundColor: (scheduleValue == "Delivery")?MaterialStateProperty.all<Color>(Colors.amber,):MaterialStateProperty.all<Color>(Colors.transparent,),
                     //MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                     foregroundColor: (scheduleValue == "Delivery")?MaterialStateProperty.all<Color>(Colors.white):MaterialStateProperty.all<Color>(Colors.black),
                     shape: MaterialStateProperty.all(
                         RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(100.0),
                             side: const BorderSide(
                                 color: Colors.transparent, width: 1.5)
                         )
                     ),
                       elevation:MaterialStateProperty.all(0)

                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.delivery_dining,color: (scheduleValue == "Delivery")?Colors.white:Colors.black,size: 15,),
                       SizedBox(width: 10,),
                       MyText(
                         "Delivery",style: TextStyle(fontFamily: "Raleway-Regular"),
                         // getTranslated(context, "bringItOn")!,
                         // style: TextStyle(
                         //     fontFamily: "${lng?.titleHeader1.textFamily}",
                         //     color: Color(int.parse(cartPage.body.bringItButton.color)),
                         //     fontSize: lng?.titleHeader1.size.toDouble()
                         // ),

                       ),
                     ],
                   )
                 // fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),)


               ),
             ),
           ),
           Expanded(
             flex:(scheduleValue == "Pickup")?3:2,
             child: SizedBox(

               height: 30,
               child: ElevatedButton(
                   onPressed: () {
                     setState(() {
                       scheduleValue = "Pickup";
                       widget.onChanged("Pickup");
                     });
                   },
                   style: ButtonStyle(
                     backgroundColor: (scheduleValue == "Pickup")?MaterialStateProperty.all<Color>(Colors.amber,):MaterialStateProperty.all<Color>(Colors.transparent,),
                     //MaterialStateProperty.all<Color>(Color(0xFF84ab24)),
                       foregroundColor: (scheduleValue == "Pickup")?MaterialStateProperty.all<Color>(Colors.white):MaterialStateProperty.all<Color>(Colors.black),
                       shape: MaterialStateProperty.all(
                         RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(100.0),
                             side: const BorderSide(
                                 color: Colors.transparent, width: 1.5)
                         )
                     ),
                      elevation:MaterialStateProperty.all(0)


                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.shopping_bag_outlined,color: (scheduleValue == "Pickup")?Colors.white:Colors.black,size: 15,),
                       SizedBox(width: 10,),

                       MyText(
                         "Pickup",style: TextStyle(fontFamily: "Raleway-Regular"),
                         // getTranslated(context, "bringItOn")!,
                         // style: TextStyle(
                         //     fontFamily: "${lng?.titleHeader1.textFamily}",
                         //     color: Color(int.parse(cartPage.body.bringItButton.color)),
                         //     fontSize: lng?.titleHeader1.size.toDouble()
                         // ),

                       ),
                     ],
                   )
                 // fontSize: double.parse(getTranslated(context, "fontFamilyButtonsSize")!)),)


               ),
             ),
           ),
         ],
       ),
     );
  }
}




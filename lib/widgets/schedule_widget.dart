import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:operation_falafel/widgets/delivery_pickup_custom_switch_widget.dart';
import 'package:operation_falafel/widgets/schedule_delivery_widget.dart';
import 'package:operation_falafel/widgets/schedule_pickup_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../data/my_text.dart';

class ScheduleWidget extends StatefulWidget{
  const ScheduleWidget({super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {

  void _onSwitchChanged(String widgetValue){
    setState(() {
      _scheduleWidget = widgetValue;
      print("Widget:${_scheduleWidget}");
    });

  }

  String _scheduleWidget = "Delivery";



  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(17.0),
     child: Stack(
       children: [
         if(_scheduleWidget=="Delivery")
           ScheduleDeliveryWidget()
         else
           SchedulePickUpWidget(),


         SizedBox(
           width: 280,
           child:  Center(
               child: DeliveryPickupCustomSwitchWidget(
                      onChanged:(value){_onSwitchChanged(value);},
               )),
         ),

       ],
     ),
   );
  }



}
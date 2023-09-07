import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../data/my_text.dart';

class ScheduleDeliveryWidget extends StatefulWidget{
  @override
  State<ScheduleDeliveryWidget> createState() => _ScheduleDeliveryWidgetState();
}

class _ScheduleDeliveryWidgetState extends State<ScheduleDeliveryWidget> {
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(top:15.0),
       child: InputDecorator(

         decoration: InputDecoration(
           // labelText: 'XP',
           label: SizedBox(width: 370,),
           contentPadding: EdgeInsets.only(top: 5, bottom: 5),
           enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(10.0),
               borderSide: BorderSide(
                   color: Colors.amber, width: 1.5, style: BorderStyle.solid)
           ),
         ),
         child: Column(
           children: [
            const SizedBox(height: 10,),

             ListTile(
               // tileColor: Colors.green,
               visualDensity: VisualDensity(vertical: -4),
               // dense: true,
               title: MyText(
                   "Select Date & Time",
                   style:TextStyle(
                       color: Colors.amber,
                       fontFamily: "Raleway-Regular"
                   )

                 // TextStyle(color: Color(int.parse(
                 //     widget.cartPage!.body.paymentMethods.oFGifts!.title!
                 //         .color)),
                 //     fontFamily: widget.lng!.header3.textFamily,
                 //     fontSize: widget.lng!.header3.size.toDouble()),
               ),
               subtitle: MyText(
                   "Delivery fee (4.3 km):",
                   style:TextStyle(color: Colors.white30,
                       fontFamily: "Raleway-Regular")
                 // style: TextStyle(
                 //     color: Color(int.parse(widget.cartPage!.body.paymentMethods.oFGifts!.subTitle!.color)),
                 //     fontFamily: widget.lng!.header2.textFamily,
                 //     fontSize: widget.lng!.header2.size.toDouble()),
               ),

             ),


             ListTile(
               // tileColor: Colors.green,
               visualDensity: VisualDensity(vertical: -4),
               // dense: true,
               title: MyText(
                 "Selected Time",
                 style: TextStyle(color:Colors.amber,
                     fontFamily: "Raleway-Regular"),
                 // style:
                 // TextStyle(color: Color(int.parse(
                 //     widget.cartPage!.body.paymentMethods.oFGifts!.title!
                 //         .color)),
                 //     fontFamily: widget.lng!.header3.textFamily,
                 //     fontSize: widget.lng!.header3.size.toDouble()),
               ),
               subtitle: MyText(
                 "${timeToAMPMFormat(_time)}",
                 style: TextStyle(color:Colors.white54,
                     fontFamily: "Raleway-Regular"),
                 // style: TextStyle(
                 //     color: Color(int.parse(widget.cartPage!.body.paymentMethods.oFGifts!.subTitle!.color)),
                 //     fontFamily: widget.lng!.header2.textFamily,
                 //     fontSize: widget.lng!.header2.size.toDouble()),
               ),
               trailing: TextButton(
                 onPressed: () {
                   Navigator.of(context).push(
                     showPicker(
                       // barrierColor: Colors.black,

                       // buttonStyle: ButtonStyle(textStyle:MaterialStateProperty.all(TextStyle(fontFamily: "Raleway-Regular",color: Colors.green)) ),
                       // cancelButtonStyle: ButtonStyle(textStyle:MaterialStateProperty.all(TextStyle(color: Colors.amber)) ),
                       // : ButtonStyle(textStyle:MaterialStateProperty.all(TextStyle(color: Colors.amber)) ),
                       themeData: ThemeData(
                         // dialogBackgroundColor: Colors.black,
                         // scaffoldBackgroundColor: Colors.black,
                         // backgroundColor: Colors.black,
                         // bannerTheme: MaterialBannerThemeData(backgroundColor: Colors.black),
                         colorScheme: ColorScheme.dark(),


                       ),
                       accentColor: Colors.amber,
                       barrierDismissible: false,
                       blurredBackground: true,
                       iosStylePicker: true,
                       cancelStyle: TextStyle(color: Colors.amber,fontFamily: "Raleway-Regular"),
                       okStyle: TextStyle(color: Colors.amber,fontFamily: "Raleway-Regular"),
                       context: context,
                       value: _time,

                       sunrise: TimeOfDay(hour: 6, minute: 0,), // optional
                       sunset: TimeOfDay(hour: 18, minute: 0), // optional
                       duskSpanInMinutes: 120, // optional
                       onChange: onTimeChanged,
                     ),
                   );
                 },
                 child: Text(
                   "Open time picker",
                   style: TextStyle(color: Colors.amber.shade100, fontWeight: FontWeight.bold,  fontFamily: "Raleway-Regular", fontSize: 13),
                 ),
               ),

             ),

             SfDateRangePicker(

               navigationMode: DateRangePickerNavigationMode.snap,
               allowViewNavigation: true,
               monthViewSettings:const DateRangePickerMonthViewSettings(

                   weekNumberStyle: DateRangePickerWeekNumberStyle(textStyle: TextStyle(color:Colors.white,backgroundColor: Colors.white, fontFamily: "Raleway-Regular")),
                   viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: TextStyle(color:Colors.white,fontFamily: "Raleway-Regular"))

               ) ,
               showActionButtons: false,

               // onSubmit: (value){
               //
               //   DateTime tempValue =value as DateTime;
               //   if(tempValue!=null){
               //     _selectedDate = DateFormat('dd/MM/yyyy').format(tempValue).toString();
               //     // showDatePicker = false;
               //     print("DateTime");
               //
               //
               //
               //     // Navigator.pop(context);
               //   }},
               // onCancel: (){
               //   // Navigator.pop(context);
               //   },
               backgroundColor: Colors.transparent,
               todayHighlightColor: Colors.amber,
               startRangeSelectionColor: Colors.amber,
               endRangeSelectionColor: Colors.amber,
               rangeSelectionColor: Colors.amber,
               selectionColor: Colors.amber,
               minDate: DateTime.now().subtract(const Duration(days: 0)),
               // maxDate: DateTime.now().add(Duration(days: 1)).subtract(const Duration(days: 0)),
               headerStyle: DateRangePickerHeaderStyle(textStyle: TextStyle(color:Colors.white, fontFamily: "Raleway-Regular"),backgroundColor: Colors.transparent,textAlign: TextAlign.center),
               monthCellStyle: DateRangePickerMonthCellStyle(textStyle: TextStyle(color:Colors.white, fontFamily: "Raleway-Regular"),blackoutDateTextStyle: TextStyle(color:Colors.white, fontFamily: "Raleway-Regular"), todayTextStyle:TextStyle(color:Colors.white, fontFamily: "Raleway-Regular"),leadingDatesTextStyle: TextStyle(color:Colors.white, fontFamily: "Raleway-Regular"),weekendTextStyle:  TextStyle(color:Colors.grey, fontFamily: "Raleway-Regular"),disabledDatesTextStyle: TextStyle(color:Colors.grey, fontFamily: "Raleway-Regular"),trailingDatesTextStyle: TextStyle(color:Colors.white, fontFamily: "Raleway-Regular"),specialDatesTextStyle: TextStyle(color:Colors.white,fontFamily: "Raleway-Regular"),),
               yearCellStyle: DateRangePickerYearCellStyle(textStyle: TextStyle(color:Colors.white,fontFamily: "Raleway-Regular"),disabledDatesTextStyle: TextStyle(color:Colors.white,fontFamily: "Raleway-Regular"), todayTextStyle:TextStyle(color:Colors.white,fontFamily: "Raleway-Regular"),leadingDatesTextStyle: TextStyle(color:Colors.white,fontFamily: "Raleway-Regular"), ),
               selectionTextStyle: TextStyle(color:Colors.white,fontFamily: "Raleway-Regular"),
               rangeTextStyle: TextStyle(color:Colors.white,fontFamily: "Raleway-Regular"),
               // onSelectionChanged: _onSelectionChanged,
               onSelectionChanged: _onSelectionChanged,
               showTodayButton: false,

               showNavigationArrow: true,
               selectionMode: DateRangePickerSelectionMode.single,

               // initialDisplayDate:(_selectedDate!='')?DateFormat('dd/MM/yyyy').parse(_selectedDate):DateTime.now().subtract(const Duration(days: 0)),
               // initialSelectedDate: (_selectedDate!='')?DateFormat('dd/MM/yyyy').parse(_selectedDate):DateTime.now().subtract(const Duration(days: 0)),//(_selectedDate!='')?DateFormat('dd/MM/yyyy').parse(_selectedDate):
               // initialSelectedRange: PickerDateRange(DateTime.now().subtract(const Duration(days: 4)), DateTime.now().add(const Duration(days: 3))),
             ),


           ],
         ),
       ),
     );
  }


  Time _time = Time(hour: DateTime.now().hour, minute: DateTime.now().minute);

  onTimeChanged(Time value){
    setState(() {
      _time = value;
    });
  }
  String timeToAMPMFormat(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    final format = DateFormat.jm(); // Use "jm" for AM/PM format
    final formattedTime = format.format(dateTime);

    // Determine AM or PM based on the hour
    final amOrPm = time.hour < 12 ? 'AM' : 'PM';

    return '$formattedTime';
  }

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args, ) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        print("Date range");
        // showDatePicker = false;

      }
      else if (args.value is DateTime) {
        if(_selectedDate == DateFormat('dd/MM/yyyy').format(args.value).toString()){
          _selectedDate ='';
          print("DateTime: ${_selectedDate}");
        }else{
          _selectedDate = DateFormat('dd/MM/yyyy').format(args.value).toString();
          // showDatePicker = false;
          print("DateTime: ${_selectedDate}");
          // birthDateController.text = _selectedDate;
        }

      }
      else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
        // birthDateController.text = _selectedDate;
        // print("List DateTime");
        // showDatePicker = false;
      }
      else {
        _rangeCount = args.value.length.toString();
        _selectedDate ='';
        // birthDateController.text = _selectedDate;
        // print("default");
        // showDatePicker = false;
      }
    });
  }
}
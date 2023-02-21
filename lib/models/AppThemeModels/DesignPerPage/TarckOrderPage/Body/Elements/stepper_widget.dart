// To parse this JSON data, do
//
//     final stepperWidget = stepperWidgetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StepperWidget stepperWidgetFromJson(String str) => StepperWidget.fromJson(json.decode(str));

String stepperWidgetToJson(StepperWidget data) => json.encode(data.toJson());

class StepperWidget {
  StepperWidget({
    required this.activeColor,
  });

  String activeColor;

  factory StepperWidget.fromJson(Map<String, dynamic> json) => StepperWidget(
    activeColor: json["ActiveColor"],
  );

  Map<String, dynamic> toJson() => {
    "ActiveColor": activeColor,
  };
}

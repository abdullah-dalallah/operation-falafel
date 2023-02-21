// To parse this JSON data, do
//
//     final body = bodyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import '../../CommonElements/Elements/page_title.dart';
import 'Elements/DropDownWidget/drop_down_widget.dart';

import 'Elements/reach_out_widget.dart';
import 'Elements/status_image.dart';
import 'Elements/stepper_widget.dart';

TrackOrderPageBody bodyFromJson(String str) => TrackOrderPageBody.fromJson(json.decode(str));

String bodyToJson(TrackOrderPageBody data) => json.encode(data.toJson());

class TrackOrderPageBody {
  TrackOrderPageBody({
    required this.pageTile,
    required this.dropDownWidget,
    required this.statusImage,
    required this.stepperWidget,
    required this.callUsWidget,
    required this.emailUsWidget,
  });

  PageTile pageTile;
  DropDownWidget dropDownWidget;
  StatusImage statusImage;
  StepperWidget stepperWidget;
  ReachOutWidget callUsWidget;
  ReachOutWidget emailUsWidget;

  factory TrackOrderPageBody.fromJson(Map<String, dynamic> json) => TrackOrderPageBody(
    pageTile: PageTile.fromJson(json["PageTile"]),
    dropDownWidget: DropDownWidget.fromJson(json["DropDownWidget"]),
    statusImage: StatusImage.fromJson(json["StatusImage"]),
    stepperWidget: StepperWidget.fromJson(json["StepperWidget"]),
    callUsWidget: ReachOutWidget.fromJson(json["CallUsWidget"]),
    emailUsWidget: ReachOutWidget.fromJson(json["EmailUsWidget"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTile": pageTile.toJson(),
    "DropDownWidget": dropDownWidget.toJson(),
    "StatusImage": statusImage.toJson(),
    "StepperWidget": stepperWidget.toJson(),
    "CallUsWidget": callUsWidget.toJson(),
    "EmailUsWidget": emailUsWidget.toJson(),
  };
}













// To parse this JSON data, do
//
//     final tarckOrderPage = tarckOrderPageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'Appbar/track_order_page_appbar.dart';
import 'Body/track_order_apge_body.dart';

TrackOrderPage tarckOrderPageFromJson(String str) => TrackOrderPage.fromJson(json.decode(str));

String tarckOrderPageToJson(TrackOrderPage data) => json.encode(data.toJson());

class TrackOrderPage {
  TrackOrderPage({
    required this.appBar,
    required this.body,
  });

  TrackOrderPageAppBar appBar;
  TrackOrderPageBody body;

  factory TrackOrderPage.fromJson(Map<String, dynamic> json) => TrackOrderPage(
    appBar: TrackOrderPageAppBar.fromJson(json["AppBar"]),
    body: TrackOrderPageBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



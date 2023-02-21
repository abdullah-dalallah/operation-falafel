// To parse this JSON data, do
//
//     final tarckOrderPage = tarckOrderPageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'Appbar/track_order_page_appbar.dart';
import 'Body/track_order_apge_body.dart';

TarckOrderPage tarckOrderPageFromJson(String str) => TarckOrderPage.fromJson(json.decode(str));

String tarckOrderPageToJson(TarckOrderPage data) => json.encode(data.toJson());

class TarckOrderPage {
  TarckOrderPage({
    required this.appBar,
    required this.body,
  });

  TrackOrderPageAppBar appBar;
  TrackOrderPageBody body;

  factory TarckOrderPage.fromJson(Map<String, dynamic> json) => TarckOrderPage(
    appBar: TrackOrderPageAppBar.fromJson(json["AppBar"]),
    body: TrackOrderPageBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}



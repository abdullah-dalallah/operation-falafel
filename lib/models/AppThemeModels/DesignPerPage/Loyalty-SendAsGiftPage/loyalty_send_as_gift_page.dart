// To parse this JSON data, do
//
//     final loyaltySendAsGiftPage = loyaltySendAsGiftPageFromJson(jsonString);

import 'dart:convert';

import 'Appbar/loyalty_send_as_gift_page.dart';
import 'Body/loyalty_send_as_gift_body.dart';

LoyaltySendAsGiftPage loyaltySendAsGiftPageFromJson(String str) => LoyaltySendAsGiftPage.fromJson(json.decode(str));

String loyaltySendAsGiftPageToJson(LoyaltySendAsGiftPage data) => json.encode(data.toJson());

class LoyaltySendAsGiftPage {
  LoyaltySendAsGiftPage({
    required this.appBar,
    required this.body,
  });

  LoyaltySendAsGiftAppBar appBar;
  LoyaltySendAsGiftBody body;

  factory LoyaltySendAsGiftPage.fromJson(Map<String, dynamic> json) => LoyaltySendAsGiftPage(
    appBar: LoyaltySendAsGiftAppBar.fromJson(json["AppBar"]),
    body: LoyaltySendAsGiftBody.fromJson(json["Body"]),
  );

  Map<String, dynamic> toJson() => {
    "AppBar": appBar.toJson(),
    "Body": body.toJson(),
  };
}


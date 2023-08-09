// To parse this JSON data, do
//
//     final requestSubmitPaymentCardInformationResponse = requestSubmitPaymentCardInformationResponseFromJson(jsonString);

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'request_submit_payment_card_information_response.g.dart';

RequestSubmitPaymentCardInformationResponse requestSubmitPaymentCardInformationResponseFromJson(String str) => RequestSubmitPaymentCardInformationResponse.fromJson(json.decode(str));

String requestSubmitPaymentCardInformationResponseToJson(RequestSubmitPaymentCardInformationResponse data) => json.encode(data.toJson());
@JsonSerializable()
class RequestSubmitPaymentCardInformationResponse {
  String? id;
  Links? links;
  String? reference;
  PaymentMethod? paymentMethod;
  String? state;
  Amount? amount;
  DateTime? updateDateTime;
  String? outletId;
  String? orderReference;
  String? authenticationCode;
  String? originIp;
  The3Ds? the3Ds;

  RequestSubmitPaymentCardInformationResponse({
    this.id,
    this.links,
    this.reference,
    this.paymentMethod,
    this.state,
    this.amount,
    this.updateDateTime,
    this.outletId,
    this.orderReference,
    this.authenticationCode,
    this.originIp,
    this.the3Ds,
  });

  factory RequestSubmitPaymentCardInformationResponse.fromJson(Map<String, dynamic> json) => RequestSubmitPaymentCardInformationResponse(
    id: json["_id"],
    links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    reference: json["reference"],
    paymentMethod: json["paymentMethod"] == null ? null : PaymentMethod.fromJson(json["paymentMethod"]),
    state: json["state"],
    amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
    updateDateTime: json["updateDateTime"] == null ? null : DateTime.parse(json["updateDateTime"]),
    outletId: json["outletId"],
    orderReference: json["orderReference"],
    authenticationCode: json["authenticationCode"],
    originIp: json["originIp"],
    the3Ds: json["3ds"] == null ? null : The3Ds.fromJson(json["3ds"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "_links": links?.toJson(),
    "reference": reference,
    "paymentMethod": paymentMethod?.toJson(),
    "state": state,
    "amount": amount?.toJson(),
    "updateDateTime": updateDateTime?.toIso8601String(),
    "outletId": outletId,
    "orderReference": orderReference,
    "authenticationCode": authenticationCode,
    "originIp": originIp,
    "3ds": the3Ds?.toJson(),
  };
}

class Amount {
  String? currencyCode;
  int? value;

  Amount({
    this.currencyCode,
    this.value,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    currencyCode: json["currencyCode"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "currencyCode": currencyCode,
    "value": value,
  };
}

class Links {
  Cnp3Ds? self;
  Cnp3Ds? cnp3Ds;
  List<Cury>? curies;

  Links({
    this.self,
    this.cnp3Ds,
    this.curies,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? null : Cnp3Ds.fromJson(json["self"]),
    cnp3Ds: json["cnp:3ds"] == null ? null : Cnp3Ds.fromJson(json["cnp:3ds"]),
    curies: json["curies"] == null ? [] : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self?.toJson(),
    "cnp:3ds": cnp3Ds?.toJson(),
    "curies": curies == null ? [] : List<dynamic>.from(curies!.map((x) => x.toJson())),
  };
}

class Cnp3Ds {
  String? href;

  Cnp3Ds({
    this.href,
  });

  factory Cnp3Ds.fromJson(Map<String, dynamic> json) => Cnp3Ds(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Cury {
  String? name;
  String? href;
  bool? templated;

  Cury({
    this.name,
    this.href,
    this.templated,
  });

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: json["name"],
    href: json["href"],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "href": href,
    "templated": templated,
  };
}

class PaymentMethod {
  String? expiry;
  String? cardholderName;
  String? name;
  String? cardType;
  String? cardCategory;
  String? issuingCountry;
  String? pan;
  String? cvv;

  PaymentMethod({
    this.expiry,
    this.cardholderName,
    this.name,
    this.cardType,
    this.cardCategory,
    this.issuingCountry,
    this.pan,
    this.cvv,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
    expiry: json["expiry"],
    cardholderName: json["cardholderName"],
    name: json["name"],
    cardType: json["cardType"],
    cardCategory: json["cardCategory"],
    issuingCountry: json["issuingCountry"],
    pan: json["pan"],
    cvv: json["cvv"],
  );

  Map<String, dynamic> toJson() => {
    "expiry": expiry,
    "cardholderName": cardholderName,
    "name": name,
    "cardType": cardType,
    "cardCategory": cardCategory,
    "issuingCountry": issuingCountry,
    "pan": pan,
    "cvv": cvv,
  };
}

class The3Ds {
  String? acsUrl;
  String? acsPaReq;
  String? acsMd;
  String? summaryText;

  The3Ds({
    this.acsUrl,
    this.acsPaReq,
    this.acsMd,
    this.summaryText,
  });

  factory The3Ds.fromJson(Map<String, dynamic> json) => The3Ds(
    acsUrl: json["acsUrl"],
    acsPaReq: json["acsPaReq"],
    acsMd: json["acsMd"],
    summaryText: json["summaryText"],
  );

  Map<String, dynamic> toJson() => {
    "acsUrl": acsUrl,
    "acsPaReq": acsPaReq,
    "acsMd": acsMd,
    "summaryText": summaryText,
  };
}

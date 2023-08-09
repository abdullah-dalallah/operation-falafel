// To parse this JSON data, do
//
//     final requestCreateOrderResponse = requestCreateOrderResponseFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'request_create_order_response.g.dart';

RequestCreateOrderResponse requestCreateOrderResponseFromJson(String str) => RequestCreateOrderResponse.fromJson(json.decode(str));

String requestCreateOrderResponseToJson(RequestCreateOrderResponse data) => json.encode(data.toJson());

@JsonSerializable()
class RequestCreateOrderResponse {
  String? id;
  RequestCreateOrderResponseLinks? links;
  String? action;
  Amount? amount;
  String? language;
  MerchantAttributes? merchantAttributes;
  String? emailAddress;
  String? reference;
  String? outletId;
  DateTime? createDateTime;
  PaymentMethods? paymentMethods;
  String? referrer;
  String? formattedAmount;
  FormattedOrderSummary? formattedOrderSummary;
  Embedded? embedded;

  RequestCreateOrderResponse({
    this.id,
    this.links,
    this.action,
    this.amount,
    this.language,
    this.merchantAttributes,
    this.emailAddress,
    this.reference,
    this.outletId,
    this.createDateTime,
    this.paymentMethods,
    this.referrer,
    this.formattedAmount,
    this.formattedOrderSummary,
    this.embedded,
  });

  factory RequestCreateOrderResponse.fromJson(Map<String, dynamic> json) => RequestCreateOrderResponse(
    id: json["_id"],
    links: json["_links"] == null ? null : RequestCreateOrderResponseLinks.fromJson(json["_links"]),
    action: json["action"],
    amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
    language: json["language"],
    merchantAttributes: json["merchantAttributes"] == null ? null : MerchantAttributes.fromJson(json["merchantAttributes"]),
    emailAddress: json["emailAddress"],
    reference: json["reference"],
    outletId: json["outletId"],
    createDateTime: json["createDateTime"] == null ? null : DateTime.parse(json["createDateTime"]),
    paymentMethods: json["paymentMethods"] == null ? null : PaymentMethods.fromJson(json["paymentMethods"]),
    referrer: json["referrer"],
    formattedAmount: json["formattedAmount"],
    formattedOrderSummary: json["formattedOrderSummary"] == null ? null : FormattedOrderSummary.fromJson(json["formattedOrderSummary"]),
    embedded: json["_embedded"] == null ? null : Embedded.fromJson(json["_embedded"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "_links": links?.toJson(),
    "action": action,
    "amount": amount?.toJson(),
    "language": language,
    "merchantAttributes": merchantAttributes?.toJson(),
    "emailAddress": emailAddress,
    "reference": reference,
    "outletId": outletId,
    "createDateTime": createDateTime?.toIso8601String(),
    "paymentMethods": paymentMethods?.toJson(),
    "referrer": referrer,
    "formattedAmount": formattedAmount,
    "formattedOrderSummary": formattedOrderSummary?.toJson(),
    "_embedded": embedded?.toJson(),
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

class Embedded {
  List<Payment>? payment;

  Embedded({
    this.payment,
  });

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
    payment: json["payment"] == null ? [] : List<Payment>.from(json["payment"]!.map((x) => Payment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "payment": payment == null ? [] : List<dynamic>.from(payment!.map((x) => x.toJson())),
  };
}

class Payment {
  String? id;
  PaymentLinks? links;
  String? state;
  Amount? amount;
  DateTime? updateDateTime;
  String? outletId;
  String? orderReference;

  Payment({
    this.id,
    this.links,
    this.state,
    this.amount,
    this.updateDateTime,
    this.outletId,
    this.orderReference,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["_id"],
    links: json["_links"] == null ? null : PaymentLinks.fromJson(json["_links"]),
    state: json["state"],
    amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
    updateDateTime: json["updateDateTime"] == null ? null : DateTime.parse(json["updateDateTime"]),
    outletId: json["outletId"],
    orderReference: json["orderReference"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "_links": links?.toJson(),
    "state": state,
    "amount": amount?.toJson(),
    "updateDateTime": updateDateTime?.toIso8601String(),
    "outletId": outletId,
    "orderReference": orderReference,
  };
}

class PaymentLinks {
  CnpPaymentLink? paymentApplePay;
  CnpPaymentLink? self;
  CnpPaymentLink? paymentCard;
  CnpPaymentLink? paymentSamsungPay;
  CnpPaymentLink? paymentSavedCard;
  List<Cury>? curies;

  PaymentLinks({
    this.paymentApplePay,
    this.self,
    this.paymentCard,
    this.paymentSamsungPay,
    this.paymentSavedCard,
    this.curies,
  });

  factory PaymentLinks.fromJson(Map<String, dynamic> json) => PaymentLinks(
    paymentApplePay: json["payment:apple_pay"] == null ? null : CnpPaymentLink.fromJson(json["payment:apple_pay"]),
    self: json["self"] == null ? null : CnpPaymentLink.fromJson(json["self"]),
    paymentCard: json["payment:card"] == null ? null : CnpPaymentLink.fromJson(json["payment:card"]),
    paymentSamsungPay: json["payment:samsung_pay"] == null ? null : CnpPaymentLink.fromJson(json["payment:samsung_pay"]),
    paymentSavedCard: json["payment:saved-card"] == null ? null : CnpPaymentLink.fromJson(json["payment:saved-card"]),
    curies: json["curies"] == null ? [] : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "payment:apple_pay": paymentApplePay?.toJson(),
    "self": self?.toJson(),
    "payment:card": paymentCard?.toJson(),
    "payment:samsung_pay": paymentSamsungPay?.toJson(),
    "payment:saved-card": paymentSavedCard?.toJson(),
    "curies": curies == null ? [] : List<dynamic>.from(curies!.map((x) => x.toJson())),
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

class CnpPaymentLink {
  String? href;

  CnpPaymentLink({
    this.href,
  });

  factory CnpPaymentLink.fromJson(Map<String, dynamic> json) => CnpPaymentLink(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class FormattedOrderSummary {
  FormattedOrderSummary();

  factory FormattedOrderSummary.fromJson(Map<String, dynamic> json) => FormattedOrderSummary(
  );

  Map<String, dynamic> toJson() => {
  };
}

class RequestCreateOrderResponseLinks {
  CnpPaymentLink? cnpPaymentLink;
  CnpPaymentLink? paymentAuthorization;
  CnpPaymentLink? self;
  CnpPaymentLink? tenantBrand;
  CnpPaymentLink? payment;
  CnpPaymentLink? merchantBrand;

  RequestCreateOrderResponseLinks({
    this.cnpPaymentLink,
    this.paymentAuthorization,
    this.self,
    this.tenantBrand,
    this.payment,
    this.merchantBrand,
  });

  factory RequestCreateOrderResponseLinks.fromJson(Map<String, dynamic> json) => RequestCreateOrderResponseLinks(
    cnpPaymentLink: json["cnp:payment-link"] == null ? null : CnpPaymentLink.fromJson(json["cnp:payment-link"]),
    paymentAuthorization: json["payment-authorization"] == null ? null : CnpPaymentLink.fromJson(json["payment-authorization"]),
    self: json["self"] == null ? null : CnpPaymentLink.fromJson(json["self"]),
    tenantBrand: json["tenant-brand"] == null ? null : CnpPaymentLink.fromJson(json["tenant-brand"]),
    payment: json["payment"] == null ? null : CnpPaymentLink.fromJson(json["payment"]),
    merchantBrand: json["merchant-brand"] == null ? null : CnpPaymentLink.fromJson(json["merchant-brand"]),
  );

  Map<String, dynamic> toJson() => {
    "cnp:payment-link": cnpPaymentLink?.toJson(),
    "payment-authorization": paymentAuthorization?.toJson(),
    "self": self?.toJson(),
    "tenant-brand": tenantBrand?.toJson(),
    "payment": payment?.toJson(),
    "merchant-brand": merchantBrand?.toJson(),
  };
}

class MerchantAttributes {
  String? redirectUrl;

  MerchantAttributes({
    this.redirectUrl,
  });

  factory MerchantAttributes.fromJson(Map<String, dynamic> json) => MerchantAttributes(
    redirectUrl: json["redirectUrl"],
  );

  Map<String, dynamic> toJson() => {
    "redirectUrl": redirectUrl,
  };
}

class PaymentMethods {
  List<String>? card;
  List<String>? wallet;

  PaymentMethods({
    this.card,
    this.wallet,
  });

  factory PaymentMethods.fromJson(Map<String, dynamic> json) => PaymentMethods(
    card: json["card"] == null ? [] : List<String>.from(json["card"]!.map((x) => x)),
    wallet: json["wallet"] == null ? [] : List<String>.from(json["wallet"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "card": card == null ? [] : List<dynamic>.from(card!.map((x) => x)),
    "wallet": wallet == null ? [] : List<dynamic>.from(wallet!.map((x) => x)),
  };
}
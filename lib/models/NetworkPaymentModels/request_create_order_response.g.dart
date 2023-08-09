// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCreateOrderResponse _$RequestCreateOrderResponseFromJson(
        Map<String, dynamic> json) =>
    RequestCreateOrderResponse(
      id: json['id'] as String?,
      links: json['links'] == null
          ? null
          : RequestCreateOrderResponseLinks.fromJson(
              json['links'] as Map<String, dynamic>),
      action: json['action'] as String?,
      amount: json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      language: json['language'] as String?,
      merchantAttributes: json['merchantAttributes'] == null
          ? null
          : MerchantAttributes.fromJson(
              json['merchantAttributes'] as Map<String, dynamic>),
      emailAddress: json['emailAddress'] as String?,
      reference: json['reference'] as String?,
      outletId: json['outletId'] as String?,
      createDateTime: json['createDateTime'] == null
          ? null
          : DateTime.parse(json['createDateTime'] as String),
      paymentMethods: json['paymentMethods'] == null
          ? null
          : PaymentMethods.fromJson(
              json['paymentMethods'] as Map<String, dynamic>),
      referrer: json['referrer'] as String?,
      formattedAmount: json['formattedAmount'] as String?,
      formattedOrderSummary: json['formattedOrderSummary'] == null
          ? null
          : FormattedOrderSummary.fromJson(
              json['formattedOrderSummary'] as Map<String, dynamic>),
      embedded: json['embedded'] == null
          ? null
          : Embedded.fromJson(json['embedded'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestCreateOrderResponseToJson(
        RequestCreateOrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'links': instance.links,
      'action': instance.action,
      'amount': instance.amount,
      'language': instance.language,
      'merchantAttributes': instance.merchantAttributes,
      'emailAddress': instance.emailAddress,
      'reference': instance.reference,
      'outletId': instance.outletId,
      'createDateTime': instance.createDateTime?.toIso8601String(),
      'paymentMethods': instance.paymentMethods,
      'referrer': instance.referrer,
      'formattedAmount': instance.formattedAmount,
      'formattedOrderSummary': instance.formattedOrderSummary,
      'embedded': instance.embedded,
    };

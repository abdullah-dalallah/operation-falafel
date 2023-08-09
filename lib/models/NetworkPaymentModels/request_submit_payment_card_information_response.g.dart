// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_submit_payment_card_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestSubmitPaymentCardInformationResponse
    _$RequestSubmitPaymentCardInformationResponseFromJson(
            Map<String, dynamic> json) =>
        RequestSubmitPaymentCardInformationResponse(
          id: json['id'] as String?,
          links: json['links'] == null
              ? null
              : Links.fromJson(json['links'] as Map<String, dynamic>),
          reference: json['reference'] as String?,
          paymentMethod: json['paymentMethod'] == null
              ? null
              : PaymentMethod.fromJson(
                  json['paymentMethod'] as Map<String, dynamic>),
          state: json['state'] as String?,
          amount: json['amount'] == null
              ? null
              : Amount.fromJson(json['amount'] as Map<String, dynamic>),
          updateDateTime: json['updateDateTime'] == null
              ? null
              : DateTime.parse(json['updateDateTime'] as String),
          outletId: json['outletId'] as String?,
          orderReference: json['orderReference'] as String?,
          authenticationCode: json['authenticationCode'] as String?,
          originIp: json['originIp'] as String?,
          the3Ds: json['the3Ds'] == null
              ? null
              : The3Ds.fromJson(json['the3Ds'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RequestSubmitPaymentCardInformationResponseToJson(
        RequestSubmitPaymentCardInformationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'links': instance.links,
      'reference': instance.reference,
      'paymentMethod': instance.paymentMethod,
      'state': instance.state,
      'amount': instance.amount,
      'updateDateTime': instance.updateDateTime?.toIso8601String(),
      'outletId': instance.outletId,
      'orderReference': instance.orderReference,
      'authenticationCode': instance.authenticationCode,
      'originIp': instance.originIp,
      'the3Ds': instance.the3Ds,
    };

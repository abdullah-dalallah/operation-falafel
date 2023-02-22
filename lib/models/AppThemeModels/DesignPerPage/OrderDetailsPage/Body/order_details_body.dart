// To parse this JSON data, do
//
//     final orderDetailsBody = orderDetailsBodyFromJson(jsonString);

import 'dart:convert';

import '../../CommonElements/Elements/title_style.dart';
import 'Elements/OrderTile/order_tile.dart';
import 'Elements/order_options.dart';

OrderDetailsBody orderDetailsBodyFromJson(String str) => OrderDetailsBody.fromJson(json.decode(str));

String orderDetailsBodyToJson(OrderDetailsBody data) => json.encode(data.toJson());

class OrderDetailsBody {
  OrderDetailsBody({
    required this.pageTitle,
    required this.orderTile,
    required this.orderId,
    required this.addressHeader,
    required this.orderSummaryHeader,
    required this.orderOptions,
    required this.paymentMethodHeader,
    required this.paymentMethod,
    required this.subTotalHeader,
    required this.oFLoyaltyHeader,
    required this.serviceChargeHeader,
    required this.totalHeader,
  });

  TitleStyle pageTitle;
  OrderTile orderTile;
  TitleStyle orderId;
  TitleStyle addressHeader;
  TitleStyle orderSummaryHeader;
  OrderOptions orderOptions;
  TitleStyle paymentMethodHeader;
  TitleStyle paymentMethod;
  TitleStyle subTotalHeader;
  TitleStyle oFLoyaltyHeader;
  TitleStyle serviceChargeHeader;
  TitleStyle totalHeader;

  factory OrderDetailsBody.fromJson(Map<String, dynamic> json) => OrderDetailsBody(
    pageTitle: TitleStyle.fromJson(json["PageTitle"]),
    orderTile: OrderTile.fromJson(json["OrderTile"]),
    orderId: TitleStyle.fromJson(json["OrderID"]),
    addressHeader: TitleStyle.fromJson(json["AddressHeader"]),
    orderSummaryHeader: TitleStyle.fromJson(json["OrderSummaryHeader"]),
    orderOptions: OrderOptions.fromJson(json["OrderOptions"]),
    paymentMethodHeader: TitleStyle.fromJson(json["PaymentMethodHeader"]),
    paymentMethod: TitleStyle.fromJson(json["PaymentMethod"]),
    subTotalHeader: TitleStyle.fromJson(json["SubTotalHeader"]),
    oFLoyaltyHeader: TitleStyle.fromJson(json["O:FLoyaltyHeader"]),
    serviceChargeHeader: TitleStyle.fromJson(json["ServiceChargeHeader"]),
    totalHeader: TitleStyle.fromJson(json["TotalHeader"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTitle": pageTitle.toJson(),
    "OrderTile": orderTile.toJson(),
    "OrderID": orderId.toJson(),
    "AddressHeader": addressHeader.toJson(),
    "OrderSummaryHeader": orderSummaryHeader.toJson(),
    "OrderOptions": orderOptions.toJson(),
    "PaymentMethodHeader": paymentMethodHeader.toJson(),
    "PaymentMethod": paymentMethod.toJson(),
    "SubTotalHeader": subTotalHeader.toJson(),
    "O:FLoyaltyHeader": oFLoyaltyHeader.toJson(),
    "ServiceChargeHeader": serviceChargeHeader.toJson(),
    "TotalHeader": totalHeader.toJson(),
  };
}







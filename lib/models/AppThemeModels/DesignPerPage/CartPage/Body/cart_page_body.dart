// To parse this JSON data, do
//
//     final cartPageBody = cartPageBodyFromJson(jsonString);

import 'package:meta/meta.dart';

import 'dart:convert';

import '../../CommonElements/Elements/cart_check_box.dart';
import '../../CommonElements/Elements/title_style.dart';

import 'Elements/ItemsList/item_list.dart';
import 'Elements/PaymentMethods/payment_mothods.dart';
import 'Elements/PromoCode/promo_code.dart';
import 'Elements/SpecialInstructions/special_Instructions.dart';
import 'Elements/bring_it_button.dart';
import 'Elements/credit.dart';
import 'Elements/select_address.dart';
import 'Elements/select_payment.dart';
import 'Elements/tip.dart';
import 'Elements/total.dart';


CartPageBody cartPageBodyFromJson(String str) => CartPageBody.fromJson(json.decode(str));

String cartPageBodyToJson(CartPageBody data) => json.encode(data.toJson());

class CartPageBody {
  CartPageBody({
    required this.pageTile,
    required this.itemsList,
    required this.specialInstructions,
    required this.cutleryCheckBox,
    required this.contactlessCheckBox,
    required this.promoCode,
    required this.tip,
    required this.subTotal,
    required this.totalAfterPromoCode,
    required this.deliveryFee,
    required this.total,
    required this.credit,
    required this.selectAddress,
    required this.selectPayment,
    required this.bringItButton,
    required this.emptyCart,
    required this.orderNowButton,
    required this.paymentMethods
  });

  TitleStyle pageTile;
  ItemsList itemsList;
  SpecialInstructions specialInstructions;
  CartCheckBox cutleryCheckBox;
  CartCheckBox contactlessCheckBox;
  PromoCode promoCode;
  Tip tip;
  TitleStyle subTotal;
  TitleStyle totalAfterPromoCode;
  TitleStyle deliveryFee;
  Total total;
  Credit credit;
  SelectAddress selectAddress;
  SelectPayment selectPayment;
  BringItButton bringItButton;
  TitleStyle emptyCart;
  TitleStyle orderNowButton;
  PaymentMethods paymentMethods;
  factory CartPageBody.fromJson(Map<String, dynamic> json) => CartPageBody(
    pageTile: TitleStyle.fromJson(json["PageTile"]),
    itemsList: ItemsList.fromJson(json["ItemsList"]),
    specialInstructions: SpecialInstructions.fromJson(json["SpecialInstructions"]),
    cutleryCheckBox: CartCheckBox.fromJson(json["CutleryCheckBox"]),
    contactlessCheckBox: CartCheckBox.fromJson(json["ContactlessCheckBox"]),
    promoCode: PromoCode.fromJson(json["PromoCode"]),
    tip: Tip.fromJson(json["Tip"]),
    subTotal: TitleStyle.fromJson(json["SubTotal"]),
    totalAfterPromoCode: TitleStyle.fromJson(json["TotalAfterPromoCode"]),
    deliveryFee: TitleStyle.fromJson(json["DeliveryFee"]),
    total: Total.fromJson(json["Total"]),
    credit: Credit.fromJson(json["Credit"]),
    selectAddress: SelectAddress.fromJson(json["SelectAddress"]),
    selectPayment: SelectPayment.fromJson(json["SelectPayment"]),
    bringItButton: BringItButton.fromJson(json["BringItButton"]),
    emptyCart: TitleStyle.fromJson(json["EmptyCart"]),
    orderNowButton: TitleStyle.fromJson(json["OrderNowButton"]),
    paymentMethods: PaymentMethods.fromJson(json["PaymentMethods"]),
  );

  Map<String, dynamic> toJson() => {
    "PageTile": pageTile.toJson(),
    "ItemsList": itemsList.toJson(),
    "SpecialInstructions": specialInstructions.toJson(),
    "CutleryCheckBox": cutleryCheckBox.toJson(),
    "ContactlessCheckBox": contactlessCheckBox.toJson(),
    "PromoCode": promoCode.toJson(),
    "Tip": tip.toJson(),
    "SubTotal": subTotal.toJson(),
    "TotalAfterPromoCode": totalAfterPromoCode.toJson(),
    "DeliveryFee": deliveryFee.toJson(),
    "Total": total.toJson(),
    "Credit": credit.toJson(),
    "SelectAddress": selectAddress.toJson(),
    "SelectPayment": selectPayment.toJson(),
    "BringItButton": bringItButton.toJson(),
    "EmptyCart": emptyCart.toJson(),
    "OrderNowButton": orderNowButton.toJson(),
    "PaymentMethods":paymentMethods.toJson()
  };
}























// To parse this JSON data, do
//
//     final loyaltyPaymentSheet = loyaltyPaymentSheetFromJson(jsonString);

import 'dart:convert';

import '../CommonElements/Elements/drawer_Icon.dart';
import '../CommonElements/Elements/icon.dart';
import '../CommonElements/Elements/title_style.dart';

LoyaltyPaymentSheet loyaltyPaymentSheetFromJson(String str) => LoyaltyPaymentSheet.fromJson(json.decode(str));

String loyaltyPaymentSheetToJson(LoyaltyPaymentSheet data) => json.encode(data.toJson());

class LoyaltyPaymentSheet {
  LoyaltyPaymentSheet({
    required this.sheetTile,
    required this.sheetCloseIcon,
    required this.selectPaymentTitle,
    required this.checkBox,
  });

  TitleStyle sheetTile;
  Icon sheetCloseIcon;
  TitleStyle selectPaymentTitle;
  CheckBox checkBox;

  factory LoyaltyPaymentSheet.fromJson(Map<String, dynamic> json) => LoyaltyPaymentSheet(
    sheetTile: TitleStyle.fromJson(json["SheetTile"]),
    sheetCloseIcon: Icon.fromJson(json["SheetCloseIcon"]),
    selectPaymentTitle: TitleStyle.fromJson(json["SelectPaymentTitle"]),
    checkBox: CheckBox.fromJson(json["CheckBox"]),
  );

  Map<String, dynamic> toJson() => {
    "SheetTile": sheetTile.toJson(),
    "SheetCloseIcon": sheetCloseIcon.toJson(),
    "SelectPaymentTitle": selectPaymentTitle.toJson(),
    "CheckBox": checkBox.toJson(),
  };
}

class CheckBox {
  CheckBox({
    required this.title,
    required this.selectedImage,
  });

  TitleStyle title;
  String selectedImage;

  factory CheckBox.fromJson(Map<String, dynamic> json) => CheckBox(
    title: TitleStyle.fromJson(json["Title"]),
    selectedImage: json["SelectedImage"],
  );

  Map<String, dynamic> toJson() => {
    "Title": title.toJson(),
    "SelectedImage": selectedImage,
  };
}





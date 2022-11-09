import 'package:flutter/cupertino.dart';

class DemoCartItemProvider with ChangeNotifier{
  String itemName;
  double itemUnitPrice;
  int itemQuantity;
  List<Map> selectedOtions;
  List<Map> selectedAddon;
  double itemTotalPrice;
  DemoCartItemProvider({
  required this.itemName,
  required this.itemQuantity,
  required this.itemTotalPrice,
  required this.itemUnitPrice,
  required this.selectedAddon,
  required this.selectedOtions
  }){}

  Map<String, dynamic> toJson() {return {
    "itemName":this.itemName,
    "itemQuantity":this.itemQuantity,
    "itemTotalPrice":this.itemTotalPrice,

    "itemUnitPrice":this.itemUnitPrice,
    "selectedAddon":this.selectedAddon,
    "selectedOtions":this.selectedOtions,
  };}
  factory DemoCartItemProvider.fromJson(Map<String, dynamic> parsedJson) {
    return  DemoCartItemProvider(
      itemName:parsedJson['itemName'] ?? "",
      itemQuantity:parsedJson['itemQuantity'] ?? "",
      itemTotalPrice:parsedJson['itemTotalPrice'] ?? "",

      itemUnitPrice:parsedJson['itemUnitPrice'] ?? "",
      selectedAddon:parsedJson['selectedAddon'] ?? "",
      selectedOtions:parsedJson['selectedOtions'] ?? "",
    );
  }



}
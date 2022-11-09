import 'package:flutter/cupertino.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_details.dart';
import 'package:operation_falafel/providers/demo_cart/demo_cart_item_provider.dart';

class DemoCartProvider with ChangeNotifier{
  List<DemoCartItemProvider> _cartItems=[] ;
  DemoCartDetails Details = new DemoCartDetails();
  List<DemoCartItemProvider> get cartItems => _cartItems;

  set cartItems(List<DemoCartItemProvider> value) {
    _cartItems = value;
  }

  Future<void> addToCart({ required itemName, required itemQuantity, required itemTotalPrice, required itemUnitPrice, required selectedAddon, required selectedOtions })async {

    DemoCartItemProvider demoCartItemProvider = DemoCartItemProvider(
    itemName: itemName,
      itemQuantity: itemQuantity,
      itemTotalPrice: itemTotalPrice,
      itemUnitPrice: itemUnitPrice,
      selectedAddon: selectedAddon,
      selectedOtions: selectedOtions
    );

    // print(demoCartItemProvider.selectedOtions);
    demoCartItemProvider.itemTotalPrice= calculateTotalPrice(demoCartItemProvider);
    _cartItems.add(demoCartItemProvider);
    Calculating_TotalPrice();
    notifyListeners();
    // return 0 ;
  }
  double calculateTotalPrice(DemoCartItemProvider item){
    double tempTotal =0.0;
    // item.selectedOtions.forEach((element) {
    //   // print(element[element.keys.elementAt(0)]["Price"]);
    //   tempTotal+= element[element.keys.elementAt(0)]["Price"];
    // });
    item.selectedAddon.forEach((element) {
      tempTotal+= element[element.keys.elementAt(0)]["Price"]*element[element.keys.elementAt(0)]["quantity"];
    });
    item.itemUnitPrice += tempTotal;
    tempTotal +=  item.itemTotalPrice*item.itemQuantity;
    return tempTotal;
  }

  Future<void>updateItemTotalQuantity(int value, int itemIndex )async{
    _cartItems[itemIndex].itemQuantity= value;
    _cartItems[itemIndex].itemTotalPrice = _cartItems[itemIndex].itemQuantity * _cartItems[itemIndex].itemUnitPrice;
    Calculating_TotalPrice();
    notifyListeners();
  }
  Future<void>deleteItemByIndex( int itemIndex )async{
    _cartItems.removeAt(itemIndex);
    Calculating_TotalPrice();
    notifyListeners();
  }
  bool checkExistInCart(String name) {
    bool alreadyExist = false;

    if (_cartItems.isNotEmpty) {
      _cartItems.forEach((element) {
        if (element.itemName == name) {
          alreadyExist = true;
        }
        ;
      });
    } else {
      alreadyExist = false;
    }

    return alreadyExist;
  }
  void Calculating_TotalPrice() {
    int CountItems = 0;
    double TotalPrice = 0.0;
    for (int i = 0; i < _cartItems.length; i++) {
      TotalPrice += _cartItems[i].itemTotalPrice;
      CountItems += 1;
    }

    Details.Total = TotalPrice;
    Details.Items = CountItems;

    print("Cart Total Price: ${Details.Total}");
    notifyListeners();
  }

}
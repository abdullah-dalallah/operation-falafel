import 'package:flutter/cupertino.dart';

class DemoCartDetails extends ChangeNotifier{
  double _total=0.0;
  int _items=0;
  DemoCartDetails({Total, Items});


  double get Total => _total;
  int get Items => _items;


  set Total(double value) {
    _total = value;
  }

  Map<String, dynamic> toJson() {
    return {
      "Total":this.Total,
      "Items":this.Items,
    };
  }

  factory DemoCartDetails.fromJson(Map<String, dynamic> parsedJson) {
    return new DemoCartDetails(

      Total:parsedJson['Total'] ?? "",
      Items:parsedJson['Items'] ?? "",


    );
  }

  set Items(int value) {
    _items = value;
  }


}
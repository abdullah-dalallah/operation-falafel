import 'package:flutter/cupertino.dart';

class SliderProvider with ChangeNotifier{
  double _selectedPoint = 0;

  double get selectedPoint => _selectedPoint;

  void onChangePoint(double value){
    _selectedPoint = value;
    notifyListeners();
  }
}
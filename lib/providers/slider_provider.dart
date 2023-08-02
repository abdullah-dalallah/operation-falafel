import 'package:flutter/cupertino.dart';

class SliderProvider with ChangeNotifier{
  double _selectedPoint = 0;

  double get selectedPoint => _selectedPoint;
  TextEditingController _pointController =  TextEditingController();

  TextEditingController get pointController => _pointController;

  void onChangePoint(double value){
    _selectedPoint = value;

    notifyListeners();
  }
  void onChangePointController(double value){
    _selectedPoint = value;
    _pointController.text ="${value}";
    notifyListeners();
  }


}
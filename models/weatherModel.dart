import 'package:flutter/cupertino.dart';

class WeatherModel with ChangeNotifier {
  String _temperatureType = "celcius";
  double _temperatureVal = 25;

  double get temperatureVal => _temperatureVal;
  String get temperatureType => _temperatureType;

  set temperatureVal(double newTemp) {
    _temperatureVal = newTemp;
    notifyListeners();
  }

  set temperatureType(String newType) {
    _temperatureType = newType;
    notifyListeners();
  }
}

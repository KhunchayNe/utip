import 'package:flutter/material.dart';

class TipCalulatorModel with ChangeNotifier {
  int _personCount = 1;
  double _percentTip = 0;
  double _billTotal = 0.0;

  double get billTotal => _billTotal;
  double get precenTip => _percentTip;
  int get personCount => _personCount;

  void updateBillTotal(double billTotal) {
    _billTotal = billTotal;
    notifyListeners();
  }

  void updatePercenTip(double percenTip) {
    _percentTip = percenTip;
    notifyListeners();
  }

  void updatePersonCount(int personCount) {
    _personCount = personCount;
    notifyListeners();
  }

  double get totalPerPerson =>
      (((_billTotal * _percentTip) + _billTotal) / _personCount);

  double totalTip() => (_billTotal * _percentTip);
}

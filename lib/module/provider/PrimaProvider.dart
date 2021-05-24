import 'package:flutter/material.dart';

class PrimaProvider with ChangeNotifier {
  List<int> _prima = [];
  int _angkaAwal = 0;
  int _angkaAkhir = 0;
  List<int> get prima => _prima;
  int get angkaAwal => _angkaAwal;
  int get angkaAkhir => _angkaAkhir;
  void setAngkaAwal(int num) {
    _angkaAwal = num;
    notifyListeners();
  }

  void setAngkaAkhir(int num) {
    _angkaAkhir = num;
    notifyListeners();
  }

  void addPrima(int num) {
    _prima.add(num);
    notifyListeners();
  }

  void clearPrima() {
    _prima.clear();
    notifyListeners();
  }
}

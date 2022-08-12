import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier {
  List _count = [];
  bool _fetchFlag = false;
  String _catName = "";

  List get count => [..._count];
  bool get fetchFlag => _fetchFlag;
  String get catName => _catName;

  void setValue(a) {
    _catName = a;
    notifyListeners();
  }

  void setFetchFlag() {
    _fetchFlag = !_fetchFlag;
    notifyListeners();
  }
}

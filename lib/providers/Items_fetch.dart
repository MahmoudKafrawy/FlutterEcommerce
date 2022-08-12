import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemsFecth with ChangeNotifier {
  List _count = [];
  bool _fetchFlag = false;

  List get count => [..._count];
  bool get fetchFlag => _fetchFlag;

  void setValue(a) {
    _count = [...a];
    notifyListeners();
  }

  void setFetchFlag() {
    _fetchFlag = !_fetchFlag;
    notifyListeners();
  }
}

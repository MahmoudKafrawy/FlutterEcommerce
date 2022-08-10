import 'package:flutter/material.dart';

class ItemsFecth with ChangeNotifier {
  List _count = [];

  List get count => [..._count];

  void setValue(a) {
    _count = [...a];
    notifyListeners();
  }
}

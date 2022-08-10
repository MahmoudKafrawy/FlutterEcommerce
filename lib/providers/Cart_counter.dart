import 'package:flutter/material.dart';

class CartCounter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void setValue(a) {
    _count = a;
    notifyListeners();
  }
}

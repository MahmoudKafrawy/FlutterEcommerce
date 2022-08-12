import 'package:flutter/material.dart';

class CartCounter with ChangeNotifier {
  int _count = 0;
  List _isInCart = [];

  int get count => _count;
  List get isinCart => _isInCart;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void setValue(a) {
    _count += a as int;
    notifyListeners();
  }

  void addToCartPage(i) {
    _isInCart.add(i);
  }

  void removeFromCartPage(i) {
    _isInCart.remove(i);
  }
}

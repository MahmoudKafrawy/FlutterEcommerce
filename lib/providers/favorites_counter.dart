import 'dart:io';

import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  List _list = [];
  List _isInFav = [];

  int get count => _count;
  List get list => _list;
  List get listOfFavPage => _isInFav;

  void setValue(a) {
    _count = a;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  void addItem(id) {
    _list.add(id);
  }

  void removeItem(id) {
    _list.remove(id);
  }

  void addToFavPage(i) {
    _isInFav.add(i);
  }

  void removeFromFavPage(i) {
    _isInFav.remove(i);
  }
}

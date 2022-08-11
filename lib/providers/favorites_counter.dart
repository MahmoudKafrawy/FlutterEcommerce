import 'dart:io';

import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  List _count = [];

  List get count => [..._count];

  void setValue(a) {
    _count = [...a];
    notifyListeners();
  }
}

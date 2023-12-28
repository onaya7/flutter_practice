import 'package:flutter/material.dart';

class Manage extends ChangeNotifier {
  int count = 0;
  int get counter {
    return count;
  }

  void increaseCounter() {
    count++;
    notifyListeners();
  }

  void decreaseCounter() {
    count--;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class CalculateChipProvider extends ChangeNotifier {
  int index = 0;

  void setIndex(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }
}

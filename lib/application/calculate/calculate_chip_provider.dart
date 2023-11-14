import 'package:flutter/material.dart';

class CalculateChipProvider extends ChangeNotifier {
  int index = -1;

  void setIndex(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }
}

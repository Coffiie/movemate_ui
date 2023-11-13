import 'package:flutter/material.dart';

class HomeAnimProvider extends ChangeNotifier {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  void changeCrossFadeState(CrossFadeState state) {
    crossFadeState = state;
    notifyListeners();
  }
}

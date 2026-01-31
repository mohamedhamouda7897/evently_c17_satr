import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  int selectedIndex = 0;

  changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

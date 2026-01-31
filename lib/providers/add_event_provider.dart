import 'package:flutter/material.dart';

class AddEventProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  DateTime selectedDate=DateTime.now();
  List<String> categories = [
    "book_club",
    "meeting",
    "eating",
    "gaming",
    "holiday",
    "birthday",
    "sport",
    "exhibition",
    "workshop",
  ];



  changeDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }



  changeCategoryIndex(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }
}

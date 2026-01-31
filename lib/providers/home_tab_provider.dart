import 'dart:async';

import 'package:evently_c17_str/core/firebase_functions.dart';
import 'package:evently_c17_str/models/task_model.dart';
import 'package:flutter/material.dart';

class HomeTabProvider extends ChangeNotifier {
  List<String> categories = [
    "All",
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

  List<TaskModel> tasks = [];
  bool isLoading = false;
  String errorMessage = "";
  int selectedCategoryIndex = 0;

  StreamSubscription? streamSubscription;

  changeCategoryIndex(int index) {
    selectedCategoryIndex = index;
    // getTasks();
    getStreamTasks();
    notifyListeners();
  }

  @override
  dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  getStreamTasks() {
    if (streamSubscription != null) {
      streamSubscription!.cancel();
    }
    streamSubscription =
        FirebaseFunctions.getStreamTasks(
          category: selectedCategoryIndex == 0
              ? null
              : categories[selectedCategoryIndex],
        ).listen((event) {
          tasks = event.docs.map((e) => e.data()).toList();
          notifyListeners();
        });
  }

  // getTasks() async {
  //   try {
  //     isLoading = true;
  //     var list = await FirebaseFunctions.getTasks(
  //       category: selectedCategoryIndex == 0
  //           ? null
  //           : categories[selectedCategoryIndex],
  //     );
  //     tasks = list.docs.map((e) => e.data()).toList();
  //   } catch (e) {
  //     errorMessage = e.toString();
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }
}

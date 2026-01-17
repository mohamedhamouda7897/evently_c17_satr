import 'package:flutter/material.dart';

extension StringExtension on String {
  int toInt() {
    return int.parse(this);
  }
}

extension ThemeExtension on BuildContext {
  theme() {
    return Theme.of(this);
  }


  textTheme() {
    return Theme.of(this).textTheme;
  }

  titleMedium() {
    return Theme.of(this).textTheme.titleMedium;
  }

  titleLarge() {
    return Theme.of(this).textTheme.titleLarge;
  }
  titleSmall() {
    return Theme.of(this).textTheme.titleSmall;
  }
  displayLarge() {
    return Theme.of(this).textTheme.displayLarge;
  }

}

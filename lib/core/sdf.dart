import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors {
  Color get x1;

  Color get x2;

  Color get x3;
}



class DarkAppColors implements AppColors {
  @override
  // TODO: implement x1
  Color get x1 => throw UnimplementedError();

  @override
  // TODO: implement x2
  Color get x2 => throw UnimplementedError();

  @override
  // TODO: implement x3
  Color get x3 => throw UnimplementedError();
}

class LightAppColors implements AppColors {
  Color get x1 => Color(0xFF0E3A99);

  @override
  // TODO: implement x2
  Color get x2 => throw UnimplementedError();

  @override
  // TODO: implement x3
  Color get x3 => throw UnimplementedError();
}

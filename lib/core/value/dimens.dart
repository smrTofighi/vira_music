import 'package:flutter/material.dart';

class AppDimens {
  AppDimens._();
  static Size sizeOfDevice(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static const double radius = 10.0;
  static const double small = 8.0;
  static const double normal = 12.0;
  static const double large = 16.0;
}

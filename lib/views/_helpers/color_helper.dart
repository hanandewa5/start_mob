import 'package:flutter/material.dart';

class AppColors {
  // Color
  static const Color primaryColor = Color(0xFF446491);
  static const Color accentColor = Color(0xfface6f6);
  static const Color appBackgroundColor = Color(0xFFf8f8f8);
  static const Color topBarBackgroundColor = Color(0xFF86a6df);
  static const Color selectedTabBackgroundColor = Color(0xFF324e7b);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F988F);

  // ? Gradient
  static const List<Color> primaryGradient = [
    Color(0xFF5068a9),
    Color(0xFF324e7b)
  ];
  static const List<Color> secondGradient = [
    Color.fromRGBO(142, 45, 226, 1),
    Color.fromRGBO(74, 0, 224, 1),
  ];

  // ? Color Input
  static const TextStyle inputPrimary = TextStyle(color: Colors.purpleAccent);
  static const TextStyle inputDanger = TextStyle(color: Colors.red);
}

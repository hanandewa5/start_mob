import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData mainThemes = ThemeData(
    // brightness: Brightness.light,
    primaryColor: Color(0xFF191C3F),
    primaryColorLight: Color(0xFF2EC3F2),
    primaryColorDark: Color(0xFF1d204a),
    accentColor: Color(0xFF2EC3F2),
    backgroundColor: Color(0xFFF4F4F4),
    errorColor: Colors.red,
    fontFamily: 'Poppins-Bold',
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 24.0, fontFamily: 'Poppins-Bold'),
      body1: TextStyle(fontSize: 16.0, fontFamily: 'Poppins-Bold'),
      body2: TextStyle(fontSize: 14.0, fontFamily: 'Poppins-Bold'),
    ),
  );
}

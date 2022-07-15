import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.2,
        titleTextStyle: TextStyle(color: Colors.black)),
    scaffoldBackgroundColor: Colors.white,
  );
}

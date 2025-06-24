import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 238, 238, 238),
    primaryColorLight: Colors.red,
    unselectedWidgetColor: Colors.white,
    secondaryHeaderColor: Colors.white,
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
      bodyLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey[850],
    primaryColorLight: Colors.red,
    unselectedWidgetColor: Color.fromARGB(255, 37, 37, 38),
    secondaryHeaderColor: Colors.black,
    textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      bodyLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

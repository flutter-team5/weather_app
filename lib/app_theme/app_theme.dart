import 'package:flutter/material.dart';

enum AppTheme {
  // ignore: constant_identifier_names
  LightTheme,
  // ignore: constant_identifier_names
  DarkTheme
}

final appThemeData = {
  AppTheme.LightTheme: ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 224, 224, 224),
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 224, 224, 224),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.black),
    //   bodyMedium: TextStyle(
    //     color: Colors.black,
    //   ),
    //   bodySmall: TextStyle(color: Colors.black),
    // ),
  ),
  AppTheme.DarkTheme: ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 66, 66, 66),
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 66, 66, 66),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Color.fromARGB(255, 224, 224, 224)),
    //   bodyMedium: TextStyle(
    //     color: Color.fromARGB(255, 224, 224, 224),
    //   ),
      // bodySmall: TextStyle(color: Color.fromARGB(255, 224, 224, 224)),
      // displayLarge: TextStyle(color: Color.fromARGB(255, 224, 224, 224)),
      // displayMedium: TextStyle(color: Color.fromARGB(255, 224, 224, 224)),
      // displaySmall: TextStyle(color: Color.fromARGB(255, 224, 224, 224)),
    
  ),
};

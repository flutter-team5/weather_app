import 'package:flutter/material.dart';

enum AppTheme{
  // ignore: constant_identifier_names
  LightTheme,
  // ignore: constant_identifier_names
  DarkTheme
}

final appThemeData = {
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 224, 224, 224),
  ),

  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 66, 66, 66),
  )
};
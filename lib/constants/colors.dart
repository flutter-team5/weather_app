import 'package:flutter/material.dart';

class WColors {
  static const cloudy = LinearGradient(
    colors: [
      Color.fromARGB(255, 190, 233, 241),
      Color.fromARGB(255, 133, 187, 198),
    ],
  );

  static const rainy = LinearGradient(
    colors: [
      Color.fromARGB(197, 212, 218, 219),
      Color.fromARGB(170, 169, 197, 252),
    ],
  );

  static const sunny = LinearGradient(
    colors: [
      Color.fromARGB(181, 255, 153, 175),
      Color.fromARGB(255, 249, 205, 139)
    ],
  );

  static const clear = LinearGradient(
    colors: [
      Color.fromARGB(255, 232, 245, 255),
      Color.fromARGB(255, 187, 222, 251),
    ],
  );

  static Color lightBlue = Colors.blue.shade100;
  static Color whiteBlue = Colors.lightBlue.shade50;
}

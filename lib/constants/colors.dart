import 'package:flutter/material.dart';

class WColors {
  static const cloudy = LinearGradient(
    colors: [
      Color.fromARGB(255, 186, 232, 241),
      Color.fromARGB(255, 159, 202, 211),
    ],
  );

  static const rainy = LinearGradient(
    colors: [
      Color.fromARGB(198, 190, 196, 197),
      Color.fromARGB(193, 141, 171, 233),
    ],
  );

  static const sunny = LinearGradient(
    colors: [
      Color.fromARGB(181, 255, 133, 160),
      Color.fromARGB(255, 249, 205, 139)
    ],
  );

  static const clear = LinearGradient(
    colors: [
      Color.fromARGB(255, 208, 233, 254),
      Color.fromARGB(255, 187, 222, 251),
    ],
  );

  static Color lightBlue = Colors.blue.shade100;
  static Color whiteBlue = Colors.lightBlue.shade50;
}

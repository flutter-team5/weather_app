import 'package:flutter/material.dart';


class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0081800, size.height * -0.0069000);
    path_0.lineTo(size.width * 0.0029200, size.height * 1.0002000);
    path_0.lineTo(size.width * 1.0115600, size.height * 1.0004200);
    path_0.lineTo(size.width * 1.0006800, size.height * -0.0073600);
    path_0.quadraticBezierTo(size.width * 0.7916400, size.height * 0.1700400,
        size.width * 0.4947800, size.height * 0.1641400);
    path_0.quadraticBezierTo(size.width * 0.2985400, size.height * 0.1613400,
        size.width * -0.0081800, size.height * -0.0069000);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1181000);
    path_0.lineTo(size.width * -0.0020000, size.height * 1.0020000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 1.0020000, size.height * 0.1907000);
    path_0.quadraticBezierTo(size.width * 0.7999800, size.height * 0.0475000,
        size.width * 0.7237600, size.height * 0.0530600);
    path_0.cubicTo(
        size.width * 0.5804600,
        size.height * 0.0392400,
        size.width * 0.4270800,
        size.height * 0.1492400,
        size.width * 0.3015400,
        size.height * 0.1465200);
    path_0.quadraticBezierTo(size.width * 0.2217200, size.height * 0.1632800, 0,
        size.height * 0.1181000);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1181000);
    path_0.lineTo(size.width * -0.0020000, size.height * 1.0020000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 1.0020000, size.height * 0.1907000);
    path_0.quadraticBezierTo(size.width * 0.8088600, size.height * 0.2273200,
        size.width * 0.7304200, size.height * 0.1995800);
    path_0.cubicTo(
        size.width * 0.5782400,
        size.height * 0.1435600,
        size.width * 0.4182000,
        size.height * 0.0315800,
        size.width * 0.2926600,
        size.height * 0.0288600);
    path_0.quadraticBezierTo(size.width * 0.1928600, size.height * 0.0234200, 0,
        size.height * 0.1181000);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
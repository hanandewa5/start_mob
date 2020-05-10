import 'package:flutter/material.dart';

class BackWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();

    // path.lineTo(0.0, size.height);
    // path.lineTo(size.width * 0.33, size.height * 0.75);
    // path.lineTo(size.width * 0.66, size.height);
    // path.lineTo(size.width, size.height * 0.75);
    // path.lineTo(size.width, 0.0);

    // path.lineTo(0.0, size.height - 100);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0.0);
    path.lineTo(0.0, size.height * 0.75);

    path.quadraticBezierTo(
      // ? Connector
      size.width * 0.25,
      size.height * 0.6,

      // ? Endpoint
      size.width * 0.5,
      size.height * 0.80,
    );

    path.quadraticBezierTo(
      // ? Connector
      size.width * 0.75,
      size.height,

      // ? Endpoint
      size.width,
      size.height * 0.8,
    );

    // var secondEndPoint = Offset(size.width * 0.5, size.height - 35.0);
    // var secondControlPoint = Offset(size.width * 0.25, size.height - 90.0);

    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dy, secondEndPoint.dy);

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class FrontWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height * 0.80);

    path.quadraticBezierTo(
      // ? Connector
      size.width * 0.25,
      size.height,

      // ? Endpoint
      size.width * 0.4,
      size.height * 0.85,
    );

    path.quadraticBezierTo(
      // ? Connector
      size.width * 0.75,
      size.height * 0.4,

      // ? Endpoint
      size.width,
      size.height * 0.85,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

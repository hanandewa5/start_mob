import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFFEFEFE),
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Image.asset("lib/_assets/images/logo.png")),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {this.bottom: false,
      this.left: false,
      this.right: false,
      this.top: false,
      this.child,
      this.shrinkWrap: true});

  final Widget child;
  final bool bottom;
  final bool left;
  final bool right;
  final bool top;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: bottom,
      left: left,
      right: right,
      top: top,
      child: SingleChildScrollView(
        child: Container(
          height: shrinkWrap ? null : _size.height,
          child: child,
        ),
      ),
    );
  }
}

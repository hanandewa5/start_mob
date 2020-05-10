import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class RaisedGradientButton extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final Function onSomeChanged;
  final bool isBusy;

  const RaisedGradientButton({
    Key key,
    this.text,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
    this.onSomeChanged,
    this.isBusy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _debouncer = Debouncer(milliseconds: 500);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(25)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: isBusy ? null : onPressed,
            child: Center(
              child: (isBusy)
                  ? Container(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.white),
                    )
                  : Text(
                      text.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
            )),
      ),
    );
  }
}

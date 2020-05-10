import 'package:flutter/material.dart';

class ButtonSubmit extends StatefulWidget {
  final bool isLoad;
  final Function onPressed;
  final Color color;
  final TextStyle textColor;
  final String title;

  ButtonSubmit(
      {this.isLoad = false,
      this.color,
      this.textColor,
      this.title,
      this.onPressed,
      Key key})
      : super(key: key);

  @override
  _ButtonSubmitState createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: (widget.isLoad
          ? Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              widget.title ?? "SUBMIT",
              style: widget.textColor,
            )),
      color: widget.color ?? Colors.blueAccent,
      onPressed: widget.onPressed,
    );
  }
}

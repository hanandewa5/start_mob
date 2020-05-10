import 'package:flutter/material.dart';

class Paragraft extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;
  final TextOverflow overflow;
  final TextDecoration textDecoration;

  Paragraft(this.text,
      {this.overflow = TextOverflow.ellipsis,
      this.textStyle,
      this.textAlign = TextAlign.start,
      this.color,
      this.fontSize,
      this.textDecoration = TextDecoration.none,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        decoration: textDecoration,
      ).merge(textStyle).merge(TextStyle(fontSize: fontSize)).merge(TextStyle(
          color: color != null ? color : Theme.of(context).primaryColor)),
    );
  }
}

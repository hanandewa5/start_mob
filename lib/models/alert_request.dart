import 'package:flutter/material.dart';

class AlertRequest {
  final String title;
  final String description;
  final String buttonTitle;
  final Icon icon;

  AlertRequest({
    this.title,
    this.description,
    this.buttonTitle,
    this.icon
  });
}

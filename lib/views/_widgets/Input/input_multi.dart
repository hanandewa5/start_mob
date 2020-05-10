import 'package:start_mob/views/_helpers/text_helper.dart';
import 'package:flutter/material.dart';

class InputMulti extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final bool bordered;
  final bool isRequired;
  final bool isLabeled;
  final String placeholder;
  final int max;

  InputMulti(
      {this.controller,
      @required this.name,
      this.isRequired = false,
      this.bordered = false,
      this.placeholder,
      this.isLabeled = true,
      this.max,
      Key key})
      : super(key: key);

  @override
  _InputMultiState createState() => _InputMultiState();
}

class _InputMultiState extends State<InputMulti> {
  @override
  Widget build(BuildContext context) {
    return widget.bordered
        ? TextFormField(
            controller: widget.controller,
            style: textMedium,
            maxLines: null,
            maxLength: widget.max,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                counterText: "",
                labelText: widget.isLabeled ? widget.name : null,
                hintText: widget.placeholder),
            validator: (value) {
              if (widget.isRequired) {
                if (value.isEmpty) {
                  return widget.name + ' is required';
                }
              }
              return null;
            },
          )
        : Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18.0, bottom: 5, top: 5),
              child: TextFormField(
                controller: widget.controller,
                style: textMedium,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: textMedium,
                    hintText: widget.name),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return widget.name + ' is required';
                //   }
                //   return null;
                // },
              ),
            ),
          );
  }
}

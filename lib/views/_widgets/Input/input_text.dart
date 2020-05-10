import 'package:start_mob/views/_helpers/size_config.dart';
import 'package:start_mob/views/_helpers/text_helper.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final String placeholder;
  final TextStyle labelStyle;
  final bool bordered;
  final bool isRequered;
  final bool disabled;
  final int min;
  final TextInputType textInputType;
  final TextStyle style;

  InputText(
      {this.controller,
      this.isRequered = false,
      this.bordered = false,
      this.disabled = false,
      this.labelStyle = textMedium,
      this.min = 0,
      this.placeholder,
      @required this.name,
      this.textInputType,
      this.style,
      Key key})
      : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return widget.bordered
        ? TextFormField(
            controller: widget.controller,
            enabled: !widget.disabled,
            onFieldSubmitted: (String inputText) {
              widget.controller.clear();
              widget.controller.text = inputText;
            },
            style: widget.style,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: TextStyle(fontSize: 12),
                hasFloatingPlaceholder: true,
                labelStyle: widget.labelStyle,
                fillColor: Colors.yellowAccent,
                labelText: widget.name),
            validator: (value) {
              if (widget.isRequered) {
                if (value.isEmpty) {
                  return widget.name + ' is required';
                }
              }

              if (widget.textInputType == TextInputType.emailAddress) {
                if (value.isEmpty == false) {
                  return validateEmail(value);
                }
              }

              if (widget.textInputType == TextInputType.datetime) {
                if (value.isEmpty == false) {
                  return validateDate(value);
                }
              }

              if (widget.min != 0) {
                if (widget.controller.text.length <= widget.min) {
                  return "Min " +
                      widget.name +
                      " lenght is " +
                      widget.min.toString();
                }
              }
              return null;
            },
          )
        : Container(
            padding: EdgeInsets.symmetric(
              horizontal: 7 * SizeConfig.widthMultiplier,
              vertical: 0.4 * SizeConfig.heightMultiplier,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(196, 135, 198, .3),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: TextFormField(
              controller: widget.controller,
              style: textMedium,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: textThin,
                  hintText: widget.name),
              // validator: (value) {
              //   if (value.isEmpty) {
              //     return widget.name + ' is required';
              //   }
              //   return null;
              // },
            ),
          );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateDate(String value) {
    Pattern pattern =
        r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Date (dd/mm/yyyy)';
    else
      return null;
  }
}

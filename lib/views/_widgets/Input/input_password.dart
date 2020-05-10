import 'package:start_mob/views/_helpers/text_helper.dart';
import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String name;

  InputPassword({this.controller, @required this.name, Key key})
      : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    // return TextFormField(
    //   controller: widget.controller,
    //   style: textMedium,
    //   obscureText: _isHide,
    //   decoration: InputDecoration(
    //       hasFloatingPlaceholder: true,
    //       labelStyle: textMedium,
    //       labelText: widget.name,
    //       suffixIcon: IconButton(
    //         icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
    //         onPressed: () {
    //           setState(() {
    //             _isHide = !_isHide;
    //           });
    //         },
    //       )),
    // );
    return Card(
      elevation: 3,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 5, top: 5),
        child: TextFormField(
          controller: widget.controller,
          style: textMedium,
          obscureText: _isHide,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: textMedium,
              hintText: widget.name,
              suffixIcon: IconButton(
                icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isHide = !_isHide;
                  });
                },
              )),
        ),
      ),
    );
  }
}

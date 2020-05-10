import 'package:start_mob/views/_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';

class InputAuto<T> extends StatefulWidget {
  final String name;
  final String value;
  final bool isError;
  final Function onChange;
  final List list;
  final bool isExpanded;

  InputAuto(
      {this.isError = false,
      this.value,
      this.onChange,
      @required this.list,
      this.name,
      this.isExpanded = false,
      Key key})
      : super(key: key);

  @override
  _InputAutoState createState() => _InputAutoState();
}

class _InputAutoState extends State<InputAuto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceMedium(),
          (widget.name != null)
              ? Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 12, color: Theme.of(context).primaryColor),
                )
              : SizedBox(
                  width: 0,
                ),
          DropdownButton<String>(
            isExpanded: widget.isExpanded,
            hint: Text("Pilih ${widget.name}"),
            underline: Container(
              height: 1.0,
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 1))),
            ),
            value: widget.value != null ? widget.value : null,
            onChanged: widget.onChange,
            items: widget.list.map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

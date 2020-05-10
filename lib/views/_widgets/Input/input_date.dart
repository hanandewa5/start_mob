import 'package:start_mob/views/_helpers/color_helper.dart';
import 'package:start_mob/views/_helpers/text_helper.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InputDate<T> extends StatefulWidget {
  final String name;
  final String value;
  final bool isError;
  final Function onChange;
  final bool isExpanded;
  final DateTime initialDate;
  final DateTime currDate;
  final DateTime minDate;
  final DateTime maxDate;
  final List<String> formatDate;

  InputDate(
      {this.isError = false,
      this.minDate,
      this.value,
      this.maxDate,
      this.onChange,
      this.name,
      this.isExpanded = false,
      this.initialDate,
      this.currDate,
      this.formatDate,
      Key key})
      : super(key: key);

  @override
  _InputDateState createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  @override
  Widget build(BuildContext context) {
    var _colorPrimary = Theme.of(context).primaryColor;
    return InkWell(
        onTap: () {
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: widget.minDate ?? DateTime(2017, 1, 1),
              maxTime: widget.maxDate ?? DateTime.now(),
              onConfirm: widget.onChange,
              currentTime: widget.initialDate != null
                  ? widget.initialDate
                  : DateTime.now(),
              locale: LocaleType.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: _colorPrimary))),
                child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    trailing: Icon(Icons.arrow_drop_down_circle),
                    title: Text(
                      widget.name,
                      style: textSmall.merge(
                          TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    subtitle: widget.currDate == null
                        ? Text("Pilih ${widget.name}")
                        : Text(formatDate(widget.currDate,
                            widget.formatDate ?? [dd, " ", M, " ", yyyy])))),
            widget.isError
                ? Text(
                    "${widget.name} tidak boleh kosong",
                    style: AppColors.inputDanger.merge(textSmall),
                  )
                : SizedBox(
                    height: 0,
                  )
          ],
        ));
  }
}

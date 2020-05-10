import 'package:start_mob/models/alert_request.dart';
import 'package:start_mob/models/alert_response.dart';
import 'package:start_mob/views/_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:start_mob/_config/locator.dart';
import 'package:start_mob/_services/dialog_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    Alert(
        context: context,
        title: request.title,
        desc: request.description,
        closeFunction: () =>
            _dialogService.dialogComplete(AlertResponse(confirmed: false)),
        buttons: [
          DialogButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                request.icon != null ? request.icon : Text(""),
                UIHelper.horizontalSpaceSmall(),
                Text(request.buttonTitle)
              ],
            ),
            onPressed: () {
              _dialogService.dialogComplete(AlertResponse(confirmed: true));
              Navigator.of(context).pop();
            },
          )
        ]).show();
  }
}

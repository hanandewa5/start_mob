import 'dart:async';

import 'package:start_mob/models/alert_request.dart';
import 'package:start_mob/models/alert_response.dart';
import 'package:flutter/material.dart';

class DialogService {
  Function _showDialogListener;
  Completer _dialogCompleter;

  void registerDialogListener(Function showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AlertResponse> showDialog(
      {String title, String descs, String btnTittle = 'OK', Icon icon}) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(AlertRequest(
        title: title, description: descs, buttonTitle: btnTittle, icon: icon));
    return _dialogCompleter.future;
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}

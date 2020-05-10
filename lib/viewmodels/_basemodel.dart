import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseModel extends ChangeNotifier {
  bool _screenLoading = false;
  bool _busy = false;
  String _errorMessage;

  bool get screenLoading => _screenLoading;
  bool get busy => _busy;
  String get errorMessage => _errorMessage;
  bool get hasErrorMessage => _errorMessage != null && _errorMessage.isNotEmpty;

  void setScreenLoad(bool value) {
    _screenLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  Future setStorageString(String key, var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringVal = value.toString();
    await prefs.setString(key, stringVal);
  }

  Future setStorage(String key, var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringVal = json.encode(value);
    await prefs.setString(key, stringVal);
  }

  Future getStorage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getString(key);
    if (res != null) {
      var resParse = json.decode(res);
      return resParse;
    }
    return null;
  }
}

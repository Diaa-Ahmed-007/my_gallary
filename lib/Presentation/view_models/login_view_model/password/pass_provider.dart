import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  bool passSecure = true;
  changePassSecure(bool newValue) {
    if (passSecure == newValue) return;
    passSecure = newValue;
    notifyListeners();
  }
}

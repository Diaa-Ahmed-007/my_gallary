import 'package:flutter/material.dart';

class UploadProvider extends ChangeNotifier {
  bool isShown = false;
  changeIsShown(bool newValue) {
    if (isShown == newValue) return;
    isShown = newValue;
    notifyListeners();
  }
}

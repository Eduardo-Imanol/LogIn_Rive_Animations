import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  bool visible = true;

  void settVisible() {
    visible = !visible;
    notifyListeners();
  }

  bool getVisible() {
    return visible;
  }
}

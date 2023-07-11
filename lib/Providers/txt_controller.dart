import 'package:flutter/material.dart';

class TxtFormFieldController with ChangeNotifier {
  String email = "";
  String password = "";
  final String emailS = "eduarinam@gmail.com";
  final String passwordS = "654321";
  bool chargin = false;
  int eyes = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String getEmail(newValue) {
    email = newValue;
    notifyListeners();
    return email;
  }

  void setControllers() {
    emailController.text = email;
    passwordController.text = password;
    notifyListeners();
  }

  void setEyes() {
    eyes = email.length;
    notifyListeners();
  }

  String getPassword(newValue) {
    password = newValue;
    notifyListeners();
    return password;
  }

  void setChargin() {
    notifyListeners();
    chargin = !chargin;
  }
}

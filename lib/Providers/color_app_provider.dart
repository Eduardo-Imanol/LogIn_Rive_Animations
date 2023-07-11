import 'package:flutter/material.dart';
import 'package:flutter_change_1/models/app_colors.dart';

class ColorAppProvider with ChangeNotifier {
  bool darkMode = false;
  Color primary = CustomTheme.colorFirstLight;
  Color secondary = CustomTheme.colorSecondLight;
  Color third = CustomTheme.colorThirdLight;

  void setDarkMode() {
    darkMode = !darkMode;
    notifyListeners();
  }

  Color getPrimary() {
    if (darkMode) {
      return CustomTheme.colorFirstDark;
    } else {
      return CustomTheme.colorFirstLight;
    }
  }

  Color getText() {
    if (darkMode) {
      return CustomTheme.colorFirstDark;
    } else {
      return const Color.fromARGB(255, 213, 242, 255);
    }
  }

  Color getSacondary() {
    if (darkMode) {
      return CustomTheme.colorSecondDark;
    } else {
      return CustomTheme.colorThirdLight;
    }
  }

  Color getThird() {
    if (darkMode) {
      return CustomTheme.colorThirdDark;
    } else {
      return CustomTheme.colorSecondLight;
    }
  }

  Color getgradient() {
    if (darkMode) {
      return const Color.fromARGB(255, 56, 56, 56);
    } else {
      return const Color.fromARGB(255, 147, 149, 245);
    }
  }
}

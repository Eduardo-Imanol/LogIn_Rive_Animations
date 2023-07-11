import 'package:flutter/material.dart';

class CustomTheme {
  static const Color colorFirstLight = Color.fromARGB(255, 156, 212, 238);
  static const Color colorSecondLight = Color.fromRGBO(160, 45, 98, 1);
  static const Color colorThirdLight = Color.fromRGBO(84, 57, 92, 1);
  static const Color colorFirstDark = Colors.black;
  static const Color colorSecondDark = Color.fromRGBO(110, 110, 110, 1);
  static const Color colorThirdDark = Color.fromRGBO(193, 131, 177, 1);

  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: colorSecondLight,
    secondaryHeaderColor: colorThirdLight,
    scaffoldBackgroundColor: colorFirstLight,
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: colorSecondDark,
    secondaryHeaderColor: colorThirdDark,
    scaffoldBackgroundColor: colorFirstDark,
  );
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_change_1/Providers/color_app_provider.dart';

import 'package:flutter_change_1/models/app_colors.dart';
import 'package:flutter_change_1/models/fonts.dart';
import 'package:provider/provider.dart';

Widget onTapBackTextDo(context, widget) {
  return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: widget);
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

UtilsSnackBar(
  String text,
  String text2,
  void Function() tap,
  BuildContext context,
  ColorAppProvider color,
) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color.getText(),
      content: MavenText(
          noCen: "noNUll",
          text: text,
          textStyle: normalText500(
              context,
              color.darkMode
                  ? const Color.fromARGB(255, 190, 227, 244)
                  : CustomTheme.colorFirstDark)),
      elevation: 30,
      duration: const Duration(milliseconds: 2500),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: text2,
        onPressed: tap,
        textColor: color.getThird(),
      ),
    ));

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorAppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedContainer(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorProvider.getPrimary(),
                colorProvider.getgradient()
              ], // Colores del degradado
              begin: Alignment.topLeft, // Punto de inicio del degradado
              end: Alignment.bottomRight, // Punto de fin del degradado
              stops: const [
                0.0,
                1.0
              ], // Parámetros de control de posición del degradado
            ),
          ),
          duration: const Duration(milliseconds: 600),
          child: child),
    );
  }
}

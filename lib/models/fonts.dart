import 'package:flutter/material.dart';
import 'package:flutter_change_1/Providers/color_app_provider.dart';
import 'package:flutter_change_1/models/app_colors.dart';
import 'package:flutter_change_1/models/size_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MavenText extends StatelessWidget {
  const MavenText({
    Key? key,
    this.noCen,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;
  final dynamic noCen;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: maven(textStyle),
        textAlign: noCen == null ? TextAlign.center : TextAlign.start);
  }
}

// ignore: must_be_immutable
class NunitoText extends StatelessWidget {
  NunitoText({
    Key? key,
    this.noCen,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;
  dynamic noCen;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: maven(textStyle),
        textAlign: noCen == null ? TextAlign.center : TextAlign.start);
  }
}

class NotoText extends StatelessWidget {
  const NotoText({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: noto(textStyle),
      textAlign: TextAlign.center,
    );
  }
}

smallText100(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textS(context)
          : textSS(context),
      fontWeight: FontWeight.w100,
      color: color ?? lettersColor(context));
}

smallText400(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textS(context)
          : textSS(context),
      fontWeight: FontWeight.w400,
      color: color ?? lettersColor(context));
}

smallText700(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textS(context)
          : textSS(context),
      fontWeight: FontWeight.w700,
      color: color ?? lettersColor(context));
}

smallText900(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textS(context)
          : textSS(context),
      fontWeight: FontWeight.w900,
      color: color ?? lettersColor(context));
}

normalText100(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textM(context)
          : textS(context),
      fontWeight: FontWeight.w100,
      color: color ?? lettersColor(context));
}

normalText500(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textM(context)
          : textS(context),
      fontWeight: FontWeight.w500,
      color: color ?? lettersColor(context));
}

normalText700(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textM(context)
          : textS(context),
      fontWeight: FontWeight.w700,
      color: color ?? lettersColor(context));
}

normalText900(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textMM(context)
          : textM(context),
      fontWeight: FontWeight.w900,
      color: color ?? lettersColor(context));
}

bigText100(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textBB(context)
          : textMM(context),
      fontWeight: FontWeight.w100,
      color: color ?? lettersColor(context));
}

bigText400(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textBB(context)
          : textMM(context),
      fontWeight: FontWeight.w400,
      color: color ?? lettersColor(context));
}

bigText700(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textBB(context)
          : textMM(context),
      fontWeight: FontWeight.w700,
      color: color ?? lettersColor(context));
}

bigText900(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textBB(context)
          : textMM(context),
      fontWeight: FontWeight.w900,
      color: color ?? lettersColor(context));
}

extraText300(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textE(context)
          : textEE(context),
      fontWeight: FontWeight.w300,
      color: color ?? lettersColor(context));
}

extraText900(BuildContext context, dynamic color) {
  return TextStyle(
      fontSize: orientationScreen(context) == Orientation.portrait
          ? textE(context)
          : textEE(context),
      fontWeight: FontWeight.w900,
      color: color ?? lettersColor(context));
}

lettersColor(BuildContext context) {
  final providerColor = Provider.of<ColorAppProvider>(context);
  if (providerColor.darkMode) {
    return const Color.fromARGB(255, 190, 227, 244);
  } else {
    return CustomTheme.colorFirstDark;
  }
}

maven(TextStyle textStyle) => GoogleFonts.mavenPro(textStyle: textStyle);
nunito(TextStyle textStyle) => GoogleFonts.nunito(textStyle: textStyle);
noto(TextStyle textStyle) => GoogleFonts.notoSans(textStyle: textStyle);

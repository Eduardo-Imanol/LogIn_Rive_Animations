import 'package:flutter/material.dart';

sizeScreen(BuildContext context) => MediaQuery.of(context).size;

orientationScreen(BuildContext context) => MediaQuery.of(context).orientation;

textM(BuildContext context) => MediaQuery.of(context).size.width * 0.023;
textMM(BuildContext context) => MediaQuery.of(context).size.width * 0.027;
textB(BuildContext context) => MediaQuery.of(context).size.width * 0.04;
textBB(BuildContext context) => MediaQuery.of(context).size.width * 0.035;
textS(BuildContext context) => MediaQuery.of(context).size.width * 0.015;
textSS(BuildContext context) => MediaQuery.of(context).size.width * 0.01;
textE(BuildContext context) => MediaQuery.of(context).size.width * 0.05;
textEE(BuildContext context) => MediaQuery.of(context).size.width * 0.06;

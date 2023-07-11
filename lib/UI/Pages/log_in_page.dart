import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_change_1/Providers/color_app_provider.dart';
import 'package:flutter_change_1/UI/Pages/chargin_page.dart';
import 'package:flutter_change_1/UI/Widgets/animated_enum.dart';
import 'package:flutter_change_1/UI/Widgets/widgets_log_in.dart';
import 'package:flutter_change_1/UI/Widgets/widgets_pages.dart';
import 'package:flutter_change_1/models/size_app.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  FocusNode emailFocus = FocusNode();

  FocusNode passwordFocus = FocusNode();

  int isLog = 0;

  dynamic _artboardBear;
  dynamic _artboardCat;

  late RiveAnimationController idleCat;
  late RiveAnimationController idleBear;
  late RiveAnimationController handsDownCat;
  late RiveAnimationController handsUpCat;
  late RiveAnimationController successCat;
  late RiveAnimationController failCat;
  late RiveAnimationController lookDownLeftCat;
  late RiveAnimationController lookDownRightCat;
  late RiveAnimationController lookIdleCat;
  late RiveAnimationController handsDownBear;
  late RiveAnimationController handsUpBear;
  late RiveAnimationController successBear;
  late RiveAnimationController failBear;
  late RiveAnimationController lookDownLeftBear;
  late RiveAnimationController lookDownRightBear;
  late RiveAnimationController lookIdleBear;
  late RiveAnimationController centerEyeBear;
  late RiveAnimationController centerEyeCat;

  @override
  void initState() {
    super.initState();
    idleCat = SimpleAnimation(Animated.idle.name);
    idleBear = SimpleAnimation(Animated.idle.name);
    handsDownCat = SimpleAnimation(Animated.hands_down.name);
    handsUpCat = SimpleAnimation(Animated.hands_up.name);
    successCat = SimpleAnimation(Animated.success.name);
    failCat = SimpleAnimation(Animated.fail.name);
    lookDownRightCat = SimpleAnimation(Animated.Look_down_right.name);
    lookDownLeftCat = SimpleAnimation(Animated.Look_down_left.name);
    lookIdleCat = SimpleAnimation(Animated.look_idle.name);
    handsDownBear = SimpleAnimation(Animated.hands_down.name);
    handsUpBear = SimpleAnimation(Animated.hands_up.name);
    successBear = SimpleAnimation(Animated.success.name);
    failBear = SimpleAnimation(Animated.fail.name);
    lookDownRightBear = SimpleAnimation(Animated.Look_down_right.name);
    lookDownLeftBear = SimpleAnimation(Animated.Look_down_left.name);
    lookIdleBear = SimpleAnimation(Animated.look_idle.name);
    centerEyeCat = SimpleAnimation(Animated.centerEyes.name);
    centerEyeBear = SimpleAnimation(Animated.centerEyes.name);

    rootBundle.load("assets/rive/Kitty.riv").then((value) {
      final file = RiveFile.import(value);

      final artboard = file.mainArtboard;

      artboard.addController(idleCat);
      artboard.addController(lookIdleCat);

      setState(() {
        _artboardCat = artboard;
      });
    });

    rootBundle.load("assets/rive/Bear.riv").then((value) {
      final file = RiveFile.import(value);

      final artboard = file.mainArtboard;

      artboard.addController(idleBear);

      setState(() {
        _artboardBear = artboard;
      });
    });
  }

  void removeAllControllers() {
    _artboardBear!.artboard.removeController(handsDownBear);
    _artboardBear!.artboard.removeController(handsUpBear);
    _artboardBear!.artboard.removeController(successBear);
    _artboardBear!.artboard.removeController(failBear);
    _artboardBear!.artboard.removeController(lookDownRightBear);
    _artboardBear!.artboard.removeController(lookDownLeftBear);
    _artboardBear!.artboard.removeController(lookIdleBear);
    _artboardBear!.artboard.removeController(centerEyeBear);
    _artboardCat!.artboard.removeController(handsDownCat);
    _artboardCat!.artboard.removeController(handsUpCat);
    _artboardCat!.artboard.removeController(successCat);
    _artboardCat!.artboard.removeController(failCat);
    _artboardCat!.artboard.removeController(lookDownRightCat);
    _artboardCat!.artboard.removeController(lookDownLeftCat);
    _artboardCat!.artboard.removeController(lookIdleCat);
    _artboardCat!.artboard.removeController(centerEyeCat);
  }

  void addIdle() {
    removeAllControllers();
    _artboardBear!.artboard.addController(idleBear);

    _artboardCat!.artboard.addController(idleCat);
    _artboardCat!.artboard.addController(centerEyeCat);
    _artboardBear!.artboard.addController(centerEyeBear);
  }

  void addHandsDown() {
    removeAllControllers();
    _artboardBear!.artboard.addController(handsDownBear);
    _artboardCat!.artboard.addController(handsDownCat);
    Timer(const Duration(seconds: 1), addIdle);
    _artboardCat!.artboard.addController(centerEyeCat);
    _artboardBear!.artboard.addController(centerEyeBear);
  }

  void addHansUp() {
    removeAllControllers();
    _artboardBear!.artboard.addController(handsUpBear);
    _artboardCat!.artboard.addController(handsUpCat);
    _artboardCat!.artboard.addController(centerEyeCat);
    _artboardBear!.artboard.addController(centerEyeBear);
  }

  void addSuccess() {
    removeAllControllers();
    _artboardBear!.artboard.addController(successBear);
    _artboardCat!.artboard.addController(successCat);
    _artboardCat!.artboard.addController(centerEyeCat);
    _artboardBear!.artboard.addController(centerEyeBear);
  }

  void addFail() {
    removeAllControllers();
    _artboardBear!.artboard.addController(failBear);
    _artboardCat!.artboard.addController(failCat);
    _artboardCat!.artboard.addController(centerEyeCat);
    _artboardBear!.artboard.addController(centerEyeBear);
  }

  void addLookDownLeft() {
    removeAllControllers();
    _artboardBear!.artboard.addController(lookDownLeftBear);
    _artboardCat!.artboard.addController(lookDownLeftCat);
  }

  void addLookDownRigth() {
    removeAllControllers();
    _artboardBear!.artboard.addController(lookDownRightBear);
    _artboardCat!.artboard.addController(lookDownRightCat);
  }

  void addLookIdle() {
    removeAllControllers();
    _artboardCat!.artboard.addController(lookIdleCat);
    _artboardBear!.artboard.addController(lookIdleBear);
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorAppProvider>(context);

    return SafeArea(
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            const Align(
                alignment: Alignment.topRight, child: AnimatedThemeSwitch()),
            colorProvider.darkMode
                ? FlipInY(child: riveAnimation(context, _artboardCat))
                : Flash(child: riveAnimation(context, _artboardBear)),
            CustomContainerLogIn(
              colorProvider: colorProvider,
              handsDown: addHandsDown,
              handsUp: addHansUp,
              fail: addFail,
              success: addSuccess,
              isLog: isLog,
              emailFocus: emailFocus,
              lookDownLeft: addLookDownLeft,
              lookDownRight: addLookDownRigth,
            ),
          ],
        ),
      ),
    );
  }

  Container riveAnimation(BuildContext context, dynamic animation) {
    return Container(
      color: Colors.transparent,
      width: sizeScreen(context).width,
      height: sizeScreen(context).height * 0.4,
      child: GestureDetector(
        onTap: removeAllControllers,
        onLongPress: removeAllControllers,
        child: animation == null
            ? const CharginPage()
            : Rive(
                artboard: animation!,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}

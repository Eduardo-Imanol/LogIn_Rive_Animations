import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_change_1/Providers/color_app_provider.dart';
import 'package:flutter_change_1/Providers/password_controller.dart';
import 'package:flutter_change_1/Providers/txt_controller.dart';
import 'package:flutter_change_1/UI/Pages/home_page.dart';
import 'package:flutter_change_1/UI/Widgets/widgets_pages.dart';

import 'package:flutter_change_1/models/fonts.dart';
import 'package:flutter_change_1/models/size_app.dart';

class AnimatedThemeSwitch extends StatefulWidget {
  const AnimatedThemeSwitch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedThemeSwitchState createState() => _AnimatedThemeSwitchState();
}

class _AnimatedThemeSwitchState extends State<AnimatedThemeSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: -1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ColorAppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: GestureDetector(
        onTap: () {
          themeProvider.setDarkMode();
          if (_animationController.isCompleted) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value * 0.5 * 3.14159,
              child: child,
            );
          },
          child: Icon(
            themeProvider.darkMode ? Icons.nightlight_round : Icons.wb_sunny,
            color: lettersColor(context),
            size: sizeScreen(context).width * 0.1,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class EmailFormField extends StatelessWidget {
  FocusNode emailFocus;
  final dynamic lookDownRight;
  final dynamic lookDownLeft;

  EmailFormField(
      {super.key,
      required this.emailFocus,
      required this.lookDownLeft,
      required this.lookDownRight});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorAppProvider>(context);
    final txtProvider = Provider.of<TxtFormFieldController>(context);
    return TextFormField(
      focusNode: emailFocus,
      controller: txtProvider.emailController,
      onEditingComplete: emailFocus.unfocus,
      onChanged: (value) {
        txtProvider.getEmail(value);
        txtProvider.setEyes();
        if (txtProvider.eyes < 18) {
          lookDownLeft();
        } else {
          lookDownRight();
        }
      },
      style: noto(normalText500(context, null)),
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: colorProvider.getSacondary(),
          ),
          prefixStyle:
              noto(normalText500(context, colorProvider.getSacondary())),
          border: InputBorder.none,
          labelText: 'Correo Electrónico',
          labelStyle: noto(normalText500(context, colorProvider.getThird()))),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      validator: _defaultValidator,
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu correo electrónico';
    }

    if (!value.contains('@') || !value.contains('.')) {
      return 'Ingresa una dirección de correo electrónico válida';
    }

    return null;
  }
}

class BorderFields extends StatelessWidget {
  const BorderFields({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorAppProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: colorProvider.getSacondary()), // Color de los bordes
            ),
            child: Padding(padding: const EdgeInsets.all(5.0), child: child)));
  }
}

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  final dynamic fail;
  final dynamic success;
  int isLog;
  CustomButton(
      {super.key,
      required this.fail,
      required this.success,
      required this.isLog});

  @override
  // ignore: library_private_types_in_public_api
  _CustomButtonState createState() => _CustomButtonState();
}

void waiting(String message, dynamic txtController, BuildContext context,
    ColorAppProvider color, bool isChange) {
  Future.delayed(const Duration(milliseconds: 1000), () {
    UtilsSnackBar(message, "okey", () {}, context, color);
    txtController.setChargin();
  });
  if (isChange) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));
    });
  } else {
    Future.delayed(const Duration(seconds: 3), () {
      txtController.setChargin();
    });
  }
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorAppProvider>(context);
    final txtController = Provider.of<TxtFormFieldController>(context);
    return GestureDetector(
      onTap: () {
        if (txtController.email == txtController.emailS &&
            txtController.password == txtController.passwordS) {
          txtController.setControllers();
          widget.success();
          setState(() {
            widget.isLog = 2;
          });

          waiting("Bienvenido Eduardo", txtController, context, colorProvider,
              true);
        } else {
          txtController.setControllers();
          widget.fail();
          setState(() {
            widget.isLog = 2;
          });
          waiting("Correo o contraseña no identificado", txtController, context,
              colorProvider, false);
        }
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          width: sizeScreen(context).width * 0.2,
          height: sizeScreen(context).height * 0.03,
          decoration: BoxDecoration(
              color: colorProvider.getText(),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                    color: colorProvider.getgradient(),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(5, 5)),
                BoxShadow(
                    color: colorProvider.getThird(),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(-1, -1))
              ]),
          child:
              NunitoText(text: "LogIn", textStyle: bigText100(context, null))),
    );
  }
}

// ignore: must_be_immutable
class CustomContainerLogIn extends StatelessWidget {
  CustomContainerLogIn(
      {super.key,
      required this.colorProvider,
      required this.handsUp,
      required this.handsDown,
      required this.fail,
      required this.success,
      required this.isLog,
      required this.emailFocus,
      required this.lookDownRight,
      required this.lookDownLeft});

  final ColorAppProvider colorProvider;
  final dynamic handsUp;
  final dynamic handsDown;
  final dynamic fail;
  final dynamic success;
  final FocusNode emailFocus;
  final dynamic lookDownRight;
  final dynamic lookDownLeft;
  int isLog;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          height: sizeScreen(context).height * 0.4,
          decoration: BoxDecoration(
            color: colorProvider.getText(),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: colorProvider.getSacondary()), // Color de los bordes
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BorderFields(
                  child: EmailFormField(
                emailFocus: emailFocus,
                lookDownLeft: lookDownLeft,
                lookDownRight: lookDownRight,
              )),
              Align(
                alignment: Alignment.centerRight,
                child: NunitoText(
                    text: "¿Olvidaste tu contraseña?",
                    textStyle:
                        normalText900(context, colorProvider.getThird())),
              ),
              BorderFields(
                  child: PasswordFormField(
                handsUp: handsUp,
                handsDown: handsDown,
              )),
              CustomButton(
                fail: fail,
                success: success,
                isLog: isLog,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  NunitoText(
                      text: "¿No tienes una cuenta?",
                      textStyle:
                          smallText900(context, colorProvider.getSacondary())),
                  NotoText(
                      text: "Crear cuenta",
                      textStyle:
                          normalText900(context, colorProvider.getThird()))
                ],
              )
            ],
          )),
    );
  }
}

class PasswordFormField extends StatefulWidget {
  final dynamic handsUp;
  final dynamic handsDown;

  const PasswordFormField({
    Key? key,
    required this.handsUp,
    required this.handsDown,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    final passProvider = Provider.of<PasswordProvider>(context);
    final colorProvider = Provider.of<ColorAppProvider>(context);
    final txtProvider = Provider.of<TxtFormFieldController>(context);
    FocusNode focusNode = FocusNode();

    return TextFormField(
      focusNode: focusNode,
      onTap: passProvider.getVisible() ? widget.handsUp : null,
      onEditingComplete: () {
        focusNode.unfocus();
        passProvider.getVisible() ? widget.handsDown() : null;
      },
      onChanged: (value) {
        txtProvider.getPassword(value);
      },
      controller: txtProvider.passwordController,
      obscureText: passProvider.getVisible(),
      obscuringCharacter: "*",
      style: noto(normalText500(context, null)),
      decoration: InputDecoration(
        icon: Icon(
          Icons.key,
          color: colorProvider.getSacondary(),
        ),
        border: InputBorder.none,
        labelText: 'Contraseña',
        labelStyle: noto(normalText500(context, colorProvider.getThird())),
        suffixIcon: GestureDetector(
          onTap: () {
            if (passProvider.getVisible() == true) {
              widget.handsDown();
            } else {
              widget.handsUp();
            }
            passProvider.settVisible();
          },
          child: Icon(
            passProvider.getVisible() ? Icons.visibility_off : Icons.visibility,
            color: passProvider.getVisible()
                ? Colors.grey
                : colorProvider.getThird(),
          ),
        ),
      ),
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      validator: _defaultValidator,
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu contraseña';
    }

    return null;
  }
}

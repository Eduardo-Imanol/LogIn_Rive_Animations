// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_change_1/Providers/color_app_provider.dart';
import 'package:flutter_change_1/Providers/password_controller.dart';
import 'package:flutter_change_1/Providers/txt_controller.dart';
import 'package:flutter_change_1/UI/Pages/chargin_page.dart';
import 'package:flutter_change_1/UI/Pages/log_in_page.dart';
import 'package:flutter_change_1/UI/Widgets/widgets_pages.dart';
import 'package:flutter_change_1/models/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ColorAppProvider>(
            create: (_) => ColorAppProvider(),
          ),
          ChangeNotifierProvider<PasswordProvider>(
            create: (_) => PasswordProvider(),
          ),
          ChangeNotifierProvider<TxtFormFieldController>(
              create: (_) => TxtFormFieldController())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter_Change_1",
          theme: CustomTheme.lightTheme,
          // home: CharginPage(),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final charginProvider = Provider.of<TxtFormFieldController>(context);
    return BackGround(
      child: charginProvider.chargin ? const CharginPage() : const SingIn(),
    );
  }
}

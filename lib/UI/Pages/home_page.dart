import 'package:flutter/material.dart';
import 'package:flutter_change_1/UI/Widgets/widgets_pages.dart';
import 'package:flutter_change_1/models/fonts.dart';
import 'package:flutter_change_1/models/size_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: SizedBox(
        width: sizeScreen(context).width * 1,
        height: sizeScreen(context).height * 1,
        child: Center(
          child: NotoText(
              text: "Home Page", textStyle: extraText900(context, null)),
        ),
      ),
    );
  }
}

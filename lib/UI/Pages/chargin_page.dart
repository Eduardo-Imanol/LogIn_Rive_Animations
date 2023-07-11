import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_1/Providers/color_app_provider.dart';
import 'package:flutter_change_1/UI/Widgets/widgets_pages.dart';
import 'package:flutter_change_1/models/fonts.dart';
import 'package:flutter_change_1/models/size_app.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CharginPage extends StatelessWidget {
  const CharginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorAppProvider>(context);
    return BackGround(
      child: SizedBox(
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: sizeScreen(context).width * .3,
              child: DefaultTextStyle(
                  style: nunito(bigText400(context, null)),
                  child: AnimatedTextKit(
                    pause: const Duration(days: 1),
                    totalRepeatCount: 20,
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Cargando...',
                        speed: const Duration(milliseconds: 200),
                      ),
                      TypewriterAnimatedText(
                        'Cargando...',
                        speed: const Duration(milliseconds: 300),
                      ),
                      TypewriterAnimatedText(
                        'Cargando...',
                        speed: const Duration(milliseconds: 300),
                      ),
                      TypewriterAnimatedText(
                        'Cargando...',
                        speed: const Duration(milliseconds: 300),
                      ),
                    ],
                  )),
            ),
            SpinKitChasingDots(
              color: color.getThird(),
            ),
          ],
        )),
      ),
    );
  }
}

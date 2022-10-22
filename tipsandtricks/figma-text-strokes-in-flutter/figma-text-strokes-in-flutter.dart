// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class TextWithStroke extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign align;
  final double strokeWidth;
  final Color strokeColor;

  const TextWithStroke({
    super.key,
    required this.text,
    this.style,
    this.align = TextAlign.center,
    this.strokeWidth = 2,
    this.strokeColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: style?.withStroke(
            strokeWidth: strokeWidth,
            strokeColor: strokeColor,
          ),
        ),
        Text(
          text,
          textAlign: align,
          style: style,
        ),
      ],
    );
  }
}

extension StrokeTextStyle on TextStyle {
  TextStyle withStroke({
    required double strokeWidth,
    required Color strokeColor,
  }) =>
      copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: TextWithStroke(
          text: 'Flutter with Stroke',
          style: TextStyle(
            fontSize: 120,
            color: Color(0xFF7DCFFF),
          ),
        ),
      ),
    );
  }
}

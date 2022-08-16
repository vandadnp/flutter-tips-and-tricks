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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

extension RemoveAll on String {
  String removeAll(Iterable<String> values) => values.fold(
      this,
      (
        String result,
        String pattern,
      ) =>
          result.replaceAll(pattern, ''));
}

extension AsHtmlColorToColor on String {
  Color htmlColorToColor() => Color(
        int.parse(
          removeAll(['0x', '#']).padLeft(8, 'ff'),
          radix: 16,
        ),
      );
}

class Clipper extends CustomClipper<Path> {
  static const variance = 0.1;
  static const reverse = 1.0 - variance;

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0.0, size.height * Clipper.variance);
    path.lineTo(size.width * Clipper.variance, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * Clipper.reverse);
    path.lineTo(size.width * Clipper.reverse, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height * Clipper.variance);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CutEdges extends StatelessWidget {
  final Widget child;

  const CutEdges({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(),
      child: child,
    );
  }
}

class ElevatedNetworkImage extends StatelessWidget {
  final String url;
  const ElevatedNetworkImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      color: Colors.white,
      clipper: Clipper(),
      elevation: 20.0,
      clipBehavior: Clip.none,
      shadowColor: Colors.white.withAlpha(200),
      child: CutEdges(
        child: Image.network(url),
      ),
    );
  }
}

const imageUrl = 'https://wallpaperaccess.com/full/1326907.jpg';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '24283b'.htmlColorToColor(),
      body: const Center(
        child: FractionallySizedBox(
          heightFactor: 0.7,
          child: ElevatedNetworkImage(
            url: imageUrl,
          ),
        ),
      ),
    );
  }
}

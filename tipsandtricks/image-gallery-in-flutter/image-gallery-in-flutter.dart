// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'dart:math' as math show pi;

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

extension AsDegreesToRadians<T extends num> on T {
  double asDegreesToRadians() => toDouble() * (math.pi / 180.0);
}

final imageUrls = [
  'https://bit.ly/3x7J5Qt',
  'https://bit.ly/3ywI8l6',
  'https://bit.ly/3jOueGG',
];

class NetworkImage extends StatelessWidget {
  final int index;
  final String url;
  const NetworkImage({Key? key, required this.index, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -((index * 10.0).asDegreesToRadians()),
      child: Transform.translate(
        offset: Offset(-20.0 * index.toDouble(), 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            url,
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

extension IterationWithIndex<T> on Iterable<T> {
  Iterable<E> mapWithIndexAndCount<E>(
    E Function(int index, int count, T value) f,
  ) =>
      Iterable.generate(length, (i) => f(i, length, elementAt(i)));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery in Flutter'),
      ),
      body: Center(
        heightFactor: 1.5,
        child: FractionallySizedBox(
          widthFactor: 0.6,
          heightFactor: 0.4,
          child: Transform.translate(
            offset: const Offset(20.0, 0.0),
            child: Transform.rotate(
              angle: 10.asDegreesToRadians(),
              child: Stack(
                children: imageUrls
                    .mapWithIndexAndCount(
                      (index, count, url) => NetworkImage(
                        index: count - index - 1,
                        url: url,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

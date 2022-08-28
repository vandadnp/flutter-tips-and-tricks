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

class RowWithSpacing extends Row {
  RowWithSpacing({
    super.key,
    double spacing = 8,
    bool hasLeadingSpace = false,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    List<Widget> children = const [],
  }) : super(
          children: [
            ...hasLeadingSpace ? [SizedBox(width: spacing)] : <Widget>[],
            ...children.expand(
              (w) => [
                w,
                SizedBox(width: spacing),
              ],
            )
          ],
        );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RowWithSpacing in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RowWithSpacing(
          hasLeadingSpace: true,
          spacing: 32.0,
          children: [
            Icon(Icons.camera, size: 64.0, color: Colors.teal[200]),
            Icon(Icons.post_add, size: 64.0, color: Colors.teal[200]),
          ],
        ),
      ),
    );
  }
}

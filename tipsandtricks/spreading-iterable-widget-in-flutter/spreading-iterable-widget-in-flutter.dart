// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

enum Option {
  one(title: 'One title', subtitle: 'One subtitle'),
  two(title: 'Two title', subtitle: 'Two subtitle');

  final String title;
  final String subtitle;
  const Option({
    required this.title,
    required this.subtitle,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network('https://bit.ly/3ywI8l6'),
          const Separator(),
          ...Option.values.map(
            (option) => ListTile(
              title: Headline6(option),
              subtitle: Subtitle1(option),
            ),
          ),
        ],
      ),
    );
  }
}

class Subtitle1 extends StatelessWidget {
  final Option option;
  const Subtitle1(
    this.option, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      option.subtitle,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}

class Headline6 extends StatelessWidget {
  final Option option;
  const Headline6(
    this.option, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      option.title,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: const [
          SizedBox(height: 8),
          Divider(
            color: Colors.black87,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// extension Log on Object {
//   void log() => devtools.log(toString());
// }

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
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter')),
        body: const HomePage(),
      ),
    );
  }
}

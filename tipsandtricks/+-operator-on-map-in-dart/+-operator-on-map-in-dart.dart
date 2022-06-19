// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

typedef Name = String;
typedef Age = int;

const Map<Name, Age> twoPeople = {
  'foo': 20,
  'bar': 30,
};

extension AddOperator<K, V> on Map<K, V> {
  Map<K, V> operator +(Map<K, V> other) => {...this}..addAll(other);
}

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() {
  final threePeople = {...twoPeople} + {'baz': 40};
  threePeople.log(); // {foo: 20, bar: 30, baz: 40}
  final fourPeople = {...threePeople} + {'qux': 50};
  fourPeople.log(); // {foo: 20, bar: 30, baz: 40, qux: 50}
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Map in Flutter',
        ),
      ),
    );
  }
}

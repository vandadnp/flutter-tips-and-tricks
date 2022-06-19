// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:meta/meta.dart' show useResult;

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

extension Log on Object {
  void log() => devtools.log(toString());
}

@immutable
abstract class Thing {
  final String name;
  const Thing({required this.name});
}

@immutable
class Person extends Thing {
  final int age;

  const Person({
    required String name,
    required this.age,
  }) : super(name: name);
}

const Thing thing = Person(
  name: 'Foo',
  age: 20,
);

extension MapIfOfType<T> on T {
  R? mapIfOfType<E, R>(R Function(E) f) {
    final self = this;
    if (self is E) {
      return f(self);
    } else {
      return null;
    }
  }
}

void insteadOfThis() {
  final String name;
  if (thing is Person) {
    name = thing.name;
  } else {
    name = 'Unknown';
  }
  'Name is $name'.log();
}

void doThis() {
  final name = thing.mapIfOfType((Person p) => p.name) ?? 'Unknown';
  'Name is $name'.log();
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    insteadOfThis();
    doThis();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Generic Object Map in Dart"),
      ),
    );
  }
}

// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

@immutable
class Person {
  final String firstName;
  final String lastName;
  const Person({
    required this.firstName,
    required this.lastName,
  });
}

const foo = 'Foo';
const bar = 'Bar';

Person createPerson([
  String firstName = foo,
  String lastName = bar,
]) =>
    Person(
      firstName: firstName,
      lastName: lastName,
    );

void testIt() {
  final person = createPerson();
  assert(person.firstName == foo);
  assert(person.lastName == bar);
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clipboard in Flutter',
        ),
      ),
    );
  }
}

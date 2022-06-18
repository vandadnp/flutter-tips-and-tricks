// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Person {
  final String fullName;
  final int age;

  const Person({
    required this.fullName,
    required this.age,
  });

  @override
  String toString() => {
        'fullName': fullName,
        'age': age,
      }.toString();
}

Person constructPerson({
  required String firstName,
  required String lastName,
  required int age,
}) =>
    Person(
      fullName: '$firstName $lastName',
      age: age,
    );

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() {
  final person = Function.apply(
    constructPerson,
    [],
    {
      #firstName: 'Foo',
      #lastName: 'Bar',
      #age: 20,
    },
  ) as Person;
  person.log(); // {fullName: Foo Bar, age: 20}
}

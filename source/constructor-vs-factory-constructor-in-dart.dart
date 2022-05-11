// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart';

@immutable
class Person {
  final String firstName;
  final String lastName;

  const Person({
    required this.firstName,
    required this.lastName,
  });

  const Person.fooBar()
      : firstName = 'Foo',
        lastName = 'Bar';

  factory Person.bazQux() => const Person(
        firstName: 'Baz',
        lastName: 'Qux',
      );

  factory Person.unknown() {
    // do some work here if you need to
    return const Person(
      firstName: 'Unknown',
      lastName: 'Unknown',
    );
  }
}

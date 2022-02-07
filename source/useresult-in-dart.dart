// Free Flutter Course 💙 https://linktr.ee/vandadnp
// Want to support my work 🤝? https://buymeacoffee.com/vandad

import 'package:meta/meta.dart' show useResult;

class Person {
  final String firstName;
  final String lastName;

  const Person({
    required this.firstName,
    required this.lastName,
  });

  @useResult
  String fullName() => '$firstName $lastName';
}

void printFullName() {
  const Person(
    firstName: 'Foo',
    lastName: 'Bar',
  ).fullName();
}

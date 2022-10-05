// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🦄 8+ Hours RxSwift Coursde  https://youtu.be/xBFWMYmm9ro
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

@immutable
class Person {
  final String name;
  final int age;
  final String address;

  const Person(
    this.name,
    this.age,
    this.address,
  );

  @override
  String toString() => 'Name: $name, '
      'Age: $age, '
      'Address: $address';
}

void testIt() {
  const person = Person(
    'Vandad',
    42,
    '123 Main St',
  );
  // Name: Vandad, Age: 42, Address: 123 Main St
  person.log();
}

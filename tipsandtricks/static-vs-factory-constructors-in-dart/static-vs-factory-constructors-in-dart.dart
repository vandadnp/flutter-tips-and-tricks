// 🐦 Twitter                   https://twitter.com/vandadnp
// 🔵 LinkedIn                  https://linkedin.com/in/vandadnp
// 🎥 YouTube                   https://youtube.com/c/vandadnp
// 💙 Free Flutter Course       https://linktr.ee/vandadnp
// 📦 11+ Hours Bloc Course     https://youtu.be/Mn254cnduOY
// 🔶 7+ Hours MobX Course      https://youtu.be/7Od55PBxYkI
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

import 'package:flutter/foundation.dart' show immutable;

@immutable
class Person<P> {
  final String name;
  final P property;

  const factory Person(String name, P property) = Person.fromProperties;

  const Person.fromProperties(this.name, this.property);

  factory Person.fromPropertiesFactory(String name, P property) =>
      Person.fromProperties(name, property);

  static Person<P> fromPropertiesStatic<P>(String name, P property) =>
      Person.fromProperties(name, property);

  factory Person.fooBar(P property) =>
      Person.fromProperties('Foo Bar', property);

  static Person<P> bazQux<P>(P property) =>
      Person.fromProperties('Baz Qux', property);
}

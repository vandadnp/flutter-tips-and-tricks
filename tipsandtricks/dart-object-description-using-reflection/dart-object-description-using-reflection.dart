// 🎥 YouTube    https://youtube.com/c/vandadnp
// 🐦 Twitter    https://twitter.com/vandadnp
// 🔵 LinkedIn   https://linkedin.com/in/vandadnp

import 'dart:mirrors';

void main(List<String> args) {
  print(
    Person(
      name: 'John',
      age: 30,
    ),
  );
  print(
    House(
      address: '123 Main St',
      rooms: 6,
    ),
  );
}

mixin HasDescription {
  @override
  String toString() {
    final reflection = reflect(this);
    final thisType = MirrorSystem.getName(
      reflection.type.simpleName,
    );
    final variables =
        reflection.type.declarations.values.whereType<VariableMirror>();
    final properties = <String, dynamic>{
      for (final field in variables)
        field.asKey: reflection
            .getField(
              field.simpleName,
            )
            .reflectee
    }.toString();
    return '$thisType = $properties';
  }
}

extension AsKey on VariableMirror {
  String get asKey {
    final fieldName = MirrorSystem.getName(simpleName);
    final fieldType = MirrorSystem.getName(type.simpleName);
    return '$fieldName ($fieldType)';
  }
}

class Person with HasDescription {
  final String name;
  final int age;
  Person({
    required this.name,
    required this.age,
  });
}

class House with HasDescription {
  final String address;
  final int rooms;
  House({
    required this.address,
    required this.rooms,
  });
}

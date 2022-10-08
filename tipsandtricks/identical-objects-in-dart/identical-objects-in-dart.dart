import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void testIt() {
  const person1 = Person(name: 'Vandad', age: 42);
  const person2 = Person(name: 'Vandad', age: 42);
  const person3 = Person(name: 'Vandad', age: 43);
  identical(person1, person2).log(); // true
  (person1 == person2).log(); // true
  (person1 == person3).log(); // false
  (person2 == person3).log(); // false
  (person3 == person3).log(); // true
}

@immutable
class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => Object.hashAll([
        name,
        age,
      ]);
}

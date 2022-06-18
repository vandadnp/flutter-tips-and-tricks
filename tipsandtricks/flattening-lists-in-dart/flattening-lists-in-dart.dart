// Want to support my work 🤝? https://buymeacoffee.com/vandad

class Person {
  final String name;
  const Person(this.name);
  @override
  String toString() => 'Person: $name';
}

class House {
  final List<Person>? tennants;
  final List<Person> builders;
  const House({
    required this.tennants,
    required this.builders,
  });
}

const houses = [
  House(tennants: null, builders: [
    Person('Builder 1'),
  ]),
  House(tennants: [
    Person('Tennant 1'),
    Person('Tennant 2'),
  ], builders: [
    Person('Builder 3')
  ]),
];

extension OptionalFlattend<T> on Iterable<List<T>?> {
  Iterable<T> flattened() => expand((e) => e ?? []);
}

void testOptionalFlatten() {
  final allTennants = houses.map((h) => h.tennants).flattened();
  print(allTennants); // Person: Tennant 1, Person: Tennant 2
}

extension Flattend<T> on Iterable<List<T>> {
  Iterable<T> flattened() => expand((e) => e);
}

void testNonOptionalFlatten() {
  final allBuilders = houses.map((h) => h.builders).flattened();
  print(allBuilders); // Person: Builder 1, Person: Builder 2
}

void testIt() {
  testOptionalFlatten();
  testNonOptionalFlatten();
}
